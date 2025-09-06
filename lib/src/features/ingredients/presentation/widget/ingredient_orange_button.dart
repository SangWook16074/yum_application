import 'package:flutter/material.dart';

class IngredientOrangeButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double width;
  final VoidCallback? onTap;

  const IngredientOrangeButton({
    required this.title,
    required this.width,
    super.key,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF97316),
          borderRadius: BorderRadius.circular(8),
        ),
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisAlignment:
              icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 12,
                color: const Color(0xffffffff),
              ),
              const SizedBox(width: 4),
            ],
            Text(
              title,
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
