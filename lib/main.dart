import 'package:flutter/material.dart';

import 'di/di.dart';
import 'electro_waiter_app.dart';

void main() async {
  // Явная инициализация связующего слоя между Flutter Engine и платформой (iOS/Android)
  // Обязательна, если до runApp() выполняются асинхронные операции или вызовы Platform Channels
  WidgetsFlutterBinding.ensureInitialized();

  // Регистрация сервисов в Service Locator
  await setupLocator();

  // Перехват необработанных ошибок самого фреймворка Flutter (ошибки построения верстки и т.д.)
  // и перенаправление их в логгер Talker
  FlutterError.onError = (details) {
    return talker.handle(details.exception, details.stack);
  };

  // Запуск приложения: монтирует корневой элемент в дерево RenderObject и запускает цикл отрисовки
  runApp(const ElectroWaiterApp());
}
