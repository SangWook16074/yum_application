import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';
import 'package:yum_application/src/data/ingredient/entity/refreginator_ingredient.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/widget/ingredient_add_bottom_sheet.dart';

/// 사용자가 재료 생성과정에서 선택한 재료를 보여주는 뷰
///
/// 선택된 재료의 유무에 따라서 각기 다른 화면을 렌더링함.
/// 또한, 선택된 재료의 냉동 냉장 토글링 애니메이션을 수행함.
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

  /// 선택된 재료 탭 함수
  ///
  /// 사용자는 선택된 재료에 따라서 각각 다른 액션을 실행할 수 있습니다.
  void onTap() {
    final viewModel = context.read<RefreginatorIngredientViewModel>();

    /// 선택된 재료가 있는 경우
    if (viewModel.selectedIngredient != null) {
      // 선택된 재료 초기화
      viewModel.resetSelectIngredient();

      /// 선택된 재료가 없는 경우
    } else {
      // 재료 선택 바텀시트 UP
      showIngredientAddBottomSheet();
    }
  }

  /// 사용자 기본 재료 선택 바텀 시트 함수
  void showIngredientAddBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.0))),
        context: context,
        builder: (context) => const IngredientAddBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: (widget.ingredient != null)
            // 선택된 재료가 있는 경우
            ? _buildSelectItem()
            // 선택된 재료가 없는 경우
            : _buildNoSelectItem());
  }

  /// 선택된 재료가 있는 경우 선택 재료를 렌더링
  ///
  /// 냉동 냉장 여부에 따라서 얼음 이미지가 토글링 애니메이션을 수행합니다.
  Widget _buildSelectItem() => Stack(
        alignment: Alignment.center,
        children: [
          ScaleTransition(
            scale: _backgroundAnimation,
            child: ImageWidget(
              path: IceImage.background,
              width: widget.width + 200,
            ),
          ),
          ImageWidget(
            path: widget.ingredient!.category.imagePath,
            width: widget.width,
          ),
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

  /// 선택된 재료가 없는 경우에는
  /// 재료를 선택할 수 있는 Text를 보여줍니다.
  Widget _buildNoSelectItem() =>
      Text("+ 아이콘", style: Theme.of(context).textTheme.titleLarge);
}

/// [IceImage]는 [SelectIngredientImage]에서 사용되는
/// 얼음 백그라운드와 포어그라운드 이미지 path의 String getter 확장입니다.
extension IceImage on ImagePath {
  static String get background => "assets/images/ice_background.png";
  static String get foreground => "assets/images/ice_foreground.png";
}
