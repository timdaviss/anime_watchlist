import 'package:anime_watchlist/features/library/data/library_share_service.dart';
import 'package:anime_watchlist/features/library/domain/anime_entry.dart';
import 'package:anime_watchlist/features/library/domain/watch_status.dart';
import 'package:flutter_test/flutter_test.dart';

AnimeEntry buildEntry({
  String id = 'test-id',
  String title = 'Test Anime',
  String? titleJapanese,
  String? synopsis,
  String? coverImageUrl,
  int? totalEpisodes,
  int episodesWatched = 0,
  WatchStatus watchStatus = WatchStatus.watching,
  double? rating,
  String? notes,
  bool isFavorite = false,
  String? genres,
  int? malId,
  int? anilistId,
  AnimeSource source = AnimeSource.manual,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final now = DateTime.now();
  return AnimeEntry(
    id: id,
    title: title,
    titleJapanese: titleJapanese,
    synopsis: synopsis,
    coverImageUrl: coverImageUrl,
    totalEpisodes: totalEpisodes,
    episodesWatched: episodesWatched,
    watchStatus: watchStatus,
    rating: rating,
    notes: notes,
    isFavorite: isFavorite,
    genres: genres,
    malId: malId,
    anilistId: anilistId,
    source: source,
    createdAt: createdAt ?? now,
    updatedAt: updatedAt ?? now,
  );
}

void main() {
  late LibraryShareService service;

  setUp(() {
    service = LibraryShareService();
  });

  group('formatRecommendation', () {
    test('fully populated entry includes all expected sections in order', () {
      final entry = buildEntry(
        title: 'Fullmetal Alchemist: Brotherhood',
        titleJapanese: '鋼の錬金術師',
        synopsis:
            'A young alchemist and his brother search for the Philosopher\'s Stone...',
        totalEpisodes: 64,
        episodesWatched: 64,
        watchStatus: WatchStatus.completed,
        rating: 9.5,
        notes: 'Private notes should never be shared.',
        genres: 'Action, Adventure, Fantasy',
      );

      final formatted = service.formatRecommendation(entry);

      expect(
        formatted,
        equals(
          'Fullmetal Alchemist: Brotherhood\n'
          '(鋼の錬金術師)\n'
          '\n'
          'Status: Completed\n'
          'Rating: 9.5/10\n'
          'Episodes: 64/64\n'
          'Genres: Action, Adventure, Fantasy\n'
          '\n'
          'A young alchemist and his brother search for the Philosopher\'s Stone...\n'
          '\n'
          '— Shared from Anime Watchlist',
        ),
      );
    });

    test('minimal entry includes only title status and footer', () {
      final entry = buildEntry();

      final formatted = service.formatRecommendation(entry);

      expect(
        formatted,
        equals(
          'Test Anime\n'
          '\n'
          'Status: Watching\n'
          '\n'
          '— Shared from Anime Watchlist',
        ),
      );
    });

    test('shows rating when present but omits episodes when unavailable', () {
      final entry = buildEntry(rating: 8.2, totalEpisodes: null);

      final formatted = service.formatRecommendation(entry);

      expect(formatted, contains('Rating: 8.2/10'));
      expect(formatted, isNot(contains('Episodes:')));
    });

    test('shows episodes when present but omits rating when unavailable', () {
      final entry = buildEntry(
        rating: null,
        totalEpisodes: 24,
        episodesWatched: 12,
      );

      final formatted = service.formatRecommendation(entry);

      expect(formatted, contains('Episodes: 12/24'));
      expect(formatted, isNot(contains('Rating:')));
    });

    test('never includes notes in formatted output', () {
      final entry = buildEntry(notes: 'Do not share this private note.');

      final formatted = service.formatRecommendation(entry);

      expect(formatted, isNot(contains('Do not share this private note.')));
      expect(formatted, isNot(contains('notes')));
    });

    test('omits genres line when genres is empty', () {
      final entry = buildEntry(genres: '');

      final formatted = service.formatRecommendation(entry);

      expect(formatted, isNot(contains('Genres:')));
    });
  });

  group('formatList', () {
    test('returns graceful message for empty list', () {
      final formatted = service.formatList([]);

      expect(
        formatted,
        equals(
          'My Anime Watchlist\n\n'
          'No anime in your library yet.\n\n'
          '— Shared from Anime Watchlist',
        ),
      );
    });

    test('uses singular anime label for single entry', () {
      final formatted = service.formatList([
        buildEntry(title: 'Steins;Gate', watchStatus: WatchStatus.completed),
      ]);

      expect(formatted, startsWith('My Anime Watchlist (1 anime)'));
      expect(formatted, contains('Completed (1):'));
      expect(formatted, contains('  - Steins;Gate'));
    });

    test('groups by status in watch status enum order', () {
      final formatted = service.formatList([
        buildEntry(title: 'Dropped Show', watchStatus: WatchStatus.dropped),
        buildEntry(title: 'Completed Show', watchStatus: WatchStatus.completed),
        buildEntry(title: 'Watching Show', watchStatus: WatchStatus.watching),
        buildEntry(title: 'On Hold Show', watchStatus: WatchStatus.onHold),
        buildEntry(
          title: 'Plan To Watch Show',
          watchStatus: WatchStatus.planToWatch,
        ),
      ]);

      final watchingIndex = formatted.indexOf('Watching (1):');
      final completedIndex = formatted.indexOf('Completed (1):');
      final planToWatchIndex = formatted.indexOf('Plan to Watch (1):');
      final onHoldIndex = formatted.indexOf('On Hold (1):');
      final droppedIndex = formatted.indexOf('Dropped (1):');

      expect(watchingIndex, greaterThan(-1));
      expect(completedIndex, greaterThan(watchingIndex));
      expect(planToWatchIndex, greaterThan(completedIndex));
      expect(onHoldIndex, greaterThan(planToWatchIndex));
      expect(droppedIndex, greaterThan(onHoldIndex));
    });

    test('shows only non-empty groups', () {
      final formatted = service.formatList([
        buildEntry(title: 'A', watchStatus: WatchStatus.completed),
        buildEntry(title: 'B', watchStatus: WatchStatus.completed),
      ]);

      expect(formatted, contains('Completed (2):'));
      expect(formatted, isNot(contains('Watching (')));
      expect(formatted, isNot(contains('Plan to Watch (')));
      expect(formatted, isNot(contains('On Hold (')));
      expect(formatted, isNot(contains('Dropped (')));
    });

    test('entry lines include rating and episode metadata when available', () {
      final formatted = service.formatList([
        buildEntry(
          title: 'Attack on Titan',
          watchStatus: WatchStatus.watching,
          rating: 8.5,
          totalEpisodes: 75,
          episodesWatched: 48,
        ),
        buildEntry(
          title: 'One Piece',
          watchStatus: WatchStatus.watching,
          totalEpisodes: 1000,
          episodesWatched: 500,
        ),
      ]);

      expect(formatted, contains('  - Attack on Titan — 8.5/10 — 48/75 ep'));
      expect(formatted, contains('  - One Piece — 500/1000 ep'));
    });

    test('includes share footer', () {
      final formatted = service.formatList([buildEntry()]);

      expect(formatted, endsWith('— Shared from Anime Watchlist'));
    });
  });
}
