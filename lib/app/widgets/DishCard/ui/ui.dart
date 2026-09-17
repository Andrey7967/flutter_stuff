import 'package:flutter/material.dart';

import 'package:flutter_applab_1/app/entities/entities.dart';

// Переиспользуемый виджет карточки блюда (StatelessWidget, так как не хранит изменяемое состояние)
class DishCard extends StatelessWidget {
  final DishModel dish;
  final VoidCallback? onTap;

  const DishCard({super.key, required this.dish, this.onTap});

  @override
  Widget build(BuildContext context) {
    const imageSize = 100.0;

    // InkWell обеспечивает визуальный отклик на нажатие (Material ripple effect).
    // Важно: требует наличия ancestor-виджета Material в дереве для отрисовки эффекта.
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      // SizedBox жестко задает высоту всей карточке, ограничивая дочерний Row
      child: SizedBox(
        height: imageSize,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect создает физический слой обрезки (clipping layer) в графическом Canvas
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                dish.imagePath,
                height: imageSize,
                width: imageSize,
                fit: BoxFit
                    .cover, // Пропорциональное заполнение области без искажения
              ),
            ),
            const SizedBox(width: 16),
            // Expanded отдает оставшееся доступное по горизонтали пространство текстовому блоку,
            // предотвращая ошибку RenderFlex overflow при длинных названиях
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.title,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis, // Обрезка текста с многоточием
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  // Внутренний Expanded заставляет описание занять всю свободную высоту
                  // между заголовком и ценой
                  Expanded(
                    child: Text(
                      dish.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    dish.formattedPrice,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          // Динамическое извлечение акцентного цвета из установленной ThemeData
                          color: Theme.of(context).primaryColor,
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
