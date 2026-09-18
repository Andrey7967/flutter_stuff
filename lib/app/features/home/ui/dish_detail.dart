import 'package:flutter/material.dart';
import "package:flutter_applab_1/app/entities/dish/model/dish_model.dart";
import 'package:flutter_applab_1/app/widgets/GlassBackButton/ui/ui.dart';

// Виджет экрана подробной информации о выбранном блюде
class DishDetailScreen extends StatelessWidget {
  final DishModel dish; // Экземпляр модели блюда, передаваемый при переходах

  const DishDetailScreen({
    super.key,
    required this.dish,
  });

  @override
  Widget build(BuildContext context) {
    // Извлечение текущей темы приложения из BuildContext для применения единых стилей
    final theme = Theme.of(context);

    return Scaffold(
      // CustomScrollView позволяет объединять сложную анимационную прокрутку со Sliver-виджетами
      body: CustomScrollView(
        slivers: [
          // Раскрывающийся и сворачивающийся верхний заголовок с изображением
          SliverAppBar(
            expandedHeight:
                300, // Высота панели в полностью развернутом состоянии
            pinned: true, // Закрепление панели вверху при прокрутке списка вниз
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  const GlassBackButton(), // Размещение кастомной прозрачной кнопки «Назад»
            ),
            flexibleSpace: FlexibleSpaceBar(
              // Отображение фонового изображения блюда во всю ширину
              background: Image.asset(
                dish.imagePath,
                fit: BoxFit.cover,
                // Заглушка, отображаемая в случае ошибки загрузки графического ресурса
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[300],
                  child:
                      const Icon(Icons.fastfood, size: 80, color: Colors.grey),
                ),
              ),
            ),
          ),
          // Адаптер, позволяющий поместить обычный RenderBox (Column) внутрь Sliver-структуры
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Горизонтальный контейнер с названием блюда и его форматированной ценой
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Виджет Expanded дает тексту названия занять все доступное место
                      Expanded(
                        child: Text(
                          dish.title,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Акцентное отображение цены из темы Material 3
                      Text(
                        dish.formattedPrice,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Информационный плашка-чип с указанием калорийности
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          size: 18,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${dish.calories} ккал',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Заголовок секции описания
                  Text(
                    'Описание',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Полный текст описания блюда
                  Text(
                    dish.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Нижняя фиксированная панель с кнопкой целевого действия
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            // Обработка нажатия с демонстрацией всплывающего уведомления (SnackBar)
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${dish.title} добавлено в заказ!')),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Добавить в заказ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
