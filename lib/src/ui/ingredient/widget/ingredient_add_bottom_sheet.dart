import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/common/widgets/basic_bottom_sheet.dart';
import 'package:yum_application/src/ui/ingredient/model/basic_ingredient.dart';
import 'package:yum_application/src/ui/ingredient/view/ingredient_grid_view.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/basic_ingredient_view_model.dart';

class IngredientAddBottomSheet extends StatelessWidget {
  const IngredientAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
      height: 634,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32.0)),
        child: SingleChildScrollView(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 70, bottom: 138, right: 22, left: 22),
          child: Column(
            children: [
              _favorite(),
              _carbohydrate(),
              _fruitAndVetable(),
              _meatsAndEggs(),
              _fishAndShrimp(),
              _processedFood(),
              _milkAndNuts(),
              _drinks(),
            ],
          ),
        )),
      ),
    );
  }

  /// 사용자의 즐겨찾기 재료 데이터 렌더링 뷰
  Widget _favorite() {
    return Builder(builder: (context) {
      final ingredients = context.watch<BasicIngredientViewModel>().favorites;
      return IngredientGridView(ingredients: ingredients, label: "즐겨찾기");
    });
  }

  /// 사용자가 선택가능한 모든 기본 재료를 카테고리별 및 label로 렌더링을 담당하는 뷰
  Widget _buildLabelAndImages(String label, IngredientType type) {
    return Builder(builder: (context) {
      final ingredients =
          context.watch<BasicIngredientViewModel>().getBasicIngredientBy(type);
      return (ingredients.isNotEmpty)
          ? IngredientGridView(ingredients: ingredients, label: label)
          : Container();
    });
  }

  /// 사용자의 선택 가능한 재료를 카테고리별로 렌더링 하는 메소드 모음
  Widget _carbohydrate() =>
      _buildLabelAndImages("밥 빵 면", IngredientType.carbohydrate);

  Widget _fruitAndVetable() =>
      _buildLabelAndImages("채소 및 과일", IngredientType.vegetable);

  Widget _meatsAndEggs() =>
      _buildLabelAndImages("육류 및 계란", IngredientType.meatsAndEggs);

  Widget _fishAndShrimp() =>
      _buildLabelAndImages("생선류", IngredientType.fishAndShrimp);

  Widget _processedFood() =>
      _buildLabelAndImages("가공식품", IngredientType.processedFood);

  Widget _milkAndNuts() =>
      _buildLabelAndImages("유제품 및 견과류", IngredientType.milkAndNuts);

  Widget _drinks() => _buildLabelAndImages("주류", IngredientType.drink);
}
