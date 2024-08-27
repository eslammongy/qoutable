import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class AppSettingsStates extends Equatable {
  final ThemeMode? mode;
  final String? errMsg;
  const AppSettingsStates({this.mode, this.errMsg});

  @override
  List<Object> get props => [mode!, errMsg!];
}

class AppSettingsInit extends AppSettingsStates {
  const AppSettingsInit();
}

class AppSettingsChangeTheme extends AppSettingsStates {
  const AppSettingsChangeTheme({required ThemeMode mode}) : super(mode: mode);
}

class AppSettingsFailureState extends AppSettingsStates {
  const AppSettingsFailureState({required String error}) : super(errMsg: error);
}
