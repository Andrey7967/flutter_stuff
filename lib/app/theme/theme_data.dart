import 'package:flutter/material.dart';

import 'theme_colors.dart';

// Класс для централизованной конфигурации ThemeData приложения
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // Включение Material 3 спецификации для доступа к обновленным виджетам и гайдлайнам
      useMaterial3: true,
      scaffoldBackgroundColor: ThemeColors.white,
      colorScheme: _colorScheme,
      appBarTheme: _appBarTheme,
    );
  }
}

// ColorScheme.fromSeed автоматически генерирует гармоничную цветовое палитру
// (Primary, Secondary, Surface и т.д.) на основе одного базового цвета
final _colorScheme = ColorScheme.fromSeed(seedColor: ThemeColors.accent);

// Глобальная стилизация AppBar для исключения дублирования параметров на каждом экране
final _appBarTheme = const AppBarTheme(
  toolbarHeight: 50,
  elevation: 0,
  // Отключение смены цвета AppBar при скролле содержимого под него
  scrolledUnderElevation: 0,
  centerTitle: true,
  titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ThemeColors.white,
  ),
  backgroundColor: ThemeColors.black,
);
