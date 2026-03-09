import 'package:anime_watchlist/core/providers/core_providers.dart';
import 'package:anime_watchlist/shared/theme/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late ProviderContainer container;

  setUp(() async {
    // Initialize SharedPreferences with empty mock data
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    // Create container with overridden sharedPreferencesProvider
    container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('defaults to AppThemeMode.system when no persisted value', () {
    final theme = container.read(themeSettingProvider);
    expect(theme, AppThemeMode.system);
  });

  test('reads persisted theme mode on build', () async {
    // Clear and set up with dark theme persisted
    SharedPreferences.setMockInitialValues({'flutter.theme_mode': 'dark'});
    final prefs = await SharedPreferences.getInstance();

    container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );

    final theme = container.read(themeSettingProvider);
    expect(theme, AppThemeMode.dark);
  });

  test('falls back to system for unknown persisted value', () async {
    // Set up with garbage value
    SharedPreferences.setMockInitialValues({'flutter.theme_mode': 'garbage'});
    final prefs = await SharedPreferences.getInstance();

    container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );

    final theme = container.read(themeSettingProvider);
    expect(theme, AppThemeMode.system);
  });

  test('setTheme updates state and persists', () async {
    final notifier = container.read(themeSettingProvider.notifier);
    final prefs = await SharedPreferences.getInstance();

    // Set theme to dark
    await notifier.setTheme(AppThemeMode.dark);

    // Verify state is updated
    final state = container.read(themeSettingProvider);
    expect(state, AppThemeMode.dark);

    // Verify persisted value
    final persistedValue = prefs.getString('theme_mode');
    expect(persistedValue, 'dark');
  });

  test('setTheme can switch between all modes', () async {
    final notifier = container.read(themeSettingProvider.notifier);
    final prefs = await SharedPreferences.getInstance();

    // Test light mode
    await notifier.setTheme(AppThemeMode.light);
    expect(container.read(themeSettingProvider), AppThemeMode.light);
    expect(prefs.getString('theme_mode'), 'light');

    // Test dark mode
    await notifier.setTheme(AppThemeMode.dark);
    expect(container.read(themeSettingProvider), AppThemeMode.dark);
    expect(prefs.getString('theme_mode'), 'dark');

    // Test system mode
    await notifier.setTheme(AppThemeMode.system);
    expect(container.read(themeSettingProvider), AppThemeMode.system);
    expect(prefs.getString('theme_mode'), 'system');
  });
}
