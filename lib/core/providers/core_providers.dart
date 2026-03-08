import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/library/data/anime_repository.dart';
import '../../features/search/data/anime_search_repository.dart';
import '../database/app_database.dart';
import '../network/anilist_api.dart';
import '../network/api_client.dart';
import '../network/jikan_api.dart';

part 'core_providers.g.dart';

@riverpod
class CurrentTab extends _$CurrentTab {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}

@riverpod
AppDatabase database(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

@riverpod
Dio dio(Ref ref) {
  final client = createDioClient();
  ref.onDispose(() => client.close(force: true));
  return client;
}

@riverpod
JikanApi jikanApi(Ref ref) => JikanApi(ref.watch(dioProvider));

@riverpod
AniListApi aniListApi(Ref ref) => AniListApi();

@riverpod
AnimeRepository animeRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return AnimeRepository(db.animeEntriesDao);
}

@riverpod
AnimeSearchRepository animeSearchRepository(Ref ref) {
  return AnimeSearchRepository(
    jikanApi: ref.watch(jikanApiProvider),
    aniListApi: ref.watch(aniListApiProvider),
  );
}
