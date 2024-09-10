import 'package:flutter/material.dart';
import 'package:quotable/features/home/domain/repository/app_settings_repo.dart';

class SetAppThemeUseCase {
  final AppSettingsRepo appSettingsRepo;

  SetAppThemeUseCase({required this.appSettingsRepo});

  ThemeMode call() {
    return appSettingsRepo.setAppTheme();
  }
}
