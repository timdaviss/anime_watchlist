import 'package:anime_watchlist/features/library/domain/anime_entry.dart';
import 'package:anime_watchlist/features/library/domain/watch_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 1, 1);

  test('creates AnimeEntry with expected values', () {
    final entry = AnimeEntry(
      id: 'entry-1',
      title: 'Fullmetal Alchemist: Brotherhood',
      watchStatus: WatchStatus.watching,
      source: AnimeSource.jikan,
      createdAt: now,
      updatedAt: now,
    );

    expect(entry.id, 'entry-1');
    expect(entry.title, 'Fullmetal Alchemist: Brotherhood');
    expect(entry.watchStatus, WatchStatus.watching);
    expect(entry.isFavorite, isFalse);
  });

  test('copyWith updates only selected fields', () {
    final entry = AnimeEntry(
      id: 'entry-2',
      title: 'Steins;Gate',
      watchStatus: WatchStatus.planToWatch,
      source: AnimeSource.anilist,
      createdAt: now,
      updatedAt: now,
    );

    final updated = entry.copyWith(
      watchStatus: WatchStatus.completed,
      isFavorite: true,
    );

    expect(updated.watchStatus, WatchStatus.completed);
    expect(updated.isFavorite, isTrue);
    expect(updated.title, 'Steins;Gate');
  });

  test('equality compares value semantics', () {
    final a = AnimeEntry(
      id: 'entry-3',
      title: 'Attack on Titan',
      watchStatus: WatchStatus.completed,
      source: AnimeSource.manual,
      createdAt: now,
      updatedAt: now,
    );
    final b = AnimeEntry(
      id: 'entry-3',
      title: 'Attack on Titan',
      watchStatus: WatchStatus.completed,
      source: AnimeSource.manual,
      createdAt: now,
      updatedAt: now,
    );

    expect(a, equals(b));
  });

  test('JSON round-trip preserves all fields', () {
    final entry = AnimeEntry(
      id: 'json-1',
      title: 'Spirited Away',
      titleJapanese: '\u5343\u3068\u5343\u5C0B\u306E\u795E\u96A0\u3057',
      synopsis: 'A young girl enters a mysterious world.',
      coverImageUrl: 'https://example.com/cover.jpg',
      totalEpisodes: 1,
      watchStatus: WatchStatus.completed,
      rating: 9.5,
      notes: 'Masterpiece',
      isFavorite: true,
      genres: 'Adventure, Fantasy',
      malId: 199,
      anilistId: 199,
      source: AnimeSource.jikan,
      createdAt: now,
      updatedAt: now,
    );

    final json = entry.toJson();
    final restored = AnimeEntry.fromJson(json);

    expect(restored, equals(entry));
    expect(restored.id, 'json-1');
    expect(restored.title, 'Spirited Away');
    expect(
      restored.titleJapanese,
      '\u5343\u3068\u5343\u5C0B\u306E\u795E\u96A0\u3057',
    );
    expect(restored.watchStatus, WatchStatus.completed);
    expect(restored.rating, 9.5);
    expect(restored.isFavorite, isTrue);
    expect(restored.genres, 'Adventure, Fantasy');
    expect(restored.source, AnimeSource.jikan);
  });
}
