import 'package:flutter/material.dart';

abstract class AppSettingsRepo {
  Future<ThemeMode> changeAppTheme(bool isLight);
  ThemeMode setAppTheme();
}
