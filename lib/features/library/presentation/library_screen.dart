import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/core_providers.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_indicator.dart';
import 'add_anime_screen.dart';
import 'anime_detail_screen.dart';
import 'library_providers.dart';
import 'widgets/anime_list_tile.dart';
import 'widgets/status_filter_bar.dart';

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
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => const AddAnimeScreen()),
            );
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
                      ref
                          .read(selectedStatusProvider.notifier)
                          .setStatus(newStatus);
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
                      message:
                          'No anime in ${status?.displayName ?? "library"}. Search to add some!',
                    );
                  }
                  return ListView.separated(
                    itemCount: animeList.length,
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(left: 92),
                      child: SizedBox(
                        height: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: CupertinoColors.separator,
                          ),
                        ),
                      ),
                    ),
                    itemBuilder: (context, index) {
                      final anime = animeList[index];
                      return Dismissible(
                        key: ValueKey(anime.id),
                        direction: DismissDirection.horizontal,
                        background: Container(
                          color: anime.isFavorite
                              ? CupertinoColors.systemGrey
                              : CupertinoColors.systemPink,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(
                            anime.isFavorite
                                ? CupertinoIcons.heart_slash
                                : CupertinoIcons.heart_fill,
                            color: CupertinoColors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                          color: CupertinoColors.systemRed,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(
                            CupertinoIcons.delete,
                            color: CupertinoColors.white,
                          ),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            ref
                                .read(animeRepositoryProvider)
                                .toggleFavorite(anime.id);
                            return false;
                          }
                          return await showCupertinoDialog<bool>(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: const Text('Delete Anime'),
                              content: const Text(
                                'Are you sure you want to remove this anime from your library?',
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('Cancel'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                ),
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  child: const Text('Delete'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                ),
                              ],
                            ),
                          );
                        },
                        onDismissed: (_) {
                          ref
                              .read(animeRepositoryProvider)
                              .deleteEntry(anime.id);
                        },
                        child: AnimeListTile(
                          anime: anime,
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) =>
                                    AnimeDetailScreen(animeId: anime.id),
                              ),
                            );
                          },
                          onToggleFavorite: () {
                            ref
                                .read(animeRepositoryProvider)
                                .toggleFavorite(anime.id);
                          },
                          onDelete: () {
                            ref
                                .read(animeRepositoryProvider)
                                .deleteEntry(anime.id);
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => const LoadingIndicator(),
                error: (error, stack) => ErrorState(
                  message: 'Failed to load library. Please try again.',
                  onRetry: () {
                    ref.invalidate(animeListProvider);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
