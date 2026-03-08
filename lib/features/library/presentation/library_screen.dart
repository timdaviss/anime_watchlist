import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/core_providers.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../domain/anime_entry.dart';
import '../domain/watch_status.dart';
import 'add_anime_screen.dart';
import 'anime_detail_screen.dart';
import 'library_providers.dart';
import 'widgets/anime_list_tile.dart';
import 'widgets/status_filter_bar.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    final status = ref.watch(selectedStatusProvider);
    final animeListAsync = ref.watch(animeListProvider);
    final selectedIds = ref.watch(selectionModeProvider);
    final isSelecting = selectedIds.isNotEmpty;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: isSelecting
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: _clearSelection,
                child: const Text('Cancel'),
              )
            : null,
        middle: Text(
          isSelecting ? '${selectedIds.length} Selected' : 'My Anime',
        ),
        trailing: isSelecting
            ? animeListAsync.when(
                data: (animeList) => CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: animeList.isEmpty
                      ? null
                      : () => _selectAll(
                          animeList.map((entry) => entry.id).toList(),
                        ),
                  child: const Text('Select All'),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              )
            : CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const AddAnimeScreen(),
                    ),
                  );
                },
                child: const Icon(CupertinoIcons.add),
              ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
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
                      final isSelected = selectedIds.contains(anime.id);
                      final tile = _buildAnimeTile(
                        anime: anime,
                        isSelecting: isSelecting,
                        isSelected: isSelected,
                      );

                      if (isSelecting) {
                        return tile;
                      }

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
                            await ref
                                .read(animeRepositoryProvider)
                                .toggleFavorite(anime.id);
                            return false;
                          }
                          return _showDeleteConfirmation(single: true);
                        },
                        onDismissed: (_) {
                          ref
                              .read(animeRepositoryProvider)
                              .deleteEntry(anime.id);
                        },
                        child: tile,
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
            if (isSelecting)
              _BatchActionBar(
                onChangeStatus: _showStatusPicker,
                onToggleFavorite: () => _toggleFavorites(animeListAsync),
                onDelete: _deleteSelected,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimeTile({
    required AnimeEntry anime,
    required bool isSelecting,
    required bool isSelected,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: () {
        if (!isSelecting) {
          ref.read(selectionModeProvider.notifier).toggle(anime.id);
        }
      },
      child: Container(
        color: isSelected
            ? CupertinoColors.systemIndigo.withValues(alpha: 0.1)
            : null,
        child: Row(
          children: [
            if (isSelecting)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Icon(
                  isSelected
                      ? CupertinoIcons.checkmark_circle_fill
                      : CupertinoIcons.circle,
                  color: isSelected
                      ? CupertinoColors.systemIndigo
                      : CupertinoColors.systemGrey3,
                ),
              ),
            Expanded(
              child: AnimeListTile(
                anime: anime,
                onTap: () {
                  if (isSelecting) {
                    ref.read(selectionModeProvider.notifier).toggle(anime.id);
                  } else {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) =>
                            AnimeDetailScreen(animeId: anime.id),
                      ),
                    );
                  }
                },
                onToggleFavorite: () {
                  ref.read(animeRepositoryProvider).toggleFavorite(anime.id);
                },
                onDelete: () {
                  ref.read(animeRepositoryProvider).deleteEntry(anime.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearSelection() {
    ref.read(selectionModeProvider.notifier).clear();
  }

  void _selectAll(List<String> ids) {
    ref.read(selectionModeProvider.notifier).selectAll(ids);
  }

  Future<bool?> _showDeleteConfirmation({required bool single}) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(single ? 'Delete Anime' : 'Delete Selected Anime'),
        content: Text(
          single
              ? 'Are you sure you want to remove this anime from your library?'
              : 'Are you sure you want to remove all selected anime from your library?',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _showStatusPicker() async {
    final selectedIds = ref.read(selectionModeProvider);
    if (selectedIds.isEmpty) {
      return;
    }

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Change Status'),
        actions: [
          for (final status in WatchStatus.values)
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.of(context).pop();
                await ref
                    .read(animeRepositoryProvider)
                    .updateStatusBatch(selectedIds.toList(), status);
                _clearSelection();
              },
              child: Text(status.displayName),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  Future<void> _toggleFavorites(
    AsyncValue<List<AnimeEntry>> animeListAsync,
  ) async {
    final selectedIds = ref.read(selectionModeProvider);
    if (selectedIds.isEmpty) {
      return;
    }

    final animeList = animeListAsync.asData?.value ?? const <AnimeEntry>[];
    final selectedEntries = animeList
        .where((entry) => selectedIds.contains(entry.id))
        .toList();

    if (selectedEntries.isEmpty) {
      return;
    }

    final shouldFavorite = selectedEntries.any((entry) => !entry.isFavorite);
    await ref
        .read(animeRepositoryProvider)
        .setFavorites(selectedIds.toList(), shouldFavorite);
    _clearSelection();
  }

  Future<void> _deleteSelected() async {
    final selectedIds = ref.read(selectionModeProvider);
    if (selectedIds.isEmpty) {
      return;
    }

    final shouldDelete = await _showDeleteConfirmation(single: false) ?? false;
    if (!shouldDelete) {
      return;
    }

    await ref.read(animeRepositoryProvider).deleteEntries(selectedIds.toList());
    _clearSelection();
  }
}

class _BatchActionBar extends StatelessWidget {
  const _BatchActionBar({
    required this.onChangeStatus,
    required this.onToggleFavorite,
    required this.onDelete,
  });

  final VoidCallback onChangeStatus;
  final VoidCallback onToggleFavorite;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        border: Border(
          top: BorderSide(
            color: CupertinoColors.separator.resolveFrom(context),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onChangeStatus,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.arrow_2_circlepath, size: 24),
                  Text('Change Status', style: TextStyle(fontSize: 11)),
                ],
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onToggleFavorite,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.heart, size: 24),
                  Text('Toggle Favorite', style: TextStyle(fontSize: 11)),
                ],
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onDelete,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.delete,
                    size: 24,
                    color: CupertinoColors.systemRed,
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 11,
                      color: CupertinoColors.systemRed,
                    ),
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
