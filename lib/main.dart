// Импорт библиотеки Material Design, содержащей базовые виджеты и стили Flutter
import 'package:flutter/material.dart';

// Главная функция — точка входа в приложение
void main() {
  // Запуск приложения и монтирование корневого виджета MainApp в дерево виджетов
  runApp(const MainApp());
}

/// Главный виджет приложения, не содержащий изменяемого состояния
class MainApp extends StatelessWidget {
  // Конструктор виджета с передачей ключа (super.key) в базовый класс
  const MainApp({super.key});

  // Метод build описывает, из каких виджетов собирается пользовательский интерфейс
  @override
  Widget build(BuildContext context) {
    // MaterialApp задает общую концепцию и тему приложения в стиле Material Design
    return const MaterialApp(
      // Scaffold предоставляет базовую разметку экрана (фон, элементы)
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
