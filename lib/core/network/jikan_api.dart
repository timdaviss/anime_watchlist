import 'package:dio/dio.dart';

import '../../features/search/data/dto/jikan_anime_dto.dart';

class JikanApi {
  JikanApi(this._dio);

  final Dio _dio;

  Future<({List<JikanAnimeDto> data, bool hasNextPage})> searchAnime(
    String query, {
    int limit = 20,
    int page = 1,
  }) async {
    final response = await _dio.get<dynamic>(
      '/anime',
      queryParameters: {'q': query, 'limit': limit, 'page': page},
    );

    final map = response.data as Map<String, dynamic>;
    final list = (map['data'] as List<dynamic>? ?? const []);
    final pagination = map['pagination'] as Map<String, dynamic>?;
    final hasNextPage = pagination?['has_next_page'] as bool? ?? false;

    return (
      data: list
          .map((item) => JikanAnimeDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      hasNextPage: hasNextPage,
    );
  }

  Future<JikanAnimeDto> getAnimeDetails(int malId) async {
    final response = await _dio.get<dynamic>('/anime/$malId');
    final map = response.data as Map<String, dynamic>;
    final data = map['data'] as Map<String, dynamic>;
    return JikanAnimeDto.fromJson(data);
  }
}
