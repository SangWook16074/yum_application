import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/common/basic_bottom_sheet.dart';
import 'package:yum_application/src/common/ingredient_tile.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

class IngredientAddBottomSheet extends StatefulWidget {
  const IngredientAddBottomSheet({super.key});

  @override
  State<IngredientAddBottomSheet> createState() =>
      _IngredientAddBottomSheetState();
}

class _IngredientAddBottomSheetState extends State<IngredientAddBottomSheet> {
  final List<Ingredient> carbohydrate = [
    Ingredient(name: "밥", category: IngredientCategory.rice, isFreezed: false),
    Ingredient(name: "빵", category: IngredientCategory.bread, isFreezed: false),
    Ingredient(
        name: "면", category: IngredientCategory.noodle, isFreezed: false),
  ];

  final List<Ingredient> vegetable = [
    Ingredient(
        name: "양배추", category: IngredientCategory.cabbage, isFreezed: false),
    Ingredient(
        name: "양파", category: IngredientCategory.onion, isFreezed: false),
    Ingredient(
        name: "감자", category: IngredientCategory.potato, isFreezed: false),
    Ingredient(
        name: "토마토", category: IngredientCategory.tomato, isFreezed: false),
    Ingredient(
        name: "파", category: IngredientCategory.green_onion, isFreezed: false),
    Ingredient(
        name: "버섯", category: IngredientCategory.mushroom, isFreezed: false),
    Ingredient(
        name: "마늘", category: IngredientCategory.garlic, isFreezed: false),
    Ingredient(
        name: "고추", category: IngredientCategory.pepper, isFreezed: false),
    Ingredient(
        name: "포도", category: IngredientCategory.grape, isFreezed: false),
  ];

  final List<Ingredient> meatsAndEggs = [
    Ingredient(
        name: "소고기", category: IngredientCategory.beef, isFreezed: false),
    Ingredient(
        name: "돼지고기", category: IngredientCategory.fork, isFreezed: false),
    Ingredient(
        name: "닭고기",
        category: IngredientCategory.chicken_breast,
        isFreezed: false),
    Ingredient(
        name: "가공육",
        category: IngredientCategory.processed_meat,
        isFreezed: false),
    Ingredient(name: "계란", category: IngredientCategory.egg, isFreezed: false),
  ];

  final List<Ingredient> fishAndShrimp = [
    Ingredient(name: "생선", category: IngredientCategory.fish, isFreezed: false),
    Ingredient(
        name: "새우", category: IngredientCategory.shrimp, isFreezed: false),
  ];

  final List<Ingredient> processedFood = [
    Ingredient(
        name: "라면",
        category: IngredientCategory.instance_noodle,
        isFreezed: false),
    Ingredient(
        name: "김", category: IngredientCategory.seaweed, isFreezed: false),
    Ingredient(name: "두부", category: IngredientCategory.topu, isFreezed: false),
    Ingredient(
        name: "만두", category: IngredientCategory.dumpling, isFreezed: false),
    Ingredient(
        name: "참치캔",
        category: IngredientCategory.canned_tuna,
        isFreezed: false),
    Ingredient(
        name: "옥수수캔",
        category: IngredientCategory.canned_goods,
        isFreezed: false),
  ];

  final List<Ingredient> milkAndNuts = [
    Ingredient(name: "우유", category: IngredientCategory.milk, isFreezed: false),
    Ingredient(
        name: "치즈", category: IngredientCategory.cheese, isFreezed: false),
    Ingredient(
        name: "아이스크림",
        category: IngredientCategory.ice_cream,
        isFreezed: false),
    Ingredient(name: "견과류", category: IngredientCategory.nut, isFreezed: false),
  ];

  final List<Ingredient> drinks = [
    Ingredient(name: "소주", category: IngredientCategory.soju, isFreezed: false),
    Ingredient(name: "맥주", category: IngredientCategory.beer, isFreezed: false),
    Ingredient(
        name: "와인", category: IngredientCategory.drink, isFreezed: false),
  ];

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

  Widget _favorite() => _buildLabelAndImages("밥 빵 면", carbohydrate);

  Widget _fruitAndVetable() => _buildLabelAndImages("채소 및 과일", vegetable);

  Widget _meatsAndEggs() => _buildLabelAndImages("육류 및 계란", meatsAndEggs);

  Widget _fishAndShrimp() => _buildLabelAndImages("생선류", fishAndShrimp);

  Widget _processedFood() => _buildLabelAndImages("가공식품", processedFood);

  Widget _milkAndNuts() => _buildLabelAndImages("유제품 및 견과류", milkAndNuts);

  Widget _drinks() => _buildLabelAndImages("주류", drinks);

  Widget _buildLabelAndImages(String label, List<Ingredient> ingredients) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.displayLarge,
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
                          Provider.of<IngredientViewModelImpl>(context,
                                  listen: false)
                              .selectIngredient(i);
                          Navigator.of(context).pop();
                        },
                        child: IngredientTile(
                          ingredient: i,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      );
}
