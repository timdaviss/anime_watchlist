import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../domain/anime_entry.dart';

class LibraryExportService {
  Future<String> exportToJson(List<AnimeEntry> entries) {
    final jsonList = entries.map((entry) => entry.toJson()).toList();
    final wrapper = {
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'count': entries.length,
      'entries': jsonList,
    };

    return Future.value(const JsonEncoder.withIndent('  ').convert(wrapper));
  }

  Future<File> exportToFile(List<AnimeEntry> entries) async {
    final json = await exportToJson(entries);
    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File(
      '${directory.path}/anime_watchlist_backup_$timestamp.json',
    );

    return file.writeAsString(json);
  }

  Future<List<AnimeEntry>> importFromJson(String jsonString) async {
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is! Map<String, dynamic>) {
        throw const FormatException('Backup root must be a JSON object.');
      }

      final version = decoded['version'];
      if (version is! int) {
        throw const FormatException('Backup version is missing or invalid.');
      }

      final entriesJson = decoded['entries'];
      if (entriesJson is! List<dynamic>) {
        throw const FormatException('Backup entries must be a JSON array.');
      }

      return entriesJson.map((entryJson) {
        if (entryJson is! Map<String, dynamic>) {
          throw const FormatException('Each entry must be a JSON object.');
        }

        return AnimeEntry.fromJson(entryJson);
      }).toList();
    } on FormatException {
      rethrow;
    } catch (error) {
      throw FormatException('Invalid backup file format: $error');
    }
  }
}
