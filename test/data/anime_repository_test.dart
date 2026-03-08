import 'package:anime_watchlist/core/database/app_database.dart';
import 'package:anime_watchlist/features/library/data/anime_repository.dart';
import 'package:anime_watchlist/features/library/domain/anime_entry.dart'
    as model;
import 'package:anime_watchlist/features/library/domain/watch_status.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late AnimeRepository repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = AnimeRepository(database.animeEntriesDao);
  });

  tearDown(() async {
    await database.close();
  });

  model.AnimeEntry buildEntry() {
    final now = DateTime.now();
    return model.AnimeEntry(
      id: 'id-1',
      title: 'Cowboy Bebop',
      watchStatus: WatchStatus.planToWatch,
      source: AnimeSource.jikan,
      createdAt: now,
      updatedAt: now,
    );
  }

  test('insert and get by id', () async {
    final entry = buildEntry();
    await repository.insertEntry(entry);

    final saved = await repository.getById(entry.id);
    expect(saved, isNotNull);
    expect(saved!.title, entry.title);
    expect(saved.watchStatus, WatchStatus.planToWatch);
  });

  test('update entry fields', () async {
    final entry = buildEntry();
    await repository.insertEntry(entry);

    final updated = entry.copyWith(
      watchStatus: WatchStatus.watching,
      rating: 8.5,
      updatedAt: DateTime.now(),
    );
    await repository.updateEntry(updated);

    final reloaded = await repository.getById(entry.id);
    expect(reloaded!.watchStatus, WatchStatus.watching);
    expect(reloaded.rating, 8.5);
  });

  test('toggle favorite flips flag', () async {
    final entry = buildEntry();
    await repository.insertEntry(entry);

    await repository.toggleFavorite(entry.id);
    final favorite = await repository.getById(entry.id);
    expect(favorite!.isFavorite, isTrue);

    await repository.toggleFavorite(entry.id);
    final unfavorite = await repository.getById(entry.id);
    expect(unfavorite!.isFavorite, isFalse);
  });

  test('delete removes entry', () async {
    final entry = buildEntry();
    await repository.insertEntry(entry);

    await repository.deleteEntry(entry.id);
    final deleted = await repository.getById(entry.id);
    expect(deleted, isNull);
  });
}
