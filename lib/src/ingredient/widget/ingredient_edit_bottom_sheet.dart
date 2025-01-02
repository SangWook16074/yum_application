import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/common/basic_bottom_sheet.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/view/ingredient_edit_view.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_image.dart';

class IngredientEditBottomSheet extends StatefulWidget {
  final Ingredient ingredient;
  const IngredientEditBottomSheet({super.key, required this.ingredient});

  @override
  State<IngredientEditBottomSheet> createState() =>
      _IngredientEditBottomSheetState();
}

class _IngredientEditBottomSheetState extends State<IngredientEditBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
        height: 800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _top(),
            _middle(),
            const Spacer(),
            _bottom(),
          ],
        ));
  }

  Widget _top() => Padding(
        padding: const EdgeInsets.only(top: 68),
        child: Column(children: [
          Text(
            "소비기한이 46 일 남았어요!",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            "2024년 10월 12일 ~ 2024년 12월 25일",
            style: Theme.of(context).textTheme.labelSmall,
          )
        ]),
      );

  Widget _middle() => Padding(
        padding: const EdgeInsets.only(top: 33.0),
        child: Column(children: [
          IngredientImage(
            isFreezed: widget.ingredient.isFreezed,
            path: widget.ingredient.category.imagePath,
            width: 350,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(widget.ingredient.name,
              style: Theme.of(context).textTheme.titleLarge)
        ]),
      );

  Widget _bottom() {
    final ratio = MediaQuery.of(context).devicePixelRatio;
    final height = 130 / ratio;
    final width = height * (10 / 3);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SafeArea(
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                fixedSize: Size(width, height),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const IngredientUpdateView()));
              },
              child: Text(
                "수정하기",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  fixedSize: Size(width, height),
                ),
                onPressed: () =>
                    Provider.of<IngredientViewModelImpl>(context, listen: false)
                        .deleteIngredient(widget.ingredient),
                child: Text(
                  "삭제하기",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
