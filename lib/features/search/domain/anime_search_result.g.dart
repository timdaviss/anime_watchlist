// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeSearchResult _$AnimeSearchResultFromJson(Map<String, dynamic> json) =>
    _AnimeSearchResult(
      sourceId: (json['sourceId'] as num).toInt(),
      source: $enumDecode(_$AnimeSourceEnumMap, json['source']),
      title: json['title'] as String,
      titleJapanese: json['titleJapanese'] as String?,
      synopsis: json['synopsis'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      totalEpisodes: (json['totalEpisodes'] as num?)?.toInt(),
      genres: json['genres'] as String?,
      communityScore: (json['communityScore'] as num?)?.toDouble(),
      airingStatus: json['airingStatus'] as String?,
    );

Map<String, dynamic> _$AnimeSearchResultToJson(_AnimeSearchResult instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'source': _$AnimeSourceEnumMap[instance.source]!,
      'title': instance.title,
      'titleJapanese': instance.titleJapanese,
      'synopsis': instance.synopsis,
      'coverImageUrl': instance.coverImageUrl,
      'totalEpisodes': instance.totalEpisodes,
      'genres': instance.genres,
      'communityScore': instance.communityScore,
      'airingStatus': instance.airingStatus,
    };

const _$AnimeSourceEnumMap = {
  AnimeSource.jikan: 'jikan',
  AnimeSource.anilist: 'anilist',
  AnimeSource.manual: 'manual',
};
