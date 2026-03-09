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
class LibrarySearchQuery extends _$LibrarySearchQuery {
  @override
  String build() => '';

  void setQuery(String query) {
    state = query;
  }
}

@riverpod
class SelectionMode extends _$SelectionMode {
  @override
  Set<String> build() => {};

  void toggle(String id) {
    if (state.contains(id)) {
      final next = {...state};
      next.remove(id);
      state = next;
    } else {
      state = {...state, id};
    }
  }

  void selectAll(List<String> ids) {
    state = {...ids};
  }

  void clear() {
    state = {};
  }
}

@riverpod
Stream<List<AnimeEntry>> animeList(Ref ref) {
  final repository = ref.watch(animeRepositoryProvider);
  final status = ref.watch(selectedStatusProvider);
  final sort = ref.watch(selectedSortProvider);
  final query = ref.watch(librarySearchQueryProvider).trim().toLowerCase();

  Stream<List<AnimeEntry>> stream;
  if (status == null) {
    stream = repository.watchAllSorted(sort);
  } else {
    stream = repository.watchByStatusSorted(status, sort);
  }

  if (query.isNotEmpty) {
    stream = stream.map(
      (entries) =>
          entries.where((e) => e.title.toLowerCase().contains(query)).toList(),
    );
  }

  return stream;
}

@riverpod
Stream<AnimeEntry?> animeDetail(Ref ref, String id) {
  final repository = ref.watch(animeRepositoryProvider);
  return repository.watchById(id);
}
