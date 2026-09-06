class DishModel {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final double price;
  final int calories;

  const DishModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.calories,
  });

  String get formattedPrice => '${price.toStringAsFixed(0)} ₽';
}
