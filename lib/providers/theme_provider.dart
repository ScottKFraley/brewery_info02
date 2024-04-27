import 'package:flutter/material.dart';

import 'app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;  // start as light

  bool get isDarkMode => themeMode == ThemeMode.dark;

  // void toggleTheme -- not building in a local switch for theme change.
  // only going off of the device's system setting.
}

class AppThemes {

  static final lightTheme = BreweryAppTheme.lightTheme;
  static final darkTheme = BreweryAppTheme.darkTheme;

}
