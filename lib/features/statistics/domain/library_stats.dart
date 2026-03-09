import '../../library/domain/watch_status.dart';

class LibraryStats {
  const LibraryStats({
    required this.totalCount,
    required this.statusCounts,
    required this.genreCounts,
    required this.ratingDistribution,
    required this.averageRating,
    required this.totalEpisodes,
  });

  final int totalCount;
  final Map<WatchStatus, int> statusCounts;
  final Map<String, int> genreCounts;
  final Map<int, int> ratingDistribution;
  final double? averageRating;
  final int totalEpisodes;
}
