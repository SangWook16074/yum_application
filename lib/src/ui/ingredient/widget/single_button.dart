import 'package:flutter/material.dart';

class SingleButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const SingleButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        key: const Key("Single Button"),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width - 20, 40),
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
