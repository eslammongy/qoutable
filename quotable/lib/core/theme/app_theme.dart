import 'package:flutter/material.dart';
import 'package:quotable/core/theme/app_colors_extension.dart';

class AppTheme {
  final ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      extensions: [
        _lightAppColors,
      ],
    );
  }();

  static final _lightAppColors = AppColorEx(
    primary: const Color(0xFF8B5CF9),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffff3201),
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    tertiary: const Color.fromARGB(255, 245, 235, 235),
  );

  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      extensions: [
        _darkAppColors,
      ],
    );
  }();

  static final _darkAppColors = AppColorEx(
    primary: const Color(0xFF8B5CF9),
    onPrimary: Colors.black,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffff3201),
    onError: Colors.black,
    background: const Color(0xff262626),
    onBackground: Colors.white,
    surface: const Color(0xff121212),
    onSurface: Colors.white,
    tertiary: const Color(0xFF3D3D3D),
  );
}

/// Here you should define getters for your `ThemeExtension`s.
/// Never use `Theme.of(context).extension<MyColors>()!`
/// Usage example: `Theme.of(context).appColors`.
extension AppThemeExtension on ThemeData {
  AppColorEx get appColors =>
      extension<AppColorEx>() ?? AppTheme._lightAppColors;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorSchemeGetter on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
