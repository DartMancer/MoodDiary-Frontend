import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomThemeProvider extends ChangeNotifier {
  bool get isDarkMode => themeMode == ThemeMode.dark;

  ThemeMode _themeMode =
      ThemeMode.system; // Изначально используем системную тему

  CustomThemeProvider() {
    loadThemeMode(); // Загружаем сохраненную тему при создании объекта
  }

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    saveThemeMode(); // Сохраняем выбранную тему при изменении
    notifyListeners(); // Уведомляем слушателей об изменении темы
  }

  // Метод для загрузки сохраненной темы из SharedPreferences
  void loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt('is_night_mode');
    if (themeModeIndex != null) {
      _themeMode = ThemeMode.values[themeModeIndex];
      notifyListeners(); // Уведомляем слушателей об изменении темы
    }
  }

  // Метод для сохранения текущей темы в SharedPreferences
  void saveThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('is_night_mode', _themeMode.index);
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundDarkClr,
    primaryColor: mainClr,
    colorScheme: ColorScheme.dark(
      primary: greyClr1,
      secondary: greyClr2,
      tertiary: greyClr3,
    ),
    iconTheme: IconThemeData(color: greyClr2),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: blackClr,
        fontFamily: fontApp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: blackClr,
        fontFamily: fontApp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundLightClr,
    primaryColor: mainClr,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: blackClr,
        fontFamily: fontApp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: blackClr,
        fontFamily: fontApp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
