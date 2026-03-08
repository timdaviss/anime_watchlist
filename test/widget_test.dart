import 'package:anime_watchlist/shared/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app theme uses system indigo primary', () {
    expect(AppTheme.lightTheme.primaryColor, CupertinoColors.systemIndigo);
    expect(AppTheme.darkTheme.brightness, Brightness.dark);
  });
}
