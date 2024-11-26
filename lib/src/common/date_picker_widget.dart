import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final void Function()? onTap;
  const DatePickerWidget({super.key, this.onTap})
      : assert(onTap != null, "onTap 함수 지정해라 이준호");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0, right: 16.0, left: 48.0),
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "년",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              "월",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              "일",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
