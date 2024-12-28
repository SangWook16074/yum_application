import 'package:flutter/material.dart';
import 'package:yum_application/src/common/image_widget.dart';

class SelectIngredientImage extends StatefulWidget {
  final bool isFreezed;
  final String path;
  final double width;
  const SelectIngredientImage(
      {super.key,
      this.isFreezed = false,
      required this.path,
      this.width = 110});

  @override
  State<SelectIngredientImage> createState() => _SelectIngredientImageState();
}

class _SelectIngredientImageState extends State<SelectIngredientImage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _backgroundAnimation;

  @override
  void didChangeDependencies() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _backgroundAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);
    if (widget.isFreezed) {
      _animationController.forward();
    }
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SelectIngredientImage oldWidget) {
    if (widget.isFreezed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    super.didUpdateWidget(widget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ScaleTransition(
          scale: _backgroundAnimation,
          child: ImageWidget(
            path: "assets/images/freezed_background.png",
            width: widget.width + 70,
          ),
        ),
        _icon(),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: (widget.isFreezed) ? 0.6 : 0.0,
          child: ScaleTransition(
            scale: _backgroundAnimation,
            child: ImageWidget(
              path: "assets/images/freezed_foreground.png",
              width: widget.width + 70,
            ),
          ),
        ),
      ],
    );
  }

  Widget _icon() => ImageWidget(
        path: widget.path,
        width: widget.width,
      );
}
