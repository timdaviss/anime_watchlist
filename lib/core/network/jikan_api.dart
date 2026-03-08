import 'package:dio/dio.dart';

import '../../features/search/data/dto/jikan_anime_dto.dart';

class JikanApi {
  JikanApi(this._dio);

  final Dio _dio;

  Future<List<JikanAnimeDto>> searchAnime(
    String query, {
    int limit = 20,
  }) async {
    final response = await _dio.get<dynamic>(
      '/anime',
      queryParameters: {'q': query, 'limit': limit},
    );

    final map = response.data as Map<String, dynamic>;
    final list = (map['data'] as List<dynamic>? ?? const []);
    return list
        .map((item) => JikanAnimeDto.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<JikanAnimeDto> getAnimeDetails(int malId) async {
    final response = await _dio.get<dynamic>('/anime/$malId');
    final map = response.data as Map<String, dynamic>;
    final data = map['data'] as Map<String, dynamic>;
    return JikanAnimeDto.fromJson(data);
  }
}
