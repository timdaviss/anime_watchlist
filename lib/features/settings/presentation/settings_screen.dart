import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/theme/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeSettingProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Settings')),
      child: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Text(
                'APPEARANCE',
                style: TextStyle(
                  fontSize: 13,
                  color: CupertinoColors.secondaryLabel,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CupertinoListSection.insetGrouped(
              children: [
                for (final mode in AppThemeMode.values)
                  CupertinoListTile(
                    leading: Icon(_iconForTheme(mode)),
                    title: Text(mode.displayName),
                    trailing: currentTheme == mode
                        ? const Icon(
                            CupertinoIcons.checkmark,
                            color: CupertinoColors.systemIndigo,
                            size: 20,
                          )
                        : null,
                    onTap: () =>
                        ref.read(themeSettingProvider.notifier).setTheme(mode),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconForTheme(AppThemeMode mode) {
    return switch (mode) {
      AppThemeMode.system => CupertinoIcons.device_phone_portrait,
      AppThemeMode.light => CupertinoIcons.sun_max,
      AppThemeMode.dark => CupertinoIcons.moon,
    };
  }
}
