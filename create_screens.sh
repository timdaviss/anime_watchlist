#!/bin/bash

cat << 'INNER_EOF' > lib/features/library/presentation/library_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/providers/core_providers.dart';
import '../domain/anime_entry.dart';
import '../domain/watch_status.dart';

part 'library_providers.g.dart';

@riverpod
class SelectedStatus extends _$SelectedStatus {
  @override
  WatchStatus? build() => null;

  void setStatus(WatchStatus? status) {
    state = status;
  }
}

@riverpod
Stream<List<AnimeEntry>> animeList(AnimeListRef ref) {
  final repository = ref.watch(animeRepositoryProvider);
  final status = ref.watch(selectedStatusProvider);

  if (status == null) {
    return repository.watchAll();
  } else {
    return repository.watchByStatus(status);
  }
}
INNER_EOF

cat << 'INNER_EOF' > lib/features/library/presentation/widgets/anime_list_tile.dart
import 'package:flutter/cupertino.dart';
import '../domain/anime_entry.dart';
import '../domain/watch_status.dart';
import '../../../shared/widgets/anime_cover_image.dart';

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

  String _getStatusLabel(WatchStatus status) {
    switch (status) {
      case WatchStatus.watching:
        return 'Watching';
      case WatchStatus.completed:
        return 'Completed';
      case WatchStatus.planToWatch:
        return 'Plan to Watch';
      case WatchStatus.onHold:
        return 'On Hold';
      case WatchStatus.dropped:
        return 'Dropped';
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(anime.watchStatus);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: CupertinoColors.systemBackground,
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
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (anime.titleJapanese != null && anime.titleJapanese!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      anime.titleJapanese!,
                      style: const TextStyle(fontSize: 13, color: CupertinoColors.secondaryLabel),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: statusColor.withOpacity(0.5)),
                        ),
                        child: Text(
                          _getStatusLabel(anime.watchStatus),
                          style: TextStyle(fontSize: 11, color: statusColor, fontWeight: FontWeight.w500),
                        ),
                      ),
                      if (anime.rating != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          '★ ${anime.rating}',
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: CupertinoColors.systemYellow),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
INNER_EOF

cat << 'INNER_EOF' > lib/features/library/presentation/library_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'library_providers.dart';
import 'widgets/anime_list_tile.dart';
import 'widgets/status_filter_bar.dart';
import 'anime_detail_screen.dart';
import 'add_anime_screen.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../../shared/widgets/error_state.dart';
import '../../core/providers/core_providers.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(selectedStatusProvider);
    final animeListAsync = ref.watch(animeListProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('My Anime'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => const AddAnimeScreen(),
            ));
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: StatusFilterBar(
                    selectedStatus: status,
                    onStatusChanged: (newStatus) {
                      ref.read(selectedStatusProvider.notifier).setStatus(newStatus);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: animeListAsync.when(
                data: (animeList) {
                  if (animeList.isEmpty) {
                    return EmptyState(
                      icon: CupertinoIcons.book,
                      message: 'No anime in ${status?.name ?? 'library'}. Search to add some!',
                    );
                  }
                  return ListView.separated(
                    itemCount: animeList.length,
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(left: 92),
                      child: Divider(height: 1, color: CupertinoColors.separator),
                    ),
                    itemBuilder: (context, index) {
                      final anime = animeList[index];
                      return Dismissible(
                        key: ValueKey(anime.id),
                        direction: DismissDirection.horizontal,
                        background: Container(
                          color: CupertinoColors.systemRed,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(CupertinoIcons.delete, color: CupertinoColors.white),
                        ),
                        secondaryBackground: Container(
                          color: CupertinoColors.systemRed,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(CupertinoIcons.delete, color: CupertinoColors.white),
                        ),
                        confirmDismiss: (direction) async {
                          return await showCupertinoDialog<bool>(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: const Text('Delete Anime'),
                              content: const Text('Are you sure you want to remove this anime from your library?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('Cancel'),
                                  onPressed: () => Navigator.of(context).pop(false),
                                ),
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  child: const Text('Delete'),
                                  onPressed: () => Navigator.of(context).pop(true),
                                ),
                              ],
                            ),
                          );
                        },
                        onDismissed: (_) {
                          ref.read(animeRepositoryProvider).deleteEntry(anime.id);
                        },
                        child: AnimeListTile(
                          anime: anime,
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => AnimeDetailScreen(animeId: anime.id),
                            ));
                          },
                          onToggleFavorite: () {
                            ref.read(animeRepositoryProvider).toggleFavorite(anime.id);
                          },
                          onDelete: () {
                            ref.read(animeRepositoryProvider).deleteEntry(anime.id);
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => const LoadingIndicator(),
                error: (error, stack) => ErrorState(
                  message: error.toString(),
                  onRetry: () => ref.invalidate(animeListProvider),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  final double height;
  final Color color;

  const Divider({super.key, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}
INNER_EOF

chmod +x create_screens.sh
./create_screens.sh
