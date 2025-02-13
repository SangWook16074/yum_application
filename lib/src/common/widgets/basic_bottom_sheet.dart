import 'package:flutter/material.dart';

class BasicBottomSheet extends StatelessWidget {
  final Widget child;
  final double height;

  const BasicBottomSheet({super.key, required this.child, this.height = 500});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(32.0))),
      child: child,
    );
  }
}
