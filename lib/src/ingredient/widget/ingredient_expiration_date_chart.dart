import 'package:flutter/material.dart';
import 'dart:math';

class IngredientExprationDateChart extends CustomPainter {
  final DateTime startAt;
  final DateTime endAt;

  IngredientExprationDateChart({
    required this.startAt,
    required this.endAt,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final now = DateTime.now();
    final total = (endAt.difference(startAt).inHours).ceil();
    final rest = (endAt.difference(now).inHours).ceil();
    if (rest < 0) {
      return;
    } else {
      final restToRadian = 2 * pi * rest / total;
      final radius = (size.width / 2) * 0.8;
      final paint = Paint()..color = const Color(0xfff3f3f3);
      canvas.drawArc(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.width / 2), radius: radius),
          -pi / 2,
          restToRadian,
          true,
          paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
