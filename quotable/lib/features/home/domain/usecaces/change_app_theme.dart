import 'package:flutter/material.dart';
import 'package:quotable/features/home/domain/repository/app_settings_repo.dart';

class ChangeAppThemeUseCase {
  final AppSettingsRepo appSettingsRepo;

  ChangeAppThemeUseCase({required this.appSettingsRepo});

  ThemeMode call({bool params = false}) {
    return appSettingsRepo.changeAppTheme(params);
  }
}
