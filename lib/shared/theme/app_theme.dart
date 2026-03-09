import 'package:flutter/cupertino.dart';

class AppTheme {
  static const CupertinoThemeData lightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.systemIndigo,
    scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
  );

  static const CupertinoThemeData darkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.systemIndigo,
    scaffoldBackgroundColor: CupertinoColors.black,
  );

  /// No explicit brightness — CupertinoApp follows the platform setting.
  static const CupertinoThemeData systemTheme = CupertinoThemeData(
    primaryColor: CupertinoColors.systemIndigo,
    scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
  );
}
