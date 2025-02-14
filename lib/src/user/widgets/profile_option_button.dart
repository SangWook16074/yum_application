import 'package:flutter/material.dart';
import 'package:yum_application/src/common/widgets/image_widget.dart';

class ProfileOptionButton extends StatelessWidget {
  final String label;
  final int count;
  const ProfileOptionButton(
      {super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 106,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
      decoration: BoxDecoration(
          color: const Color(0xfff2f2f2),
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _image(),
          _label(),
          _counter(),
        ],
      ),
    );
  }

  Widget _image() => Padding(
        padding: const EdgeInsets.all(2.0),
        child: ImageWidget(
          path: ImagePath.recipeOn,
          width: 90,
        ),
      );

  Widget _label() => Builder(builder: (context) {
        return Text(
          label,
          style: const TextStyle(
              fontSize: 16,
              color: Color(0xffa2a2a2),
              fontWeight: FontWeight.w400),
        );
      });

  Widget _counter() => Builder(
      builder: (context) => Text(
            count.toString(),
            style: const TextStyle(
                fontSize: 16,
                color: Color(0xffa2a2a2),
                fontWeight: FontWeight.w400),
          ));
}
