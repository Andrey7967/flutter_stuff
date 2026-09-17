import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:flutter_applab_1/app/features/features.dart';
import 'package:flutter_applab_1/di/di.dart';

// GlobalKey дает доступ к NavigatorState без прямого использования BuildContext,
// что полезно при навигации из фоновых сервисов или обработчиков событий
final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

// Декларативная конфигурация GoRouter для управления стэком навигации
final router = GoRouter(
  // Наблюдатель отслеживает переходы между экранами и отправляет логи в Talker
  observers: [TalkerRouteObserver(talker)],
  debugLogDiagnostics: true, // Логирование внутренних событий роутера в консоль
  initialLocation: '/home',
  navigatorKey: _rootNavigationKey,
  routes: [
    GoRoute(
      path: '/home',
      // pageBuilder используется вместо builder для кастомизации ключей страниц и анимаций переходов
      pageBuilder: (_, state) =>
          MaterialPage(key: state.pageKey, child: const HomeScreen()),
    ),
  ],
);
