// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anilist_anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AniListAnimeDto _$AniListAnimeDtoFromJson(Map<String, dynamic> json) =>
    _AniListAnimeDto(
      id: (json['id'] as num).toInt(),
      title: AniListTitleDto.fromJson(json['title'] as Map<String, dynamic>),
      description: json['description'] as String?,
      coverImage: json['coverImage'] == null
          ? null
          : AniListCoverImageDto.fromJson(
              json['coverImage'] as Map<String, dynamic>,
            ),
      episodes: (json['episodes'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      averageScore: (json['averageScore'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AniListAnimeDtoToJson(_AniListAnimeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'episodes': instance.episodes,
      'genres': instance.genres,
      'averageScore': instance.averageScore,
      'status': instance.status,
    };

_AniListTitleDto _$AniListTitleDtoFromJson(Map<String, dynamic> json) =>
    _AniListTitleDto(
      romaji: json['romaji'] as String?,
      english: json['english'] as String?,
      native: json['native'] as String?,
    );

Map<String, dynamic> _$AniListTitleDtoToJson(_AniListTitleDto instance) =>
    <String, dynamic>{
      'romaji': instance.romaji,
      'english': instance.english,
      'native': instance.native,
    };

_AniListCoverImageDto _$AniListCoverImageDtoFromJson(
  Map<String, dynamic> json,
) => _AniListCoverImageDto(large: json['large'] as String?);

Map<String, dynamic> _$AniListCoverImageDtoToJson(
  _AniListCoverImageDto instance,
) => <String, dynamic>{'large': instance.large};
