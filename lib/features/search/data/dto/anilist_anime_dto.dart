import 'package:freezed_annotation/freezed_annotation.dart';

part 'anilist_anime_dto.freezed.dart';
part 'anilist_anime_dto.g.dart';

@freezed
abstract class AniListAnimeDto with _$AniListAnimeDto {
  const factory AniListAnimeDto({
    required int id,
    required AniListTitleDto title,
    String? description,
    AniListCoverImageDto? coverImage,
    int? episodes,
    List<String>? genres,
    int? averageScore,
    String? status,
  }) = _AniListAnimeDto;

  factory AniListAnimeDto.fromJson(Map<String, dynamic> json) =>
      _$AniListAnimeDtoFromJson(json);
}

@freezed
abstract class AniListTitleDto with _$AniListTitleDto {
  const factory AniListTitleDto({
    String? romaji,
    String? english,
    String? native,
  }) = _AniListTitleDto;

  factory AniListTitleDto.fromJson(Map<String, dynamic> json) =>
      _$AniListTitleDtoFromJson(json);
}

@freezed
abstract class AniListCoverImageDto with _$AniListCoverImageDto {
  const factory AniListCoverImageDto({String? large}) = _AniListCoverImageDto;

  factory AniListCoverImageDto.fromJson(Map<String, dynamic> json) =>
      _$AniListCoverImageDtoFromJson(json);
}
