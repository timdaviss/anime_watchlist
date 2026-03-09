import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../library/domain/watch_status.dart';
import '../domain/library_stats.dart';
import 'statistics_providers.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(libraryStatsProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Stats')),
      child: SafeArea(
        child: statsAsync.when(
          data: (stats) {
            if (stats.totalCount == 0) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    'No stats yet. Add some anime to your library!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: CupertinoColors.secondaryLabel.resolveFrom(
                        context,
                      ),
                    ),
                  ),
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
              children: [
                _SummaryCards(stats: stats),
                CupertinoListSection.insetGrouped(
                  header: const Text('Status Breakdown'),
                  children: [
                    for (final status in WatchStatus.values)
                      _StatusRow(
                        label: status.displayName,
                        count: stats.statusCounts[status] ?? 0,
                        color: _statusColor(status),
                        total: stats.totalCount,
                      ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  header: const Text('Top Genres'),
                  children: [..._buildGenreRows(stats.genreCounts)],
                ),
                CupertinoListSection.insetGrouped(
                  header: const Text('Rating Distribution (1-10)'),
                  children: [
                    _RatingChart(distribution: stats.ratingDistribution),
                  ],
                ),
              ],
            );
          },
          loading: () => const LoadingIndicator(),
          error: (error, stack) => ErrorState(
            message: 'Failed to load statistics. Please try again.',
            onRetry: () => ref.invalidate(libraryStatsProvider),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildGenreRows(Map<String, int> genreCounts) {
    if (genreCounts.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text('No genre data yet.'),
        ),
      ];
    }

    final sorted = genreCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final maxCount = sorted.first.value;

    return [
      for (final entry in sorted.take(8))
        _BarRow(
          label: entry.key,
          count: entry.value,
          maxCount: maxCount,
          barColor: CupertinoColors.systemIndigo,
        ),
    ];
  }
}

class _SummaryCards extends StatelessWidget {
  const _SummaryCards({required this.stats});

  final LibraryStats stats;

  @override
  Widget build(BuildContext context) {
    final average = stats.averageRating;

    return SizedBox(
      height: 128,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _StatCard(
            title: 'Total Anime',
            value: stats.totalCount.toString(),
            accent: CupertinoColors.systemBlue,
          ),
          const SizedBox(width: 12),
          _StatCard(
            title: 'Avg Rating',
            value: average == null ? '—' : average.toStringAsFixed(1),
            accent: CupertinoColors.systemYellow,
          ),
          const SizedBox(width: 12),
          _StatCard(
            title: 'Episodes',
            value: stats.totalEpisodes.toString(),
            accent: CupertinoColors.systemPurple,
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.accent,
  });

  final String title;
  final String value;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CupertinoColors.secondarySystemGroupedBackground.resolveFrom(
          context,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CupertinoColors.separator.resolveFrom(context),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 26,
            height: 4,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.label,
    required this.count,
    required this.color,
    required this.total,
  });

  final String label;
  final int count;
  final Color color;
  final int total;

  @override
  Widget build(BuildContext context) {
    final fraction = total == 0 ? 0.0 : count / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(label)),
            Text(
              '$count',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: Container(
            height: 8,
            color: CupertinoColors.systemGrey5.resolveFrom(context),
            child: FractionallySizedBox(
              widthFactor: fraction,
              alignment: Alignment.centerLeft,
              child: Container(color: color),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _BarRow extends StatelessWidget {
  const _BarRow({
    required this.label,
    required this.count,
    required this.maxCount,
    required this.barColor,
  });

  final String label;
  final int count;
  final int maxCount;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    final fraction = maxCount == 0 ? 0.0 : count / maxCount;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$count',
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Container(
              height: 8,
              color: CupertinoColors.systemGrey5.resolveFrom(context),
              child: FractionallySizedBox(
                widthFactor: fraction,
                alignment: Alignment.centerLeft,
                child: Container(color: barColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingChart extends StatelessWidget {
  const _RatingChart({required this.distribution});

  final Map<int, int> distribution;

  @override
  Widget build(BuildContext context) {
    final maxCount = distribution.values.fold<int>(0, (a, b) => a > b ? a : b);

    return SizedBox(
      height: 170,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var rating = 1; rating <= 10; rating++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: _RatingBar(
                  label: '$rating',
                  count: distribution[rating] ?? 0,
                  maxCount: maxCount,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _RatingBar extends StatelessWidget {
  const _RatingBar({
    required this.label,
    required this.count,
    required this.maxCount,
  });

  final String label;
  final int count;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    final ratio = maxCount == 0 ? 0.0 : count / maxCount;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$count',
          style: TextStyle(
            fontSize: 10,
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
          ),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Container(
                width: 18,
                height: 120,
                color: CupertinoColors.systemGrey5.resolveFrom(context),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: ratio,
                    child: Container(color: CupertinoColors.systemTeal),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
          ),
        ),
      ],
    );
  }
}

Color _statusColor(WatchStatus status) {
  switch (status) {
    case WatchStatus.watching:
      return CupertinoColors.systemBlue;
    case WatchStatus.completed:
      return CupertinoColors.systemGreen;
    case WatchStatus.planToWatch:
      return CupertinoColors.systemOrange;
    case WatchStatus.onHold:
      return CupertinoColors.systemYellow;
    case WatchStatus.dropped:
      return CupertinoColors.systemRed;
  }
}
