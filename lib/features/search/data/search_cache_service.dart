import 'dart:convert';

import '../../../core/database/app_database.dart';
import '../../library/domain/watch_status.dart';
import '../domain/anime_search_result.dart';

class SearchCacheService {
  SearchCacheService(this._dao);

  final SearchCacheDao _dao;

  Future<List<AnimeSearchResult>?> getCached(
    String query,
    AnimeSource source,
  ) async {
    final json = await _dao.getCachedResults(query, source);
    if (json == null) {
      return null;
    }

    try {
      final list = jsonDecode(json) as List<dynamic>;
      return list
          .map(
            (item) => AnimeSearchResult.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> cache(
    String query,
    AnimeSource source,
    List<AnimeSearchResult> results,
  ) async {
    final json = jsonEncode(results.map((result) => result.toJson()).toList());
    await _dao.cacheResults(query, source, json);
  }
}
