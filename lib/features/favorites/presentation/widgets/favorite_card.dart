import 'package:flutter/cupertino.dart';

import '../../../../shared/widgets/anime_cover_image.dart';
import '../../../library/domain/anime_entry.dart';
import '../../../library/presentation/anime_detail_screen.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, required this.anime});

  final AnimeEntry anime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (_) => AnimeDetailScreen(animeId: anime.id),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'anime-cover-${anime.id}',
              child: AnimeCoverImage(
                url: anime.coverImageUrl,
                title: anime.title,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 86,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CupertinoColors.black.withValues(alpha: 0),
                      CupertinoColors.black.withValues(alpha: 0.74),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: Text(
                anime.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (anime.rating != null)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.star_fill,
                        size: 12,
                        color: CupertinoColors.systemYellow,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        anime.rating!.toStringAsFixed(1),
                        style: const TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
