import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/features/home/domain/usecaces/change_app_theme.dart';
import 'package:quotable/features/home/domain/usecaces/get_app_theme_usecase.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_events.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_states.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvents, AppSettingsStates> {
  final ChangeAppThemeUseCase changeAppThemeUseCase;
  final SetAppThemeUseCase setAppThemeUseCase;
  AppSettingsBloc({
    required this.changeAppThemeUseCase,
    required this.setAppThemeUseCase,
  }) : super(const AppSettingsInit()) {
    on<SetAppTheme>(onSetAppTheme);
    on<ChangeAppTheme>(onChangeAppTheme);
  }

  static AppSettingsBloc get(context) => BlocProvider.of(context);

  ThemeMode themeMode = ThemeMode.dark;

  onChangeAppTheme(
    ChangeAppTheme event,
    Emitter<AppSettingsStates> emit,
  ) async {
    try {
      themeMode = await changeAppThemeUseCase.call(params: event.isLight);

      emit(AppSettingsChangeTheme(mode: themeMode));
    } catch (e) {
      emit(AppSettingsFailureState(error: "$e"));
    }
  }

  onSetAppTheme(
    SetAppTheme event,
    Emitter<AppSettingsStates> emit,
  ) {
    try {
      themeMode = setAppThemeUseCase.call();
      emit(AppSettingsChangeTheme(mode: themeMode));
    } catch (e) {
      emit(AppSettingsFailureState(error: "$e"));
    }
  }
}
