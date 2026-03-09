import '../../../core/database/app_database.dart' show AnimeEntriesDao;
import '../domain/anime_entry.dart' as model;
import '../domain/watch_status.dart';

class AnimeRepository {
  AnimeRepository(this._dao);

  final AnimeEntriesDao _dao;

  Stream<List<model.AnimeEntry>> watchAll() {
    return _dao.watchAll().map(
      (rows) => rows.map(model.AnimeEntry.fromDbRow).toList(),
    );
  }

  Stream<List<model.AnimeEntry>> watchAllSorted(SortOption sort) {
    return _dao
        .watchAllSorted(sort)
        .map((rows) => rows.map(model.AnimeEntry.fromDbRow).toList());
  }

  Stream<List<model.AnimeEntry>> watchByStatus(WatchStatus status) {
    return _dao
        .watchByStatus(status)
        .map((rows) => rows.map(model.AnimeEntry.fromDbRow).toList());
  }

  Stream<List<model.AnimeEntry>> watchByStatusSorted(
    WatchStatus status,
    SortOption sort,
  ) {
    return _dao
        .watchByStatusSorted(status, sort)
        .map((rows) => rows.map(model.AnimeEntry.fromDbRow).toList());
  }

  Stream<List<model.AnimeEntry>> watchAllWithSearch(String query) {
    return _dao
        .watchAllWithSearch(query)
        .map((rows) => rows.map(model.AnimeEntry.fromDbRow).toList());
  }

  Stream<List<model.AnimeEntry>> watchByStatusWithSearch(
    WatchStatus status,
    String query,
  ) {
    return _dao
        .watchByStatusWithSearch(status, query)
        .map((rows) => rows.map(model.AnimeEntry.fromDbRow).toList());
  }

  Stream<List<model.AnimeEntry>> watchFavorites() {
    return _dao.watchFavorites().map(
      (rows) => rows.map(model.AnimeEntry.fromDbRow).toList(),
    );
  }

  Stream<model.AnimeEntry?> watchById(String id) {
    return _dao
        .watchById(id)
        .map((row) => row == null ? null : model.AnimeEntry.fromDbRow(row));
  }

  Future<model.AnimeEntry?> getById(String id) async {
    final row = await _dao.getById(id);
    return row == null ? null : model.AnimeEntry.fromDbRow(row);
  }

  Future<model.AnimeEntry?> getByMalId(int malId) async {
    final row = await _dao.getByMalId(malId);
    return row == null ? null : model.AnimeEntry.fromDbRow(row);
  }

  Future<model.AnimeEntry?> getByAnilistId(int anilistId) async {
    final row = await _dao.getByAnilistId(anilistId);
    return row == null ? null : model.AnimeEntry.fromDbRow(row);
  }

  Future<void> insertEntry(model.AnimeEntry entry) =>
      _dao.insertEntry(entry.toCompanion());

  Future<void> updateEntry(model.AnimeEntry entry) =>
      _dao.updateEntry(entry.toCompanion());

  Future<void> deleteEntry(String id) => _dao.deleteEntry(id);

  Future<void> toggleFavorite(String id) => _dao.toggleFavorite(id);

  Future<Map<WatchStatus, int>> countByStatus() => _dao.countByStatus();
}
