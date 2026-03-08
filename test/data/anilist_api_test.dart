import 'dart:convert';
import 'dart:io';

import 'package:anime_watchlist/features/search/data/dto/anilist_anime_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses AniList search fixture into DTOs', () async {
    final file = File('test/fixtures/anilist_search_response.json');
    final jsonMap =
        jsonDecode(await file.readAsString()) as Map<String, dynamic>;

    final media =
        (jsonMap['data'] as Map<String, dynamic>)['Page']
            as Map<String, dynamic>;
    final entries = (media['media'] as List<dynamic>)
        .map((item) => AniListAnimeDto.fromJson(item as Map<String, dynamic>))
        .toList();

    expect(entries, hasLength(1));

    final anime = entries.first;
    expect(anime.id, 16498);
    expect(anime.title.english, 'Attack on Titan');
    expect(anime.title.romaji, 'Shingeki no Kyojin');
    expect(anime.title.native, '進撃の巨人');
    expect(anime.description, isNotEmpty);
    expect(anime.coverImage?.large, isNotEmpty);
    expect(anime.episodes, 25);
    expect(anime.genres, ['Action', 'Drama']);
    expect(anime.averageScore, 84);
    expect(anime.status, 'FINISHED');
  });
}
