import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../library/domain/anime_entry.dart';

part 'favorites_providers.g.dart';

@riverpod
Stream<List<AnimeEntry>> favorites(Ref ref) {
  return ref.watch(animeRepositoryProvider).watchFavorites();
}
