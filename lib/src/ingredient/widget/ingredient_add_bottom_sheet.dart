import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/common/widgets/basic_bottom_sheet.dart';
import 'package:yum_application/src/common/widgets/ingredient_tile.dart';
import 'package:yum_application/src/data/ingredient/model/initial_ingredient.dart';

import 'package:yum_application/src/ingredient/viewModel/initial_ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

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

  Widget _favorite() => _buildLabelAndImages("즐겨찾기", IngredientType.favorite);

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

  Widget _buildLabelAndImages(String label, IngredientType type) {
    return Builder(builder: (context) {
      final ingredientViewModel =
          Provider.of<RefreginatorIngredientViewModel>(context, listen: false);
      final allIngredient =
          context.read<InitialIngredientViewModel>().allInitialIngredients;
      final ingredients = allIngredient
          .where((initailIngredient) => initailIngredient.type == type)
          .toList();
      return (ingredients.isNotEmpty)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    children: ingredients
                        .map((i) => GestureDetector(
                              onTap: () {
                                ingredientViewModel.selectIngredient(i);
                                Navigator.of(context).pop();
                              },
                              child: Consumer<InitialIngredientViewModel>(
                                  builder: (context, provider, child) {
                                return IngredientTile(
                                  ingredient: i,
                                  onTap: () =>
                                      provider.toggleIsFavorite(i.category),
                                );
                              }),
                            ))
                        .toList(),
                  ),
                ),
              ],
            )
          : Container();
    });
  }
}
