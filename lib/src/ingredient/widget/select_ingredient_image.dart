import 'package:flutter/material.dart';
import 'package:yum_application/src/common/image_widget.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_add_bottom_sheet.dart';

class SelectIngredientImage extends StatefulWidget {
  final Ingredient? ingredient;
  final double width;
  const SelectIngredientImage(
      {super.key, this.width = 110, required this.ingredient});

  @override
  State<SelectIngredientImage> createState() => _SelectIngredientImageState();
}

class _SelectIngredientImageState extends State<SelectIngredientImage>
    with TickerProviderStateMixin {
  late AnimationController _backgroundAnimationController;
  late final AnimationController _foregroundAnimationController;
  late final Animation<double> _backgroundAnimation;
  late final Animation<double> _foregroundAnimation;

  @override
  void initState() {
    _backgroundAnimationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _foregroundAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _backgroundAnimation = CurvedAnimation(
        parent: _backgroundAnimationController,
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn);
    _foregroundAnimation = CurvedAnimation(
        parent: _foregroundAnimationController, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectIngredientImage oldWidget) {
    if ((widget.ingredient == null && oldWidget.ingredient == null) ||
        (widget.ingredient == null && oldWidget.ingredient != null)) {
      return;
    }
    if (widget.ingredient!.isFreezed) {
      _backgroundAnimationController.duration =
          const Duration(milliseconds: 700);
      _backgroundAnimationController.forward().then((_) {
        _foregroundAnimationController.forward();
      });
    } else {
      _foregroundAnimationController.reverse().then((_) {
        _backgroundAnimationController.duration =
            const Duration(milliseconds: 200);
        _backgroundAnimationController.reverse();
      });
    }
    super.didUpdateWidget(widget);
  }

  @override
  void dispose() {
    _foregroundAnimationController.dispose();
    _backgroundAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.ingredient != null)
        ? Stack(
            alignment: Alignment.center,
            children: [
              ScaleTransition(
                scale: _backgroundAnimation,
                child: ImageWidget(
                  path: IceImage.background,
                  width: widget.width + 200,
                ),
              ),
              _icon(),
              FadeTransition(
                opacity: _foregroundAnimation,
                child: Opacity(
                  opacity: 0.5,
                  child: ImageWidget(
                    path: IceImage.background,
                    width: widget.width + 200,
                  ),
                ),
              ),
            ],
          )
        : GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32.0))),
                  context: context,
                  builder: (context) => const IngredientAddBottomSheet());
            },
            child:
                Text("+ 아이콘", style: Theme.of(context).textTheme.titleLarge));
  }

  Widget _icon() => ImageWidget(
        path: widget.ingredient!.category.imagePath,
        width: widget.width,
      );
}

final class IceImage {
  static String get background => "assets/images/ice_background.png";
  static String get foreground => "assets/images/ice_foreground.png";
}
