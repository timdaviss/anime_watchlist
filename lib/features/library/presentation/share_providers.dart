import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/library_share_service.dart';

part 'share_providers.g.dart';

@riverpod
LibraryShareService libraryShareService(Ref ref) {
  return LibraryShareService();
}
