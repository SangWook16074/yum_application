import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';
import 'package:yum_application/src/data/ingredient/entity/refreginator_ingredient.dart';

class SelectIngredientImage extends StatefulWidget {
  final RefreginatorIngredient? ingredient;
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
    // 얼음 에니메이션 컨트롤러
    _backgroundAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _foregroundAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    // 얼음 애니메이션
    _backgroundAnimation = CurvedAnimation(
        parent: _backgroundAnimationController,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.fastOutSlowIn);
    _foregroundAnimation = CurvedAnimation(
        parent: _foregroundAnimationController, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectIngredientImage oldWidget) {
    /// 이전 위젯과 다른 재료를 선택한 경우에는 애니메이션이 발생하지 않음.
    if (widget.ingredient == oldWidget.ingredient) {
      return;
    }

    /// isFreezed의 옵셔널 체이닝을 통해서 null 방지 -> false 부여
    final isFreezed = widget.ingredient?.isFreezed ?? false;
    if (isFreezed) {
      _backgroundAnimationController.forward().then((_) {
        _foregroundAnimationController.forward();
      });
    } else {
      _foregroundAnimationController.reverse().then((_) {
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
    return Stack(
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
    );
  }

  Widget _icon() => ImageWidget(
        path: widget.ingredient!.category.imagePath,
        width: widget.width,
      );
}

/// [IceImage]는 [SelectIngredientImage]에서 사용되는
/// 얼음 백그라운드와 포어그라운드 이미지 path의 String getter 확장입니다.
extension IceImage on ImagePath {
  static String get background => "assets/images/ice_background.png";
  static String get foreground => "assets/images/ice_foreground.png";
}
