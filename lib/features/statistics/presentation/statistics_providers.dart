import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../library/domain/watch_status.dart';
import '../domain/library_stats.dart';

part 'statistics_providers.g.dart';

@riverpod
Stream<LibraryStats> libraryStats(Ref ref) {
  final repository = ref.watch(animeRepositoryProvider);

  return repository.watchAll().map((entries) {
    final statusCounts = <WatchStatus, int>{};
    final genreCounts = <String, int>{};
    final ratingDistribution = <int, int>{};
    var ratingSum = 0.0;
    var ratingCount = 0;
    var totalEpisodes = 0;

    for (final entry in entries) {
      statusCounts.update(
        entry.watchStatus,
        (value) => value + 1,
        ifAbsent: () => 1,
      );

      final rawGenres = entry.genres;
      if (rawGenres != null && rawGenres.trim().isNotEmpty) {
        for (final genre
            in rawGenres
                .split(',')
                .map((item) => item.trim())
                .where((item) => item.isNotEmpty)) {
          genreCounts.update(genre, (value) => value + 1, ifAbsent: () => 1);
        }
      }

      final rating = entry.rating;
      if (rating != null) {
        final bucket = rating.round().clamp(1, 10).toInt();
        ratingDistribution.update(
          bucket,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
        ratingSum += rating;
        ratingCount++;
      }

      totalEpisodes += entry.totalEpisodes ?? 0;
    }

    return LibraryStats(
      totalCount: entries.length,
      statusCounts: statusCounts,
      genreCounts: genreCounts,
      ratingDistribution: ratingDistribution,
      averageRating: ratingCount == 0 ? null : ratingSum / ratingCount,
      totalEpisodes: totalEpisodes,
    );
  });
}
