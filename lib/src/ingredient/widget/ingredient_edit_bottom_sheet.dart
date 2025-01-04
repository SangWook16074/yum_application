import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/common/basic_bottom_sheet.dart';
import 'package:yum_application/src/common/delete_dialog.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/view/ingredient_edit_view.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_expiration_date_chart.dart';
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

  Widget _top() {
    final ingredient = widget.ingredient;
    final start = ingredient.startAt;
    final now = DateTime.now();
    final end = ingredient.endAt;
    final diff = (end.difference(now).inHours / 24).ceil();

    return Padding(
      key: const Key("Ingredient Edit Bottom Sheet Top"),
      padding: const EdgeInsets.only(top: 50),
      child: Column(children: [
        Text(
          "소비기한이 $diff일 남았어요!",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          "${start.year}년 ${start.month}월 ${start.day}일 ~ ${end.year}년 ${end.month}월 ${end.day}일",
          style: Theme.of(context).textTheme.labelSmall,
        )
      ]),
    );
  }

  Widget _middle() {
    final ratio = MediaQuery.of(context).devicePixelRatio;
    final line = 800 / ratio;
    return Padding(
      key: const Key("Ingredient Edit Bottom Sheet Middle"),
      padding: const EdgeInsets.only(top: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(line, line),
            painter: IngredientExprationDateChart(
                startAt: widget.ingredient.startAt,
                endAt: widget.ingredient.endAt),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IngredientImage(
                path: widget.ingredient.category.imagePath,
                width: 300,
                isFreezed: widget.ingredient.isFreezed,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23.3),
                child: Text(widget.ingredient.name,
                    style: Theme.of(context).textTheme.titleLarge),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _bottom() {
    final ratio = MediaQuery.of(context).devicePixelRatio;
    final height = 130 / ratio;
    final width = height * (10 / 3);
    return Padding(
      key: const Key("Ingredient Edit Bottom Sheet Bottom"),
      padding: const EdgeInsets.only(left: 20, right: 20),
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
                Provider.of<IngredientViewModelImpl>(context, listen: false)
                    .selectPrevIngredient(widget.ingredient);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => IngredientUpdateView(
                          currIngredient: widget.ingredient,
                        )));
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteDialog(
                      onConfirm: () {
                        Provider.of<IngredientViewModelImpl>(context,
                                listen: false)
                            .deleteIngredient(widget.ingredient);
                      },
                    ),
                  );
                },
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
