import 'package:flutter/material.dart';

import 'package:flutter_applab_1/app/extensions/extensions.dart';
import 'package:flutter_applab_1/app/features/home/data/mock/mock.dart';
import 'package:flutter_applab_1/app/widgets/widgets.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Меню', style: Theme.of(context).textTheme.headlineLarge),
            20.ph,
            ListView.separated(
              primary: false,
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
