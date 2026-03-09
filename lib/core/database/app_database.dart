import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../features/library/domain/watch_status.dart';

part 'app_database.g.dart';

class AnimeEntries extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get titleJapanese => text().nullable()();
  TextColumn get synopsis => text().nullable()();
  TextColumn get coverImageUrl => text().nullable()();
  IntColumn get totalEpisodes => integer().nullable()();
  IntColumn get episodesWatched => integer().withDefault(const Constant(0))();
  TextColumn get watchStatus => textEnum<WatchStatus>()();
  RealColumn get rating => real().nullable().customConstraint(
    'CHECK (rating IS NULL OR (rating >= 1.0 AND rating <= 10.0))',
  )();
  TextColumn get notes => text().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  TextColumn get genres => text().nullable()();
  IntColumn get malId => integer().nullable()();
  IntColumn get anilistId => integer().nullable()();
  TextColumn get source => textEnum<AnimeSource>()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'anime_watchlist.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [AnimeEntries], daos: [AnimeEntriesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (migrator, from, to) async {
        if (from < 2) {
          await migrator.addColumn(animeEntries, animeEntries.episodesWatched);
        }
      },
    );
  }
}

@DriftAccessor(tables: [AnimeEntries])
class AnimeEntriesDao extends DatabaseAccessor<AppDatabase>
    with _$AnimeEntriesDaoMixin {
  AnimeEntriesDao(super.db);

  Stream<List<AnimeEntry>> watchAll() => (select(
    animeEntries,
  )..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)])).watch();

  Stream<List<AnimeEntry>> watchAllSorted(SortOption sort) {
    final query = select(animeEntries);
    query.orderBy([_buildOrdering(sort)]);
    return query.watch();
  }

  Stream<List<AnimeEntry>> watchByStatus(WatchStatus status) {
    return (select(animeEntries)
          ..where((tbl) => tbl.watchStatus.equalsValue(status))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]))
        .watch();
  }

  Stream<List<AnimeEntry>> watchByStatusSorted(
    WatchStatus status,
    SortOption sort,
  ) {
    final query = select(animeEntries)
      ..where((tbl) => tbl.watchStatus.equalsValue(status));
    query.orderBy([_buildOrdering(sort)]);
    return query.watch();
  }

  Stream<List<AnimeEntry>> watchAllWithSearch(String query) {
    if (query.isEmpty) {
      return watchAll();
    }

    return (select(animeEntries)
          ..where((tbl) => tbl.title.like('%$query%'))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]))
        .watch();
  }

  Stream<List<AnimeEntry>> watchByStatusWithSearch(
    WatchStatus status,
    String query,
  ) {
    if (query.isEmpty) {
      return watchByStatus(status);
    }

    return (select(animeEntries)
          ..where(
            (tbl) =>
                tbl.watchStatus.equalsValue(status) &
                tbl.title.like('%$query%'),
          )
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]))
        .watch();
  }

  Stream<List<AnimeEntry>> watchFavorites() {
    return (select(animeEntries)
          ..where((tbl) => tbl.isFavorite.equals(true))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]))
        .watch();
  }

  Stream<AnimeEntry?> watchById(String id) {
    return (select(
      animeEntries,
    )..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();
  }

  Future<AnimeEntry?> getById(String id) {
    return (select(
      animeEntries,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<AnimeEntry?> getByMalId(int malId) {
    return (select(
      animeEntries,
    )..where((tbl) => tbl.malId.equals(malId))).getSingleOrNull();
  }

  Future<AnimeEntry?> getByAnilistId(int anilistId) {
    return (select(
      animeEntries,
    )..where((tbl) => tbl.anilistId.equals(anilistId))).getSingleOrNull();
  }

  Future<int> countAll() async {
    final countExp = animeEntries.id.count();
    final query = selectOnly(animeEntries)..addColumns([countExp]);
    final row = await query.getSingle();
    return row.read(countExp)!;
  }

  Future<void> insertEntry(AnimeEntriesCompanion companion) async {
    await into(
      animeEntries,
    ).insert(companion, mode: InsertMode.insertOrReplace);
  }

  Future<void> updateEntry(AnimeEntriesCompanion companion) async {
    final idValue = companion.id;
    if (!idValue.present) {
      throw ArgumentError('id must be present for updateEntry');
    }
    await (update(
      animeEntries,
    )..where((tbl) => tbl.id.equals(idValue.value))).write(companion);
  }

  Future<void> deleteEntry(String id) async {
    await (delete(animeEntries)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> toggleFavorite(String id) async {
    final entry = await getById(id);
    if (entry == null) {
      return;
    }
    await (update(animeEntries)..where((tbl) => tbl.id.equals(id))).write(
      AnimeEntriesCompanion(
        isFavorite: Value(!entry.isFavorite),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<Map<WatchStatus, int>> countByStatus() async {
    final countExp = animeEntries.id.count();
    final query = selectOnly(animeEntries)
      ..addColumns([animeEntries.watchStatus, countExp])
      ..groupBy([animeEntries.watchStatus]);
    final rows = await query.get();
    final counts = <WatchStatus, int>{};
    for (final row in rows) {
      final statusString = row.read(animeEntries.watchStatus);
      final count = row.read(countExp);
      if (statusString != null && count != null) {
        final status = $AnimeEntriesTable.$converterwatchStatus.fromSql(
          statusString,
        );
        counts[status] = count;
      }
    }
    return counts;
  }

  OrderingTerm Function($AnimeEntriesTable) _buildOrdering(SortOption sort) {
    return switch (sort) {
      SortOption.updatedAt => (tbl) => OrderingTerm.desc(tbl.updatedAt),
      SortOption.title => (tbl) => OrderingTerm.asc(tbl.title),
      SortOption.rating => (tbl) => OrderingTerm.desc(tbl.rating),
      SortOption.createdAt => (tbl) => OrderingTerm.desc(tbl.createdAt),
      SortOption.status => (tbl) => OrderingTerm.asc(tbl.watchStatus),
    };
  }
}
