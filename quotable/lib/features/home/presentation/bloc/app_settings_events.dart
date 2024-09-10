abstract class AppSettingsEvents {
  const AppSettingsEvents();
}

class ChangeAppTheme extends AppSettingsEvents {
  final bool isLight;
  const ChangeAppTheme({this.isLight = false});
}

class SetAppTheme extends AppSettingsEvents {
  const SetAppTheme();
}
