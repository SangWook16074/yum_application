import 'package:flutter/material.dart';
import 'package:yum_application/src/common/image_widget.dart';
import 'package:yum_application/src/ingredient/widget/select_ingredient_image.dart';

class IngredientImage extends StatelessWidget {
  final bool isFreezed;
  final String path;
  final bool isWarning;
  final double width;
  const IngredientImage(
      {super.key,
      this.isFreezed = false,
      required this.path,
      this.width = 110,
      required this.isWarning});

  @override
  Widget build(BuildContext context) {
    return _renderIcon();
  }

  Widget _renderIcon() => Stack(
        alignment: Alignment.topRight,
        children: [
          (isFreezed) ? _freezedIcon() : _icon(),
          if (isWarning) _warning(),
        ],
      );

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

  Widget _warning() => const Icon(
        Icons.error,
        color: Color(0xffff3700),
        size: 20,
      );
}
