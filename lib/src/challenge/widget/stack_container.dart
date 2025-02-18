import 'package:flutter/material.dart';

class StackContainer extends StatelessWidget {
  final String title;
  final Color color;
  final double opacity;

  const StackContainer({
    super.key,
    required this.title,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Opacity(
            opacity: opacity,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
