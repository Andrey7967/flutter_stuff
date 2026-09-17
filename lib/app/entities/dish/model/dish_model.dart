// Immutable дата-класс (все поля final) гарантирует, что модель не будет
// случайно изменена во время жизненного цикла виджетов и перерисовок.
class DishModel {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final double price;

  // Константный конструктор позволяет Flutter оптимизировать память
  // при создании множества эквивалентных объектов во время билда.
  const DishModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
  });

  // Геттер для форматирования цены, чтобы вынести логику представления из UI-компонентов
  String get formattedPrice => '${price.toStringAsFixed(0)} ₽';
}
