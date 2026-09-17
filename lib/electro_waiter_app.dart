import 'package:flutter/material.dart';

import 'app/app.dart';

class ElectroWaiterApp extends StatelessWidget {
  const ElectroWaiterApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp.router интегрирует декларативную систему маршрутизации (GoRouter)
    // в концепцию корневого приложения Flutter
    return MaterialApp.router(
      debugShowCheckedModeBanner:
          false, // Отключение плашки DEBUG в отладочной сборке
      title: 'Электронный официант',
      theme: AppTheme.lightTheme,
      // Делегирование обработки URL и состояния навигатора объекту `router`
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
