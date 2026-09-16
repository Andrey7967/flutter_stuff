import 'package:flutter/material.dart';
import 'package:flutter_applab_1/domain/repositories/content/model/content.dart';
import 'package:flutter_applab_1/app/extensions/widget_extensions.dart';

class DishCard extends StatelessWidget {
  final Content dish;
  final VoidCallback? onTap;

  const DishCard({super.key, required this.dish, this.onTap});

  String get _displayPrice {
    if (dish.price != null && dish.price! > 0) {
      return '${dish.price!.toInt()} ₽';
    }
    return dish.formattedPrice;
  }

  @override
  Widget build(BuildContext context) {
    const imageSize = 100.0;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: SizedBox(
        height: imageSize,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                dish.imagePath,
                height: imageSize,
                width: imageSize,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: imageSize,
                  width: imageSize,
                  color: Colors.grey[200],
                  child: const Icon(Icons.fastfood, color: Colors.grey),
                ),
              ),
            ),
            16.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  4.ph,
                  Expanded(
                    child: Text(
                      dish.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  4.ph,
                  Text(
                    _displayPrice,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
