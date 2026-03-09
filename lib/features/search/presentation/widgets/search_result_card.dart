import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/anime_cover_image.dart';
import '../../../library/domain/watch_status.dart';
import '../../domain/anime_search_result.dart';
import '../search_providers.dart';

class SearchResultCard extends ConsumerWidget {
  const SearchResultCard({
    super.key,
    required this.result,
    required this.onTap,
  });

  final AnimeSearchResult result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inLibraryAsync = ref.watch(
      isInLibraryProvider(result.sourceId, result.source),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground.resolveFrom(context),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: CupertinoColors.separator.resolveFrom(context),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimeCoverImage(
              url: result.coverImageUrl,
              title: result.title,
              width: 84,
              height: 126,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (result.titleJapanese?.isNotEmpty ?? false) ...[
                    const SizedBox(height: 4),
                    Text(
                      result.titleJapanese!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.secondaryLabel.resolveFrom(
                          context,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  _MetaRow(
                    label: 'Episodes',
                    value: result.totalEpisodes?.toString() ?? 'Unknown',
                  ),
                  _MetaRow(
                    label: 'Score',
                    value: result.communityScore?.toStringAsFixed(1) ?? 'N/A',
                  ),
                  _MetaRow(
                    label: 'Status',
                    value: result.airingStatus ?? 'Unknown',
                  ),
                  if (result.genres != null && result.genres!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      result.genres!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.tertiaryLabel.resolveFrom(
                          context,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  inLibraryAsync.when(
                    data: (libraryInfo) {
                      if (libraryInfo == null) {
                        return const SizedBox.shrink();
                      }

                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _statusColor(
                            libraryInfo.status,
                          ).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'In Library - ${libraryInfo.status.displayName}',
                          style: TextStyle(
                            fontSize: 13,
                            color: _statusColor(libraryInfo.status),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                    loading: SizedBox.shrink,
                    error: (error, stackTrace) => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _statusColor(WatchStatus status) {
    return switch (status) {
      WatchStatus.watching => CupertinoColors.systemBlue,
      WatchStatus.completed => CupertinoColors.systemGreen,
      WatchStatus.planToWatch => CupertinoColors.systemOrange,
      WatchStatus.onHold => CupertinoColors.systemYellow,
      WatchStatus.dropped => CupertinoColors.systemRed,
    };
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text.rich(
        TextSpan(
          text: '$label: ',
          style: TextStyle(
            fontSize: 13,
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
