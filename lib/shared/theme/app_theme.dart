import 'package:flutter/cupertino.dart';

class AppTheme {
  static const CupertinoThemeData lightTheme = CupertinoThemeData(
    primaryColor: CupertinoColors.systemIndigo,
    scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
  );

  static const CupertinoThemeData darkTheme = CupertinoThemeData(
    primaryColor: CupertinoColors.systemIndigo,
    scaffoldBackgroundColor: CupertinoColors.black,
    brightness: Brightness.dark,
  );
}
