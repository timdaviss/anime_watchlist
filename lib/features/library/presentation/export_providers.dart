import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/library_export_service.dart';

part 'export_providers.g.dart';

@riverpod
LibraryExportService libraryExportService(Ref ref) {
  return LibraryExportService();
}
