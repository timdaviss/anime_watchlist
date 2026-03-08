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
  int _currentPage = 1;
  bool _hasNextPage = false;
  bool _isLoadingMore = false;

  AnimeSource get selectedSource => _selectedSource;
  bool get hasNextPage => _hasNextPage;
  bool get isLoadingMore => _isLoadingMore;

  @override
  FutureOr<List<AnimeSearchResult>> build() {
    return [];
  }

  Future<void> search(String query) async {
    _currentQuery = query;
    _currentPage = 1;
    _hasNextPage = false;
    _isLoadingMore = false;
    if (query.trim().isEmpty) {
      state = const AsyncData([]);
      return;
    }

    state = const AsyncLoading();
    try {
      final repository = ref.read(animeSearchRepositoryProvider);
      final selectedSource = _selectedSource;
      final result = await repository.search(
        query,
        source: selectedSource,
        page: 1,
      );
      if (query != _currentQuery || selectedSource != _selectedSource) {
        return;
      }
      _hasNextPage = result.hasNextPage;
      state = AsyncData(result.results);
    } catch (e, st) {
      if (query != _currentQuery || selectedSource != _selectedSource) {
        return;
      }
      state = AsyncError(e, st);
    }
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasNextPage || _currentQuery.trim().isEmpty) {
      return;
    }

    final currentResults = state.value ?? const <AnimeSearchResult>[];
    final selectedSource = _selectedSource;
    final query = _currentQuery;
    final nextPage = _currentPage + 1;

    _isLoadingMore = true;
    state = AsyncData([...currentResults]);

    try {
      final repository = ref.read(animeSearchRepositoryProvider);
      final result = await repository.search(
        query,
        source: selectedSource,
        page: nextPage,
      );
      if (query != _currentQuery || selectedSource != _selectedSource) {
        return;
      }

      _currentPage = nextPage;
      _hasNextPage = result.hasNextPage;
      state = AsyncData([...currentResults, ...result.results]);
    } catch (_) {
      if (query != _currentQuery || selectedSource != _selectedSource) {
        return;
      }
      _hasNextPage = false;
      state = AsyncData([...currentResults]);
    } finally {
      _isLoadingMore = false;
      if (query == _currentQuery && selectedSource == _selectedSource) {
        state = AsyncData([...(state.value ?? const <AnimeSearchResult>[])]);
      }
    }
  }

  void setSource(AnimeSource source) {
    if (_selectedSource == source) return;
    _selectedSource = source;
    _currentPage = 1;
    _hasNextPage = false;
    _isLoadingMore = false;
    if (_currentQuery.trim().isNotEmpty) {
      search(_currentQuery);
    } else {
      // Re-emit current state to trigger UI rebuild for segment control
      state = AsyncData(state.value ?? []);
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
