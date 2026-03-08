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

    return CupertinoApp(
      title: 'Anime Watchlist',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final brightness = switch (themeMode) {
          AppThemeMode.light => Brightness.light,
          AppThemeMode.dark => Brightness.dark,
          AppThemeMode.system => MediaQuery.platformBrightnessOf(context),
        };
        final theme = brightness == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme;
        return CupertinoTheme(data: theme, child: child!);
      },
    );
  }
}
