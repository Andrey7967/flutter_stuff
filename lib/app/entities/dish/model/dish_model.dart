class DishModel {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final double price;

  const DishModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
  });

  String get formattedPrice => '${price.toStringAsFixed(0)} ₽';
}
