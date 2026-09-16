import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content {
  final int id;
  final String title;
  final String author;
  final String description;
  final String image;
  final double? price;
  final int? calories;

  const Content({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.image,
    this.price,
    this.calories,
  });

  String get imagePath => image;

  String get formattedPrice =>
      price != null && price! > 0 ? '${price!.toInt()} ₽' : author;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  Content copyWith({
    int? id,
    String? title,
    String? author,
    String? description,
    String? image,
    double? price,
    int? calories,
  }) {
    return Content(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      calories: calories ?? this.calories,
    );
  }
}
