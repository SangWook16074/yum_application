import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/basic_bottom_sheet.dart';

class RecpieBottomSheet extends StatefulWidget {
  const RecpieBottomSheet({super.key});

  @override
  State<RecpieBottomSheet> createState() => _RecpieBottomSheet();
}

class _RecpieBottomSheet extends State<RecpieBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
      height: 584,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "냉장고 속 식재료 선택하기",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.left,
          ),
          Text(
            "남은 음식은 1 가지만 선택 가능해요!",
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
