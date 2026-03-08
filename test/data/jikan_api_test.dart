import 'dart:convert';
import 'dart:io';

import 'package:anime_watchlist/features/search/data/dto/jikan_anime_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses Jikan search fixture into DTOs', () async {
    final file = File('test/fixtures/jikan_search_response.json');
    final jsonMap =
        jsonDecode(await file.readAsString()) as Map<String, dynamic>;

    final entries = (jsonMap['data'] as List<dynamic>)
        .map((item) => JikanAnimeDto.fromJson(item as Map<String, dynamic>))
        .toList();

    expect(entries, hasLength(2));
    expect(entries.first.malId, 5114);
    expect(entries.first.images?.jpg.largeImageUrl, isNotEmpty);
    expect(entries.first.genres?.first.name, 'Action');
  });
}
