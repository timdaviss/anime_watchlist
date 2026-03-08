import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/providers/core_providers.dart';
import '../../../../shared/widgets/anime_cover_image.dart';
import '../../../library/domain/anime_entry.dart';
import '../../../library/domain/watch_status.dart';
import '../../../library/presentation/anime_detail_screen.dart';
import '../../domain/anime_search_result.dart';
import '../search_providers.dart';

class AnimeDetailSheet extends ConsumerStatefulWidget {
  const AnimeDetailSheet({super.key, required this.result});

  final AnimeSearchResult result;

  @override
  ConsumerState<AnimeDetailSheet> createState() => _AnimeDetailSheetState();
}

class _AnimeDetailSheetState extends ConsumerState<AnimeDetailSheet> {
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(
      animeSearchDetailProvider(widget.result.sourceId, widget.result.source),
    );
    final inLibraryAsync = ref.watch(
      isInLibraryProvider(widget.result.sourceId, widget.result.source),
    );

    // Use fetched detail data when available, fall back to search result
    final result = detailAsync.value ?? widget.result;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Anime Details'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).maybePop(),
          child: const Text('Done'),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Hero(
                tag:
                    'search-anime-cover-${widget.result.source}-${widget.result.sourceId}',
                child: AnimeCoverImage(
                  url: result.coverImageUrl,
                  title: result.title,
                  width: 180,
                  height: 270,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              result.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            if (result.titleJapanese?.isNotEmpty ?? false) ...[
              const SizedBox(height: 4),
              Text(
                result.titleJapanese!,
                style: const TextStyle(
                  fontSize: 13,
                  color: CupertinoColors.secondaryLabel,
                ),
              ),
            ],
            const SizedBox(height: 16),
            _InfoRow(
              label: 'Episodes',
              value: result.totalEpisodes?.toString() ?? 'Unknown',
            ),
            _InfoRow(
              label: 'Community score',
              value: result.communityScore?.toStringAsFixed(1) ?? 'N/A',
            ),
            _InfoRow(
              label: 'Airing status',
              value: result.airingStatus ?? 'Unknown',
            ),
            _InfoRow(label: 'Source', value: result.source.displayName),
            if (result.genres?.isNotEmpty ?? false) ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: result.genres!
                    .split(',')
                    .map((genre) => genre.trim())
                    .where((genre) => genre.isNotEmpty)
                    .map(
                      (genre) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemIndigo.withValues(
                            alpha: 0.12,
                          ),
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
            if (result.synopsis?.isNotEmpty ?? false) ...[
              const SizedBox(height: 24),
              const Text(
                'Synopsis',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(result.synopsis!, style: const TextStyle(fontSize: 15)),
            ],
            const SizedBox(height: 24),
            inLibraryAsync.when(
              data: (libraryInfo) {
                if (libraryInfo != null) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) =>
                              AnimeDetailScreen(animeId: libraryInfo.entryId),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGreen.withValues(
                          alpha: 0.12,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Already in Library • ${libraryInfo.status.displayName}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: CupertinoColors.systemGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.chevron_right,
                            size: 16,
                            color: CupertinoColors.systemGreen,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    onPressed: _isSaving ? null : _showAddToLibraryStatusPicker,
                    child: _isSaving
                        ? const CupertinoActivityIndicator(
                            color: CupertinoColors.white,
                          )
                        : const Text('Add to Library'),
                  ),
                );
              },
              loading: () => const Center(child: CupertinoActivityIndicator()),
              error: (error, stackTrace) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddToLibraryStatusPicker() async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text('Select Watch Status'),
          actions: WatchStatus.values
              .map(
                (status) => CupertinoActionSheetAction(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _saveToLibrary(status);
                  },
                  child: Text(status.displayName),
                ),
              )
              .toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }

  Future<void> _saveToLibrary(WatchStatus watchStatus) async {
    setState(() {
      _isSaving = true;
    });

    try {
      final now = DateTime.now();
      // Use enriched detail data when available, fall back to search result
      final result =
          ref
              .read(
                animeSearchDetailProvider(
                  widget.result.sourceId,
                  widget.result.source,
                ),
              )
              .value ??
          widget.result;
      final entry = AnimeEntry(
        id: const Uuid().v4(),
        title: result.title,
        titleJapanese: result.titleJapanese,
        synopsis: result.synopsis,
        coverImageUrl: result.coverImageUrl,
        totalEpisodes: result.totalEpisodes,
        watchStatus: watchStatus,
        rating: null,
        notes: null,
        isFavorite: false,
        genres: result.genres,
        malId: result.source == AnimeSource.jikan ? result.sourceId : null,
        anilistId: result.source == AnimeSource.anilist
            ? result.sourceId
            : null,
        source: result.source,
        createdAt: now,
        updatedAt: now,
      );

      await ref.read(animeRepositoryProvider).insertEntry(entry);

      ref.invalidate(isInLibraryProvider(result.sourceId, result.source));
    } catch (e) {
      if (mounted) {
        showCupertinoDialog<void>(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Error'),
            content: const Text(
              'Failed to save anime to library. Please try again.',
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text.rich(
        TextSpan(
          text: '$label: ',
          style: const TextStyle(
            fontSize: 15,
            color: CupertinoColors.secondaryLabel,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                color: CupertinoColors.label,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
