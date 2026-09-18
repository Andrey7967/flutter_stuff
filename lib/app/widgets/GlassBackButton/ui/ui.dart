import 'dart:ui';
import 'package:flutter/material.dart';

// Кастомный виджет кнопки навигации «Назад» с эффектом размытия заднего фона (Glassmorphism)
class GlassBackButton extends StatelessWidget {
  final VoidCallback? onPressed; // Дополнительный callback-обработчик клика
  final double size; // Фиксированный размер стороны квадратной кнопки

  const GlassBackButton({
    super.key,
    this.onPressed,
    this.size = 44.0,
  });

  @override
  Widget build(BuildContext context) {
    // Виджет ClipRRect скругляет углы дочерних элементов по заданному радиусу
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      // BackdropFilter накладывает фильтр размытия на область под кнопкой
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            // Полупрозрачная темная подложка для эффекта матового стекла
            color: Colors.black12.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
            // Тонкая полупрозрачная белая рамка
            border: Border.all(
              color: Colors.white.withOpacity(0.45),
              width: 1,
            ),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Colors.black38, // Цвет и полупрозрачность тени иконки
                  offset: Offset(2, 2), // Смещение тени по осям X и Y
                  blurRadius: 4, // Радиус размытия тени
                ),
              ],
            ),
            // Если передан внешний onPressed — вызывается он, иначе выполняем стандартный pop из стэка
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
