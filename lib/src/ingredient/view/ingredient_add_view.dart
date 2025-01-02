import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/common/date_picker_widget.dart';
import 'package:yum_application/src/common/scroll_date_dialog.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/select_ingredient_image.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

class IngredientAddView extends StatelessWidget {
  const IngredientAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Provider.of<IngredientViewModelImpl>(context, listen: false)
                  .cancel();
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          );
        }),
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
                child: Consumer<IngredientViewModelImpl>(
                    builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () {
                      provider.cancel();
                    },
                    child: SelectIngredientImage(
                      ingredient: provider.selectedIngredient,
                      width: 300,
                    ),
                  );
                }),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _toggle(),
            _description(),
          ],
        ),
      ),
      bottomNavigationBar: _button(),
    );
  }

  /// 냉동 또는 냉장 여부를 토글하는 버튼 위젯
  Widget _toggle() => Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (context) {
              return Text(
                "냉동",
                style: Theme.of(context).textTheme.displayMedium,
              );
            }),
            Consumer<IngredientViewModelImpl>(
                builder: (context, provider, child) {
              return Switch.adaptive(
                value: provider.isFreezed,
                onChanged: provider.toggleIsFreezed,
                activeColor: Theme.of(context).colorScheme.secondary,
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
          child: Builder(builder: (context) {
            return Text(
              "재료 이름",
              style: Theme.of(context).textTheme.titleMedium,
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: 155,
            height: 44,
            child: Builder(builder: (context) {
              return TextField(
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
              );
            }),
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
                  child: Builder(builder: (context) {
                    return Text(
                      "구매 날짜",
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Consumer<IngredientViewModelImpl>(
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
                                      onStartAtComp: provider.updateStartAt,
                                      onEndAtComp: provider.updateEndAt,
                                    ));
                          },
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Builder(builder: (context) {
                          return Text(
                            "~",
                            style: Theme.of(context).textTheme.displayLarge,
                          );
                        }),
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
                  child: Builder(builder: (context) {
                    return Text(
                      "소비기한",
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Consumer<IngredientViewModelImpl>(
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
                                      onStartAtComp: provider.updateStartAt,
                                      onEndAtComp: provider.updateEndAt,
                                    ));
                          },
                        );
                      }),
                      Opacity(
                        opacity: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Builder(builder: (context) {
                            return Text(
                              "~",
                              style: Theme.of(context).textTheme.displayMedium,
                            );
                          }),
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

  Widget _button() => Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 40.0),
      child: Builder(builder: (context) {
        return SingleButton(
          text: "등록하기",
          onTap: () {
            Provider.of<IngredientViewModelImpl>(context, listen: false)
                .createNewIngredient();
          },
        );
      }));
}
