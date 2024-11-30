import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/common/date_picker_widget.dart';
import 'package:yum_application/src/common/scroll_date_dialog.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_add_bottom_sheet.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_image.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

class IngredientAddView extends StatefulWidget {
  const IngredientAddView({super.key});

  @override
  State<IngredientAddView> createState() => _IngredientAddViewState();
}

class _IngredientAddViewState extends State<IngredientAddView> {
  late final IngredientViewModel _ingredientViewModel;

  @override
  void initState() {
    _ingredientViewModel =
        Provider.of<IngredientViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        title: Text(
          "새로운 식재료",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(250),
            child: SizedBox(
              height: 250,
              child: Center(
                child: Consumer<IngredientViewModel>(
                    builder: (context, provider, child) {
                  return (provider.selectedIngredient == null)
                      ? GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.red,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(32.0))),
                                context: context,
                                builder: (context) =>
                                    const IngredientAddBottomSheet());
                          },
                          child: Text("+ 아이콘",
                              style: Theme.of(context).textTheme.bodyLarge))
                      : GestureDetector(
                          onTap: () {
                            Provider.of<IngredientViewModel>(context,
                                    listen: false)
                                .cancel();
                          },
                          child: IngredientImage(
                              width: 300,
                              isFreezed: provider.selectedIngredient!.isFreezed,
                              path: provider
                                  .selectedIngredient!.category.imagePath),
                        );
                }),
              ),
            )),
      ),
      body: Column(
        children: [
          _toggle(),
          _description(),
          const Spacer(),
          _button(),
        ],
      ),
    );
  }

  Widget _toggle() => Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "냉동",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Consumer<IngredientViewModel>(builder: (context, provider, child) {
              return Switch.adaptive(
                value: provider.isFreezed,
                onChanged: provider.toggleIsFreezed,
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveThumbColor: Colors.grey,
              );
            })
          ],
        ),
      );

  Widget _description() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            "재료 이름",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: 155,
            height: 44,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                  child: Text(
                    "구매 날짜",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Consumer<IngredientViewModel>(
                          builder: (context, provider, child) {
                        return DatePickerWidget(
                          time: provider.selectedIngredient?.startAt,
                          onTap: () {
                            showModalBottomSheet(
                                isDismissible: false,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(32.0))),
                                context: context,
                                builder: (context) => ScrollDateDialog(
                                      onStartAtComp:
                                          _ingredientViewModel.updateStartAt,
                                      onEndAtComp:
                                          _ingredientViewModel.updateEndAt,
                                    ));
                          },
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "~",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "소비기한",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Consumer<IngredientViewModel>(
                          builder: (context, provider, child) {
                        return DatePickerWidget(
                          time: provider.selectedIngredient?.endAt,
                          onTap: () {
                            showModalBottomSheet(
                                isDismissible: false,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(32.0))),
                                context: context,
                                builder: (context) => ScrollDateDialog(
                                      initialStatus: false,
                                      onStartAtComp:
                                          _ingredientViewModel.updateStartAt,
                                      onEndAtComp:
                                          _ingredientViewModel.updateEndAt,
                                    ));
                          },
                        );
                      }),
                      Opacity(
                        opacity: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            "~",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ]);

  Widget _button() => const Padding(
      padding: EdgeInsets.only(top: 24.0, bottom: 40.0),
      child: SingleButton(text: "등록하기"));
}
