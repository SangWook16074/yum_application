import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final void Function()? onTap;
  final DateTime? time;
  final bool notINF;
  const DatePickerWidget({super.key, this.onTap, this.time, this.notINF = true})
      : assert(onTap != null, "onTap 함수 지정해라 이준호");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, child: (!notINF) ? _infWidget() : _basicPicker());
  }

  Widget _infWidget() => Builder(builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 16.0),
          height: 40,
          width: 163,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Text(
            "무제한",
            style: Theme.of(context).textTheme.labelSmall,
          )),
        );
      });

  Widget _basicPicker() => Builder(builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 16.0),
          height: 40,
          width: 163,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                (time != null) ? "${time!.year}" : "년",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              VerticalDivider(
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              Text(
                (time != null) ? "${time!.month}" : "월",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              VerticalDivider(
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              Text(
                (time != null) ? "${time!.day}" : "일",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
                size: 24.0,
              ),
            ],
          ),
        );
      });
}
