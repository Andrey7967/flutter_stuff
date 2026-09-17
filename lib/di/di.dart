import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

// GetIt — глобальный Service Locator для внедрения зависимостей (DI) без использования BuildContext
final getIt = GetIt.instance;

// Инициализация синглтона Talker для сквозного логирования ошибок и работы сети
final talker = TalkerFlutter.init();

// Асинхронная регистрация сервисов в контейнере до запуска графического интерфейса
Future<void> setupLocator() async {
  getIt.registerSingleton(talker);
}
