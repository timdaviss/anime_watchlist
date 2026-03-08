// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeEntry _$AnimeEntryFromJson(Map<String, dynamic> json) => _AnimeEntry(
  id: json['id'] as String,
  title: json['title'] as String,
  titleJapanese: json['titleJapanese'] as String?,
  synopsis: json['synopsis'] as String?,
  coverImageUrl: json['coverImageUrl'] as String?,
  totalEpisodes: (json['totalEpisodes'] as num?)?.toInt(),
  episodesWatched: (json['episodesWatched'] as num?)?.toInt() ?? 0,
  watchStatus: $enumDecode(_$WatchStatusEnumMap, json['watchStatus']),
  rating: (json['rating'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  isFavorite: json['isFavorite'] as bool? ?? false,
  genres: json['genres'] as String?,
  malId: (json['malId'] as num?)?.toInt(),
  anilistId: (json['anilistId'] as num?)?.toInt(),
  source: $enumDecode(_$AnimeSourceEnumMap, json['source']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AnimeEntryToJson(_AnimeEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleJapanese': instance.titleJapanese,
      'synopsis': instance.synopsis,
      'coverImageUrl': instance.coverImageUrl,
      'totalEpisodes': instance.totalEpisodes,
      'episodesWatched': instance.episodesWatched,
      'watchStatus': _$WatchStatusEnumMap[instance.watchStatus]!,
      'rating': instance.rating,
      'notes': instance.notes,
      'isFavorite': instance.isFavorite,
      'genres': instance.genres,
      'malId': instance.malId,
      'anilistId': instance.anilistId,
      'source': _$AnimeSourceEnumMap[instance.source]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$WatchStatusEnumMap = {
  WatchStatus.watching: 'watching',
  WatchStatus.completed: 'completed',
  WatchStatus.planToWatch: 'planToWatch',
  WatchStatus.onHold: 'onHold',
  WatchStatus.dropped: 'dropped',
};

const _$AnimeSourceEnumMap = {
  AnimeSource.jikan: 'jikan',
  AnimeSource.anilist: 'anilist',
  AnimeSource.manual: 'manual',
};
