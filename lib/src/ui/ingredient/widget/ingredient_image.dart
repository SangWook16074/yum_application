import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';
import 'package:yum_application/src/ui/ingredient/view/select_ingredient_image.dart';

class IngredientImage extends StatelessWidget {
  final bool isFreezed;
  final String path;
  final bool isWarning;
  final double width;
  final double space;
  const IngredientImage(
      {super.key,
      this.isFreezed = false,
      required this.path,
      this.width = 110,
      this.space = 30,
      required this.isWarning});

  factory IngredientImage.select({
    required bool isFreezed,
    required String path,
    required bool isWarning,
    required double width,
  }) {
    return IngredientImage(
      isFreezed: isFreezed,
      path: path,
      isWarning: isWarning,
      width: width,
      space: 150,
    );
  }

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
            width: width + space,
          ),
          _icon(),
          Opacity(
            opacity: 0.6,
            child: ImageWidget(
              path: IceImage.foreground,
              width: width + space,
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
