import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../library/domain/watch_status.dart';
import '../domain/anime_search_result.dart';

part 'search_providers.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  String _currentQuery = '';
  AnimeSource _selectedSource = AnimeSource.jikan;

  AnimeSource get selectedSource => _selectedSource;

  @override
  FutureOr<List<AnimeSearchResult>> build() {
    return [];
  }

  Future<void> search(String query) async {
    _currentQuery = query;
    if (query.trim().isEmpty) {
      state = const AsyncData([]);
      return;
    }

    state = const AsyncLoading();
    try {
      final repository = ref.read(animeSearchRepositoryProvider);
      final results = await repository.search(query, source: _selectedSource);
      state = AsyncData(results);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void setSource(AnimeSource source) {
    if (_selectedSource == source) return;
    _selectedSource = source;
    // Re-emit current state to trigger UI rebuild for segment control
    state = AsyncData(state.value ?? []);
    if (_currentQuery.trim().isNotEmpty) {
      search(_currentQuery);
    }
  }
}

@riverpod
Future<AnimeSearchResult?> animeSearchDetail(
  Ref ref,
  int sourceId,
  AnimeSource source,
) async {
  final repository = ref.watch(animeSearchRepositoryProvider);
  return repository.getDetails(sourceId, source: source);
}

@riverpod
Future<({WatchStatus status, String entryId})?> isInLibrary(
  Ref ref,
  int sourceId,
  AnimeSource source,
) async {
  final repository = ref.watch(animeRepositoryProvider);
  if (source == AnimeSource.jikan) {
    final entry = await repository.getByMalId(sourceId);
    return entry == null
        ? null
        : (status: entry.watchStatus, entryId: entry.id);
  } else if (source == AnimeSource.anilist) {
    final entry = await repository.getByAnilistId(sourceId);
    return entry == null
        ? null
        : (status: entry.watchStatus, entryId: entry.id);
  }
  return null;
}
