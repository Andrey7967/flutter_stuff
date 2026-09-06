import 'package:uuid/uuid.dart';
import 'package:flutter_applab_1/app/entities/entities.dart';

const _uuid = Uuid();

final mockDishes = [
  DishModel(
    id: _uuid.v4(),
    title: 'Surströmming',
    description: 'Блюдо из вкусных рыбов (возможно)',
    imagePath: 'assets/images/sur.jpg',
    price: 5000,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Касу-марцу',
    description: 'Вкуснейший сыр с нюансами',
    imagePath: 'assets/images/kasu-martsu.webp',
    price: 650,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Дуриан',
    description: 'Сочный тропический фрукт с уникальным ароматом',
    imagePath: 'assets/images/dur.jpg',
    price: 580,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Хаукарль',
    description: 'Исландская вяленая акула с выразительным аммиачным акцентом',
    imagePath: 'assets/images/hakarl.jpg',
    price: 3200,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Столетнее яйцо',
    description: 'Темный деликатес с тонким ароматом выдержки и времени',
    imagePath: 'assets/images/century_egg.jpg',
    price: 800,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Рыба Фугу',
    description: 'Опасный деликатес для любителей поиграть со судьбой',
    imagePath: 'assets/images/fugu.jpg',
    price: 12000,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Саннакчи',
    description: 'Живой осьминог, который весело щекочет горло изнутри',
    imagePath: 'assets/images/sanakchi.jpg',
    price: 2400,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Вонючий тофу',
    description: 'Обжаренный тофу с неповторимым шлейфом азиатских улиц',
    imagePath: 'assets/images/tofu.jpg',
    price: 550,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'строганина',
    description:
        'сырая рыба, нарезанная тонкими ломтиками и подаваемая с соусом',
    imagePath: 'assets/images/stroganina.jpg',
    price: 15000,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Лютефиск',
    description: 'Треска в щелочном растворе со скользящей текстурой желе',
    imagePath: 'assets/images/lut.jpg',
    price: 1800,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Жареный тарантул',
    description: 'Хрустящий камбоджийский перекус с пикантными лапками',
    imagePath: 'assets/images/tar.jpg',
    price: 900,
  ),
  DishModel(
    id: _uuid.v4(),
    title: 'Эскамолес',
    description:
        'Икра гигантских черных муравьев с легким ореховым тоном. Привет из Мексики!',
    imagePath: 'assets/images/ant.jpg',
    price: 3500,
  ),
];
