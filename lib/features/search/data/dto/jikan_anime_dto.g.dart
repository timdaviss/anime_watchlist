// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jikan_anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JikanAnimeDto _$JikanAnimeDtoFromJson(Map<String, dynamic> json) =>
    _JikanAnimeDto(
      malId: (json['mal_id'] as num).toInt(),
      title: json['title'] as String,
      titleJapanese: json['title_japanese'] as String?,
      synopsis: json['synopsis'] as String?,
      images: json['images'] == null
          ? null
          : JikanAnimeImagesDto.fromJson(
              json['images'] as Map<String, dynamic>,
            ),
      episodes: (json['episodes'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => JikanGenreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: (json['score'] as num?)?.toDouble(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$JikanAnimeDtoToJson(_JikanAnimeDto instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'title': instance.title,
      'title_japanese': instance.titleJapanese,
      'synopsis': instance.synopsis,
      'images': instance.images,
      'episodes': instance.episodes,
      'genres': instance.genres,
      'score': instance.score,
      'status': instance.status,
    };

_JikanAnimeImagesDto _$JikanAnimeImagesDtoFromJson(Map<String, dynamic> json) =>
    _JikanAnimeImagesDto(
      jpg: JikanImageJpgDto.fromJson(json['jpg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JikanAnimeImagesDtoToJson(
  _JikanAnimeImagesDto instance,
) => <String, dynamic>{'jpg': instance.jpg};

_JikanImageJpgDto _$JikanImageJpgDtoFromJson(Map<String, dynamic> json) =>
    _JikanImageJpgDto(largeImageUrl: json['large_image_url'] as String?);

Map<String, dynamic> _$JikanImageJpgDtoToJson(_JikanImageJpgDto instance) =>
    <String, dynamic>{'large_image_url': instance.largeImageUrl};

_JikanGenreDto _$JikanGenreDtoFromJson(Map<String, dynamic> json) =>
    _JikanGenreDto(name: json['name'] as String);

Map<String, dynamic> _$JikanGenreDtoToJson(_JikanGenreDto instance) =>
    <String, dynamic>{'name': instance.name};
