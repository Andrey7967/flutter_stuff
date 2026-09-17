import 'package:flutter/material.dart';

// Расширение типов num (int/double) для сокращения синтаксиса отступов в дереве виджетов.

extension EmptyPadding on num {
  // Возвращает фиксированный интервал по вертикали для Column
  SizedBox get ph => SizedBox(height: toDouble());
  // Возвращает фиксированный интервал по горизонтали для Row
  SizedBox get pw => SizedBox(width: toDouble());
}
