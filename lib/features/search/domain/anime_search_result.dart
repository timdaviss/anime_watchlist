import 'package:freezed_annotation/freezed_annotation.dart';

import '../../library/domain/watch_status.dart';

part 'anime_search_result.freezed.dart';
part 'anime_search_result.g.dart';

@freezed
abstract class AnimeSearchResult with _$AnimeSearchResult {
  const factory AnimeSearchResult({
    required int sourceId,
    required AnimeSource source,
    required String title,
    String? titleJapanese,
    String? synopsis,
    String? coverImageUrl,
    int? totalEpisodes,
    String? genres,
    double? communityScore,
    String? airingStatus,
  }) = _AnimeSearchResult;

  factory AnimeSearchResult.fromJson(Map<String, dynamic> json) =>
      _$AnimeSearchResultFromJson(json);
}
