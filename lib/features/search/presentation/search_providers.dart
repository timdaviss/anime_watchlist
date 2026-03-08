import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../library/domain/watch_status.dart';
import '../domain/anime_search_result.dart';

part 'search_providers.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  String _currentQuery = '';
  AnimeSource _selectedSource = AnimeSource.jikan;
  bool _showingCachedResults = false;

  AnimeSource get selectedSource => _selectedSource;
  bool get showingCachedResults => _showingCachedResults;

  @override
  FutureOr<List<AnimeSearchResult>> build() {
    return [];
  }

  Future<void> search(String query) async {
    _currentQuery = query;
    if (query.trim().isEmpty) {
      _showingCachedResults = false;
      state = const AsyncData([]);
      return;
    }

    state = const AsyncLoading();
    try {
      final repository = ref.read(animeSearchRepositoryProvider);
      final results = await repository.search(query, source: _selectedSource);
      if (query != _currentQuery) {
        return;
      }

      _showingCachedResults = false;
      state = AsyncData(results);

      unawaited(
        ref
            .read(searchCacheServiceProvider)
            .cache(query, _selectedSource, results),
      );
    } catch (e, st) {
      if (query != _currentQuery) {
        return;
      }

      if (!_isNetworkError(e)) {
        _showingCachedResults = false;
        state = AsyncError(e, st);
        return;
      }

      final cached = await ref
          .read(searchCacheServiceProvider)
          .getCached(query, _selectedSource);

      if (query != _currentQuery) {
        return;
      }

      if (cached != null) {
        _showingCachedResults = true;
        state = AsyncData(cached);
        return;
      }

      _showingCachedResults = false;
      state = AsyncError(e, st);
    }
  }

  void setSource(AnimeSource source) {
    if (_selectedSource == source) return;
    _selectedSource = source;
    _showingCachedResults = false;
    // Re-emit current state to trigger UI rebuild for segment control
    state = AsyncData(state.value ?? []);
    if (_currentQuery.trim().isNotEmpty) {
      search(_currentQuery);
    }
  }

  bool _isNetworkError(Object error) {
    if (error is DioException) {
      return error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          (error.type == DioExceptionType.unknown &&
              error.error is SocketException);
    }

    if (error is OperationException) {
      return error.linkException != null;
    }

    return error is SocketException;
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
