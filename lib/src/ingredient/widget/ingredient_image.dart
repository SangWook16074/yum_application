import 'package:flutter/material.dart';
import 'package:yum_application/src/common/image_widget.dart';

class IngredientImage extends StatelessWidget {
  final bool isFreezed;
  final String path;
  final double width;
  const IngredientImage(
      {super.key,
      this.isFreezed = false,
      required this.path,
      this.width = 110});

  @override
  Widget build(BuildContext context) {
    return (isFreezed) ? _freezedIcon() : _icon();
  }

  Widget _freezedIcon() => Stack(
        alignment: Alignment.center,
        children: [
          ImageWidget(
            path: "assets/images/freezed.png",
            width: width + 20,
          ),
          _icon(),
        ],
      );

  Widget _icon() => ImageWidget(
        path: path,
        width: width,
      );
}
