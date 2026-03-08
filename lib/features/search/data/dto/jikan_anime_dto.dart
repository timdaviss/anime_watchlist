import 'package:freezed_annotation/freezed_annotation.dart';

part 'jikan_anime_dto.freezed.dart';
part 'jikan_anime_dto.g.dart';

@freezed
abstract class JikanAnimeDto with _$JikanAnimeDto {
  const factory JikanAnimeDto({
    @JsonKey(name: 'mal_id') required int malId,
    required String title,
    @JsonKey(name: 'title_japanese') String? titleJapanese,
    String? synopsis,
    JikanAnimeImagesDto? images,
    int? episodes,
    List<JikanGenreDto>? genres,
    double? score,
    String? status,
  }) = _JikanAnimeDto;

  factory JikanAnimeDto.fromJson(Map<String, dynamic> json) =>
      _$JikanAnimeDtoFromJson(json);
}

@freezed
abstract class JikanAnimeImagesDto with _$JikanAnimeImagesDto {
  const factory JikanAnimeImagesDto({required JikanImageJpgDto jpg}) =
      _JikanAnimeImagesDto;

  factory JikanAnimeImagesDto.fromJson(Map<String, dynamic> json) =>
      _$JikanAnimeImagesDtoFromJson(json);
}

@freezed
abstract class JikanImageJpgDto with _$JikanImageJpgDto {
  const factory JikanImageJpgDto({
    @JsonKey(name: 'large_image_url') String? largeImageUrl,
  }) = _JikanImageJpgDto;

  factory JikanImageJpgDto.fromJson(Map<String, dynamic> json) =>
      _$JikanImageJpgDtoFromJson(json);
}

@freezed
abstract class JikanGenreDto with _$JikanGenreDto {
  const factory JikanGenreDto({required String name}) = _JikanGenreDto;

  factory JikanGenreDto.fromJson(Map<String, dynamic> json) =>
      _$JikanGenreDtoFromJson(json);
}
