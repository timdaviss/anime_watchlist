import '../domain/anime_entry.dart';
import '../domain/watch_status.dart';

class LibraryShareService {
  String formatRecommendation(AnimeEntry entry) {
    final buffer = StringBuffer();

    buffer.writeln(entry.title);

    if (_hasText(entry.titleJapanese)) {
      buffer.writeln('(${entry.titleJapanese!.trim()})');
    }

    buffer.writeln();
    buffer.writeln('Status: ${entry.watchStatus.displayName}');

    if (entry.rating != null) {
      buffer.writeln('Rating: ${entry.rating!.toStringAsFixed(1)}/10');
    }

    if (entry.totalEpisodes != null && entry.totalEpisodes! > 0) {
      buffer.writeln(
        'Episodes: ${entry.episodesWatched}/${entry.totalEpisodes}',
      );
    }

    if (_hasText(entry.genres)) {
      buffer.writeln('Genres: ${entry.genres!.trim()}');
    }

    if (_hasText(entry.synopsis)) {
      buffer.writeln();
      buffer.writeln(entry.synopsis!.trim());
    }

    buffer.writeln();
    buffer.write('— Shared from Anime Watchlist');

    return buffer.toString();
  }

  String formatList(List<AnimeEntry> entries) {
    if (entries.isEmpty) {
      return 'My Anime Watchlist\n\nNo anime in your library yet.\n\n— Shared from Anime Watchlist';
    }

    final countLabel = entries.length == 1 ? 'anime' : 'anime';
    final buffer = StringBuffer();
    buffer.writeln('My Anime Watchlist (${entries.length} $countLabel)');
    buffer.writeln();

    for (final status in WatchStatus.values) {
      final groupedEntries = entries
          .where((entry) => entry.watchStatus == status)
          .toList();

      if (groupedEntries.isEmpty) {
        continue;
      }

      buffer.writeln('${status.displayName} (${groupedEntries.length}):');

      for (final entry in groupedEntries) {
        final lineBuffer = StringBuffer('  - ${entry.title}');

        if (entry.rating != null) {
          lineBuffer.write(' — ${entry.rating!.toStringAsFixed(1)}/10');
        }

        if (entry.totalEpisodes != null && entry.totalEpisodes! > 0) {
          lineBuffer.write(
            ' — ${entry.episodesWatched}/${entry.totalEpisodes} ep',
          );
        }

        buffer.writeln(lineBuffer.toString());
      }

      buffer.writeln();
    }

    buffer.write('— Shared from Anime Watchlist');
    return buffer.toString();
  }

  bool _hasText(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
}
