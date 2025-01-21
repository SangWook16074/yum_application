import 'package:flutter/material.dart';
import 'package:yum_application/src/common/image_widget.dart';
import 'package:yum_application/src/ingredient/widget/select_ingredient_image.dart';

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
    if (isFreezed) {
      return _freezedIcon();
    } else {
      return _icon();
    }
  }

  Widget _freezedIcon() => Stack(
        alignment: Alignment.center,
        children: [
          ImageWidget(
            path: IceImage.background,
            width: width + 30,
          ),
          _icon(),
          Opacity(
            opacity: 0.6,
            child: ImageWidget(
              path: IceImage.foreground,
              width: width + 30,
            ),
          )
        ],
      );

  Widget _icon() => ImageWidget(
        path: path,
        width: width,
      );
}
