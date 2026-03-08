import '../../../core/network/anilist_api.dart';
import '../../../core/network/jikan_api.dart';
import '../../library/domain/watch_status.dart';
import '../domain/anime_search_result.dart';
import 'dto/anilist_anime_dto.dart';
import 'dto/jikan_anime_dto.dart';

class AnimeSearchRepository {
  AnimeSearchRepository({
    required JikanApi jikanApi,
    required AniListApi aniListApi,
  }) : _jikanApi = jikanApi,
       _aniListApi = aniListApi;

  final JikanApi _jikanApi;
  final AniListApi _aniListApi;

  Future<List<AnimeSearchResult>> search(
    String query, {
    AnimeSource source = AnimeSource.jikan,
  }) async {
    switch (source) {
      case AnimeSource.jikan:
        final results = await _jikanApi.searchAnime(query);
        return results.map(_fromJikan).toList();
      case AnimeSource.anilist:
        final results = await _aniListApi.searchAnime(query);
        return results.map(_fromAniList).toList();
      case AnimeSource.manual:
        return const [];
    }
  }

  Future<AnimeSearchResult?> getDetails(
    int id, {
    required AnimeSource source,
  }) async {
    switch (source) {
      case AnimeSource.jikan:
        final dto = await _jikanApi.getAnimeDetails(id);
        return _fromJikan(dto);
      case AnimeSource.anilist:
        final dto = await _aniListApi.getAnimeDetails(id);
        return _fromAniList(dto);
      case AnimeSource.manual:
        return null;
    }
  }

  AnimeSearchResult _fromJikan(JikanAnimeDto dto) {
    return AnimeSearchResult(
      sourceId: dto.malId,
      source: AnimeSource.jikan,
      title: dto.title,
      titleJapanese: dto.titleJapanese,
      synopsis: dto.synopsis,
      coverImageUrl: dto.images?.jpg.largeImageUrl,
      totalEpisodes: dto.episodes,
      genres: dto.genres?.map((genre) => genre.name).join(', '),
      communityScore: dto.score,
      airingStatus: dto.status,
    );
  }

  AnimeSearchResult _fromAniList(AniListAnimeDto dto) {
    return AnimeSearchResult(
      sourceId: dto.id,
      source: AnimeSource.anilist,
      title:
          dto.title.english ??
          dto.title.romaji ??
          dto.title.native ??
          'Unknown Title',
      titleJapanese: dto.title.native,
      synopsis: dto.description,
      coverImageUrl: dto.coverImage?.large,
      totalEpisodes: dto.episodes,
      genres: dto.genres?.join(', '),
      communityScore: dto.averageScore == null ? null : dto.averageScore! / 10,
      airingStatus: dto.status,
    );
  }
}
