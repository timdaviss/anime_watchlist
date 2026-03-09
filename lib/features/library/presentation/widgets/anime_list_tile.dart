import 'package:flutter/cupertino.dart';

import '../../domain/anime_entry.dart';
import '../../domain/watch_status.dart';
import '../../../../shared/widgets/anime_cover_image.dart';

class AnimeListTile extends StatelessWidget {
  final AnimeEntry anime;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;
  final VoidCallback onDelete;

  const AnimeListTile({
    super.key,
    required this.anime,
    required this.onTap,
    required this.onToggleFavorite,
    required this.onDelete,
  });

  Color _getStatusColor(WatchStatus status) {
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

  Widget _buildRatingStars(BuildContext context, double rating) {
    final stars = (rating / 2).clamp(0.0, 5.0);
    final fullStars = stars.floor();
    final hasHalfStar = stars - fullStars >= 0.5;
    final emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < fullStars; i++)
          const Icon(
            CupertinoIcons.star_fill,
            size: 12,
            color: CupertinoColors.systemYellow,
          ),
        if (hasHalfStar)
          const Icon(
            CupertinoIcons.star_lefthalf_fill,
            size: 12,
            color: CupertinoColors.systemYellow,
          ),
        for (int i = 0; i < emptyStars; i++)
          Icon(
            CupertinoIcons.star,
            size: 12,
            color: CupertinoColors.systemGrey4.resolveFrom(context),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(anime.watchStatus);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'anime-cover-${anime.id}',
              child: AnimeCoverImage(
                url: anime.coverImageUrl,
                title: anime.title,
                width: 64,
                height: 96,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    anime.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (anime.titleJapanese != null &&
                      anime.titleJapanese!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      anime.titleJapanese!,
                      style: TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.secondaryLabel.resolveFrom(
                          context,
                        ),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: statusColor.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Text(
                          anime.watchStatus.displayName,
                          style: TextStyle(
                            fontSize: 11,
                            color: statusColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (anime.rating != null) ...[
                        const SizedBox(width: 8),
                        _buildRatingStars(context, anime.rating!),
                      ],
                    ],
                  ),
                  if (anime.totalEpisodes != null &&
                      anime.totalEpisodes! > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${anime.episodesWatched}/${anime.totalEpisodes} episodes',
                      style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.secondaryLabel.resolveFrom(
                          context,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
