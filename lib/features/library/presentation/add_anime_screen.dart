import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/providers/core_providers.dart';
import '../../../shared/widgets/anime_cover_image.dart';
import '../domain/anime_entry.dart';
import '../domain/watch_status.dart';
import 'widgets/rating_widget.dart';

class AddAnimeScreen extends ConsumerStatefulWidget {
  const AddAnimeScreen({super.key});

  @override
  ConsumerState<AddAnimeScreen> createState() => _AddAnimeScreenState();
}

class _AddAnimeScreenState extends ConsumerState<AddAnimeScreen> {
  final _titleController = TextEditingController();
  final _japaneseTitleController = TextEditingController();
  final _episodesController = TextEditingController();
  final _synopsisController = TextEditingController();
  final _coverUrlController = TextEditingController();
  final _genresController = TextEditingController();
  final _notesController = TextEditingController();

  WatchStatus _status = WatchStatus.planToWatch;
  double _rating = 0;
  bool _isSaving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _japaneseTitleController.dispose();
    _episodesController.dispose();
    _synopsisController.dispose();
    _coverUrlController.dispose();
    _genresController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _saveAnime() async {
    final title = _titleController.text.trim();
    if (title.isEmpty || _isSaving) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    final now = DateTime.now();
    final entry = AnimeEntry(
      id: const Uuid().v4(),
      title: title,
      titleJapanese: _nullableText(_japaneseTitleController),
      synopsis: _nullableText(_synopsisController),
      coverImageUrl: _nullableText(_coverUrlController),
      totalEpisodes: int.tryParse(_episodesController.text.trim()),
      watchStatus: _status,
      rating: _rating > 0 ? _rating : null,
      notes: _nullableText(_notesController),
      isFavorite: false,
      genres: _nullableText(_genresController),
      source: AnimeSource.manual,
      createdAt: now,
      updatedAt: now,
    );

    await ref.read(animeRepositoryProvider).insertEntry(entry);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  String? _nullableText(TextEditingController controller) {
    final text = controller.text.trim();
    return text.isEmpty ? null : text;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _isSaving ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        middle: const Text('Add Anime'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _titleController.text.trim().isEmpty || _isSaving
              ? null
              : _saveAnime,
          child: _isSaving
              ? const CupertinoActivityIndicator()
              : const Text('Save'),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CupertinoTextField(
              controller: _titleController,
              placeholder: 'Title (Required)',
              padding: const EdgeInsets.all(12),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: _japaneseTitleController,
              placeholder: 'Japanese Title',
              padding: const EdgeInsets.all(12),
            ),
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: _episodesController,
              placeholder: 'Total Episodes',
              keyboardType: TextInputType.number,
              padding: const EdgeInsets.all(12),
            ),
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: _genresController,
              placeholder: 'Genres (comma-separated)',
              padding: const EdgeInsets.all(12),
            ),
            const SizedBox(height: 24),
            const Text(
              'Status',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            CupertinoSlidingSegmentedControl<WatchStatus>(
              groupValue: _status,
              children: {
                for (final status in WatchStatus.values)
                  status: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(status.displayName),
                  ),
              },
              onValueChanged: (value) {
                if (value != null) {
                  setState(() {
                    _status = value;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Rating',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            RatingWidget(
              initialRating: _rating,
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 24),
            CupertinoTextField(
              controller: _synopsisController,
              placeholder: 'Synopsis',
              maxLines: 4,
              padding: const EdgeInsets.all(12),
            ),
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: _notesController,
              placeholder: 'Notes',
              maxLines: 3,
              padding: const EdgeInsets.all(12),
            ),
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: _coverUrlController,
              placeholder: 'Cover Image URL',
              padding: const EdgeInsets.all(12),
              onChanged: (_) => setState(() {}),
            ),
            if (_coverUrlController.text.trim().isNotEmpty) ...[
              const SizedBox(height: 12),
              Center(
                child: AnimeCoverImage(
                  url: _coverUrlController.text.trim(),
                  title: _titleController.text.trim(),
                  width: 120,
                  height: 180,
                ),
              ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
