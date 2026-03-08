import 'package:drift/drift.dart' show Value;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/database/app_database.dart' as db;
import 'watch_status.dart';

part 'anime_entry.freezed.dart';
part 'anime_entry.g.dart';

@freezed
abstract class AnimeEntry with _$AnimeEntry {
  const factory AnimeEntry({
    required String id,
    required String title,
    String? titleJapanese,
    String? synopsis,
    String? coverImageUrl,
    int? totalEpisodes,
    required WatchStatus watchStatus,
    double? rating,
    String? notes,
    @Default(false) bool isFavorite,
    String? genres,
    int? malId,
    int? anilistId,
    required AnimeSource source,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AnimeEntry;

  const AnimeEntry._();

  factory AnimeEntry.fromJson(Map<String, dynamic> json) =>
      _$AnimeEntryFromJson(json);

  factory AnimeEntry.fromDbRow(db.AnimeEntry row) {
    return AnimeEntry(
      id: row.id,
      title: row.title,
      titleJapanese: row.titleJapanese,
      synopsis: row.synopsis,
      coverImageUrl: row.coverImageUrl,
      totalEpisodes: row.totalEpisodes,
      watchStatus: row.watchStatus,
      rating: row.rating,
      notes: row.notes,
      isFavorite: row.isFavorite,
      genres: row.genres,
      malId: row.malId,
      anilistId: row.anilistId,
      source: row.source,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  db.AnimeEntriesCompanion toCompanion() {
    return db.AnimeEntriesCompanion(
      id: Value(id),
      title: Value(title),
      titleJapanese: Value(titleJapanese),
      synopsis: Value(synopsis),
      coverImageUrl: Value(coverImageUrl),
      totalEpisodes: Value(totalEpisodes),
      watchStatus: Value(watchStatus),
      rating: Value(rating),
      notes: Value(notes),
      isFavorite: Value(isFavorite),
      genres: Value(genres),
      malId: Value(malId),
      anilistId: Value(anilistId),
      source: Value(source),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
