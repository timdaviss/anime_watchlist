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

class SearchCacheEntries extends Table {
  TextColumn get query => text()();
  TextColumn get source => textEnum<AnimeSource>()();
  TextColumn get resultsJson => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column<Object>>? get primaryKey => {query, source};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'anime_watchlist.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [AnimeEntries, SearchCacheEntries],
  daos: [AnimeEntriesDao, SearchCacheDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (migrator, from, to) async {
        if (from < 2) {
          await migrator.createTable(searchCacheEntries);
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

  Stream<List<AnimeEntry>> watchByStatus(WatchStatus status) {
    return (select(animeEntries)
          ..where((tbl) => tbl.watchStatus.equalsValue(status))
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
    final rows = await select(animeEntries).get();
    return rows.length;
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
    final rows = await select(animeEntries).get();
    final counts = <WatchStatus, int>{};
    for (final row in rows) {
      counts.update(row.watchStatus, (value) => value + 1, ifAbsent: () => 1);
    }
    return counts;
  }
}

@DriftAccessor(tables: [SearchCacheEntries])
class SearchCacheDao extends DatabaseAccessor<AppDatabase>
    with _$SearchCacheDaoMixin {
  SearchCacheDao(super.db);

  Future<String?> getCachedResults(String query, AnimeSource source) async {
    final normalizedQuery = query.toLowerCase().trim();
    final result =
        await (select(searchCacheEntries)..where(
              (tbl) =>
                  tbl.query.equals(normalizedQuery) &
                  tbl.source.equalsValue(source),
            ))
            .getSingleOrNull();
    return result?.resultsJson;
  }

  Future<void> cacheResults(
    String query,
    AnimeSource source,
    String resultsJson,
  ) async {
    final normalizedQuery = query.toLowerCase().trim();
    await into(searchCacheEntries).insertOnConflictUpdate(
      SearchCacheEntriesCompanion(
        query: Value(normalizedQuery),
        source: Value(source),
        resultsJson: Value(resultsJson),
        cachedAt: Value(DateTime.now()),
      ),
    );
    await _evictOldEntries();
  }

  Future<void> _evictOldEntries() async {
    final allEntries = await (select(
      searchCacheEntries,
    )..orderBy([(tbl) => OrderingTerm.desc(tbl.cachedAt)])).get();

    if (allEntries.length <= 100) {
      return;
    }

    final toDelete = allEntries.sublist(100);
    for (final entry in toDelete) {
      await (delete(searchCacheEntries)..where(
            (tbl) =>
                tbl.query.equals(entry.query) &
                tbl.source.equalsValue(entry.source),
          ))
          .go();
    }
  }

  Future<void> clearCache() async {
    await delete(searchCacheEntries).go();
  }
}
