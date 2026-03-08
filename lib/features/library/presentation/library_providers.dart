import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/providers/core_providers.dart';
import '../domain/anime_entry.dart';
import '../domain/watch_status.dart';

part 'library_providers.g.dart';

@riverpod
class SelectedStatus extends _$SelectedStatus {
  @override
  WatchStatus? build() => null;

  void setStatus(WatchStatus? status) {
    state = status;
  }
}

@riverpod
class SelectedSort extends _$SelectedSort {
  @override
  SortOption build() => SortOption.updatedAt;

  void setSort(SortOption sort) {
    state = sort;
  }
}

@riverpod
Stream<List<AnimeEntry>> animeList(Ref ref) {
  final repository = ref.watch(animeRepositoryProvider);
  final status = ref.watch(selectedStatusProvider);
  final sort = ref.watch(selectedSortProvider);

  if (status == null) {
    return repository.watchAllSorted(sort);
  } else {
    return repository.watchByStatusSorted(status, sort);
  }
}

@riverpod
Stream<AnimeEntry?> animeDetail(Ref ref, String id) {
  final repository = ref.watch(animeRepositoryProvider);
  return repository.watchById(id);
}
