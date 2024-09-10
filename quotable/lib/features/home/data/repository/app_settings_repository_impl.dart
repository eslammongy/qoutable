import 'package:flutter/material.dart';
import 'package:quotable/core/utils/user_pref.dart';
import 'package:quotable/features/home/domain/repository/app_settings_repo.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepo {
  @override
  Future<ThemeMode> changeAppTheme(bool isLight) async {
    try {
      if (isLight) {
        await SharedPref.saveSelectedAppTheme(ThemeModes.lightTheme);
        return ThemeMode.light;
      } else {
        await SharedPref.saveSelectedAppTheme(ThemeModes.darkTheme);
        return ThemeMode.dark;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  ThemeMode setAppTheme() {
    try {
      final theme = SharedPref.getSelectedAppTheme();
      if (theme == ThemeModes.lightTheme.name) {
        return ThemeMode.light;
      } else {
        return ThemeMode.dark;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
