import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModes { darkTheme, lightTheme }

class SharedPref {
  static const String selectedThemeKey = "APP_THEME_KEY";
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveSelectedAppTheme(ThemeModes theme) async {
    return await sharedPreferences.setString(selectedThemeKey, theme.name);
  }

  static String getSelectedAppTheme() {
    return sharedPreferences.getString(selectedThemeKey) ??
        ThemeModes.darkTheme.name;
  }
}
