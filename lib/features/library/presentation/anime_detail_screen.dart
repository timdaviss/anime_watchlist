import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/core_providers.dart';
import '../../../shared/utils/date_formatter.dart';
import '../../../shared/widgets/anime_cover_image.dart';
import '../../../shared/widgets/error_state.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../domain/anime_entry.dart';
import '../domain/watch_status.dart';
import 'library_providers.dart';
import 'widgets/rating_widget.dart';

class AnimeDetailScreen extends ConsumerStatefulWidget {
  const AnimeDetailScreen({super.key, required this.animeId});

  final String animeId;

  @override
  ConsumerState<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends ConsumerState<AnimeDetailScreen> {
  late final TextEditingController _notesController;
  late final FocusNode _notesFocusNode;
  late final ScrollController _scrollController;
  final GlobalKey _notesSectionKey = GlobalKey();
  bool _isSynopsisExpanded = false;
  bool _notesInitialized = false;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController();
    _notesFocusNode = FocusNode();
    _scrollController = ScrollController();
    _notesFocusNode.addListener(_onNotesFocusChanged);
  }

  @override
  void dispose() {
    _notesFocusNode.removeListener(_onNotesFocusChanged);
    _notesFocusNode.dispose();
    _notesController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _focusNotesField() {
    _notesFocusNode.requestFocus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notesContext = _notesSectionKey.currentContext;
      if (notesContext != null) {
        Scrollable.ensureVisible(
          notesContext,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          alignment: 0.1,
        );
      }
    });
  }

  void _onNotesFocusChanged() {
    if (!_notesFocusNode.hasFocus) {
      _saveNotes();
    }
  }

  void _saveNotes() {
    final anime = ref.read(animeDetailProvider(widget.animeId)).value;
    if (anime == null) return;
    final notes = _notesController.text.trim().isEmpty
        ? null
        : _notesController.text.trim();
    if (notes != anime.notes) {
      ref
          .read(animeRepositoryProvider)
          .updateEntry(anime.copyWith(notes: notes, updatedAt: DateTime.now()));
    }
  }

  Future<void> _showStatusPicker(AnimeEntry anime) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Change Status'),
        actions: WatchStatus.values
            .map(
              (status) => CupertinoActionSheetAction(
                onPressed: () {
                  ref
                      .read(animeRepositoryProvider)
                      .updateEntry(
                        anime.copyWith(
                          watchStatus: status,
                          updatedAt: DateTime.now(),
                        ),
                      );
                  Navigator.of(context).pop();
                },
                child: Text(status.displayName),
              ),
            )
            .toList(),
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animeAsync = ref.watch(animeDetailProvider(widget.animeId));
    final repository = ref.watch(animeRepositoryProvider);

    return animeAsync.when(
      loading: () => const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: LoadingIndicator(),
      ),
      error: (error, stack) => CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child: ErrorState(
          message: 'Failed to load anime details.',
          onRetry: () => ref.invalidate(animeDetailProvider(widget.animeId)),
        ),
      ),
      data: (anime) {
        if (anime == null) {
          return const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(),
            child: Center(child: Text('Anime not found')),
          );
        }

        if (!_notesInitialized && anime.notes != null) {
          _notesController.text = anime.notes!;
          _notesInitialized = true;
        } else if (!_notesInitialized) {
          _notesInitialized = true;
        }

        final genres =
            anime.genres
                ?.split(',')
                .map((genre) => genre.trim())
                .where((genre) => genre.isNotEmpty)
                .toList() ??
            <String>[];

        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _focusNotesField,
              child: const Text('Edit'),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: ListView(
              controller: _scrollController,
              children: [
                Hero(
                  tag: 'anime-cover-${anime.id}',
                  child: AnimeCoverImage(
                    url: anime.coverImageUrl,
                    title: anime.title,
                    width: double.infinity,
                    height: 300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anime.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (anime.titleJapanese?.isNotEmpty ?? false) ...[
                        const SizedBox(height: 4),
                        Text(
                          anime.titleJapanese!,
                          style: TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.secondaryLabel.resolveFrom(
                              context,
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _showStatusPicker(anime),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey6.resolveFrom(
                                  context,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    anime.watchStatus.displayName,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    CupertinoIcons.chevron_down,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          RatingWidget(
                            initialRating: anime.rating ?? 0,
                            onRatingUpdate: (rating) {
                              repository.updateEntry(
                                anime.copyWith(
                                  rating: rating,
                                  updatedAt: DateTime.now(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (anime.totalEpisodes != null &&
                          anime.totalEpisodes! > 0)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Episode Progress',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: anime.episodesWatched > 0
                                      ? () {
                                          repository.updateEntry(
                                            anime.copyWith(
                                              episodesWatched:
                                                  anime.episodesWatched - 1,
                                              updatedAt: DateTime.now(),
                                            ),
                                          );
                                        }
                                      : null,
                                  child: const Icon(
                                    CupertinoIcons.minus_circle,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${anime.episodesWatched} / ${anime.totalEpisodes}',
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(3),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 6,
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              final progress =
                                                  anime.totalEpisodes! > 0
                                                  ? (anime.episodesWatched /
                                                            anime
                                                                .totalEpisodes!)
                                                        .clamp(0.0, 1.0)
                                                  : 0.0;
                                              return Stack(
                                                children: [
                                                  Container(
                                                    width: constraints.maxWidth,
                                                    color: CupertinoColors
                                                        .systemGrey5,
                                                  ),
                                                  Container(
                                                    width:
                                                        constraints.maxWidth *
                                                        progress,
                                                    color: CupertinoColors
                                                        .systemIndigo,
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed:
                                      anime.episodesWatched <
                                          anime.totalEpisodes!
                                      ? () {
                                          repository.updateEntry(
                                            anime.copyWith(
                                              episodesWatched:
                                                  anime.episodesWatched + 1,
                                              updatedAt: DateTime.now(),
                                            ),
                                          );
                                        }
                                      : null,
                                  child: const Icon(
                                    CupertinoIcons.plus_circle,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => repository.toggleFavorite(anime.id),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              anime.isFavorite
                                  ? CupertinoIcons.heart_fill
                                  : CupertinoIcons.heart,
                              color: anime.isFavorite
                                  ? CupertinoColors.systemRed
                                  : null,
                              size: 22,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              anime.isFavorite
                                  ? 'Favorited'
                                  : 'Add to Favorites',
                              style: TextStyle(
                                fontSize: 15,
                                color: anime.isFavorite
                                    ? CupertinoColors.systemRed
                                    : CupertinoColors.systemBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (genres.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: genres
                              .map(
                                (genre) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.systemIndigo
                                        .withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    genre,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: CupertinoColors.systemIndigo,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                      if (anime.synopsis?.isNotEmpty ?? false) ...[
                        const SizedBox(height: 24),
                        const Text(
                          'Synopsis',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          anime.synopsis!,
                          style: const TextStyle(fontSize: 15),
                          maxLines: _isSynopsisExpanded ? null : 3,
                          overflow: _isSynopsisExpanded
                              ? null
                              : TextOverflow.ellipsis,
                        ),
                        if (!_isSynopsisExpanded)
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _isSynopsisExpanded = true;
                              });
                            },
                            child: const Text('Read more'),
                          ),
                      ],
                      const SizedBox(height: 24),
                      Container(
                        key: _notesSectionKey,
                        child: const Text(
                          'Notes',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      CupertinoTextField(
                        controller: _notesController,
                        focusNode: _notesFocusNode,
                        placeholder: 'Add notes...',
                        maxLines: 4,
                        padding: const EdgeInsets.all(12),
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Added ${formatDate(anime.createdAt)} • Source: ${anime.source.displayName}',
                        style: TextStyle(
                          fontSize: 13,
                          color: CupertinoColors.secondaryLabel.resolveFrom(
                            context,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          color: CupertinoColors.systemRed.withValues(
                            alpha: 0.12,
                          ),
                          onPressed: () async {
                            final shouldDelete = await showCupertinoDialog<bool>(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text('Remove from Library'),
                                content: const Text(
                                  'Are you sure you want to remove this anime?',
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('Cancel'),
                                  ),
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text('Remove'),
                                  ),
                                ],
                              ),
                            );

                            if (shouldDelete == true && context.mounted) {
                              await repository.deleteEntry(anime.id);
                              if (!context.mounted) {
                                return;
                              }
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text(
                            'Remove from Library',
                            style: TextStyle(color: CupertinoColors.systemRed),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
