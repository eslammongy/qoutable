import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/features/home/domain/usecaces/change_app_theme.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_events.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_states.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvents, AppSettingsStates> {
  final ChangeAppThemeUseCase changeAppTheme;
  AppSettingsBloc({required this.changeAppTheme})
      : super(const AppSettingsInit()) {
    on<ChangeAppTheme>(onChangeAppTheme);
  }

  ThemeMode themeMode = ThemeMode.dark;

  onChangeAppTheme(ChangeAppTheme event, Emitter<AppSettingsStates> emit) {
    try {
      themeMode = changeAppTheme.call(params: event.isLight);
      debugPrint("Change App Theme to $themeMode");
      emit(AppSettingsChangeTheme(mode: themeMode));
    } catch (e) {
      emit(AppSettingsFailureState(error: "$e"));
    }
  }
}
