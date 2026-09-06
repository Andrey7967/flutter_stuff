import 'dart:ui';
import 'package:flutter/material.dart';

class GlassBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;

  const GlassBackButton({
    super.key,
    this.onPressed,
    this.size = 44.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
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
                  color: Colors.black38, // Цвет и полупрозрачность тени
                  offset: Offset(2, 2), // Смещение тени по оси X и Y

                  blurRadius: 4, // Радиус размытия
                ),
              ],
            ),
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
