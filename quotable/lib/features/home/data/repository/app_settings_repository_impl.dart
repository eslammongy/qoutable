import 'package:flutter/material.dart';
import 'package:quotable/features/home/domain/repository/app_settings_repo.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepo {
  @override
  ThemeMode changeAppTheme(bool isLight) {
    try {
      if (isLight) {
        return ThemeMode.light;
      } else {
        return ThemeMode.dark;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
