import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/home/presentation/home_screen.dart';
import 'shared/theme/app_theme.dart';
import 'shared/theme/theme_provider.dart';

class AnimeWatchlistApp extends ConsumerWidget {
  const AnimeWatchlistApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSettingProvider);

    final theme = switch (themeMode) {
      AppThemeMode.light => AppTheme.lightTheme,
      AppThemeMode.dark => AppTheme.darkTheme,
      AppThemeMode.system => AppTheme.systemTheme,
    };

    return CupertinoApp(
      title: 'Anime Watchlist',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
