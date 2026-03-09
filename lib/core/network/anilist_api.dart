import 'package:graphql_flutter/graphql_flutter.dart';

import '../../features/search/data/dto/anilist_anime_dto.dart';

class AniListApi {
  AniListApi({GraphQLClient? client})
    : _client =
          client ??
          GraphQLClient(
            link: HttpLink('https://graphql.anilist.co'),
            cache: GraphQLCache(store: InMemoryStore()),
          );

  final GraphQLClient _client;

  static const String _detailsQuery = r'''
    query GetAnimeDetails($id: Int) {
      Media(id: $id, type: ANIME) {
        id
        title { romaji english native }
        description(asHtml: false)
        coverImage { large }
        episodes
        genres
        averageScore
        status
      }
    }
  ''';

  static const String _searchQuery = r'''
    query SearchAnime($search: String, $page: Int, $perPage: Int) {
      Page(page: $page, perPage: $perPage) {
        pageInfo { hasNextPage }
        media(search: $search, type: ANIME, sort: SEARCH_MATCH) {
          id
          title { romaji english native }
          description(asHtml: false)
          coverImage { large }
          episodes
          genres
          averageScore
          status
        }
      }
    }
  ''';

  Future<AniListAnimeDto> getAnimeDetails(int id) async {
    final result = await _client.query(
      QueryOptions(document: gql(_detailsQuery), variables: {'id': id}),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = result.data ?? const <String, dynamic>{};
    final media = data['Media'] as Map<String, dynamic>?;

    if (media == null) {
      throw Exception('Anime with ID $id not found on AniList');
    }

    return AniListAnimeDto.fromJson(media);
  }

  Future<({List<AniListAnimeDto> data, bool hasNextPage})> searchAnime(
    String query, {
    int perPage = 20,
    int page = 1,
  }) async {
    final result = await _client.query(
      QueryOptions(
        document: gql(_searchQuery),
        variables: {'search': query, 'page': page, 'perPage': perPage},
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = result.data ?? const <String, dynamic>{};
    final pageData = data['Page'] as Map<String, dynamic>? ?? const {};
    final pageInfo = pageData['pageInfo'] as Map<String, dynamic>?;
    final hasNextPage = pageInfo?['hasNextPage'] as bool? ?? false;
    final media = pageData['media'] as List<dynamic>? ?? const [];

    return (
      data: media
          .map((item) => AniListAnimeDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      hasNextPage: hasNextPage,
    );
  }
}
