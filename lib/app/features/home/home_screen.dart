import 'package:flutter/material.dart';

import 'package:flutter_applab_1/app/extensions/extensions.dart';
import 'package:flutter_applab_1/app/features/home/data/mock/mock.dart';
import 'package:flutter_applab_1/app/widgets/widgets.dart';

// StatefulWidget используется для экранов, которые в будущем будут иметь
// динамическое состояние (загрузка данных, фильтрация меню, управление корзиной).
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Электронный официант')),
      // SingleChildScrollView оборачивает контент для предотвращения Overflow (выхода за границы экрана)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme.of(context) выполняет поиск ближайшего InheritedWidget типа ThemeData
            // по дереву элементов выше для соблюдения единого дизайна
            Text('Меню', style: Theme.of(context).textTheme.headlineLarge),
            20.ph,
            // ListView.separated встроен в Column, поэтому требуются специфичные параметры скролла:
            ListView.separated(
              // primary: false отключает собственную привязку к ScrollController экрана
              primary: false,
              // shrinkWrap: true заставляет ListView рассчитать точную высоту всех элементов
              // сразу (отключает ленивую загрузку), избегая конфликтов бесконечных ограничений высоты с Column
              shrinkWrap: true,
              itemCount: mockDishes.length,
              itemBuilder: (_, index) => DishCard(dish: mockDishes[index]),
              separatorBuilder: (_, __) => 16.ph,
            ),
          ],
        ),
      ),
    );
  }
}
