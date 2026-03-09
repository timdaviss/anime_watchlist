import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/providers/core_providers.dart';

part 'theme_provider.g.dart';

enum AppThemeMode {
  system,
  light,
  dark;

  String get displayName => switch (this) {
    AppThemeMode.system => 'System',
    AppThemeMode.light => 'Light',
    AppThemeMode.dark => 'Dark',
  };
}

@Riverpod(keepAlive: true)
class ThemeSetting extends _$ThemeSetting {
  static const _key = 'theme_mode';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  AppThemeMode build() {
    final value = _prefs.getString(_key);
    if (value == null) {
      return AppThemeMode.system;
    }
    return AppThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => AppThemeMode.system,
    );
  }

  Future<void> setTheme(AppThemeMode mode) async {
    state = mode;
    await _prefs.setString(_key, mode.name);
  }
}
