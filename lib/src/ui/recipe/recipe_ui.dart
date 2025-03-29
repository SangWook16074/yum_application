import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yum_application/src/data/recipe/model/recipe.dart';
import 'package:yum_application/src/ui/recipe/model/recipe_view_event.dart';
import 'package:yum_application/src/ui/recipe/view/recipe_view.dart';
import 'package:yum_application/src/ui/recipe/viewModel/recipe_view_model.dart';

import 'package:yum_application/src/ui/recipe/view/recipe_detail_view.dart';
import 'package:yum_application/src/ui/recipe/widget/ingrdient_keyword.dart';

class RecipeUI extends StatefulWidget {
  const RecipeUI({super.key});

  @override
  State<RecipeUI> createState() => _RecipeUIState();
}

class _RecipeUIState extends State<RecipeUI> {
  List<String> ingredients = ["남은 음식", "양파", "버섯"];

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RecipeViewModel>();
    return Scaffold(
      appBar: _appBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          var matrics = notification.metrics;
          if (matrics.axisDirection != AxisDirection.down) {
            return false;
          }
          if (matrics.extentAfter <= 0) {
            final event = GetNextPages(page: ++_page);
            viewModel.onEvent(event);
            setState(() {});
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _button(),
              _menu(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() => PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height + 182),
        child: Builder(builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: AppBar(
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
              leading: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              elevation: 0,
              title: Text(
                "레시피 찾기",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(172),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 22.0),
                  child: Column(
                    children: [
                      _search(),
                      _keyword(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );

  Widget _search() => Builder(builder: (context) {
        return Container(
          width: 390,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: const Color(0xffF3F3F3)),
          child: TextField(
              decoration: InputDecoration(
            hintText: "검색어를 입력해 주세요.",
            contentPadding: const EdgeInsetsDirectional.symmetric(
                vertical: 10, horizontal: 10),
            hintStyle: Theme.of(context).textTheme.labelMedium,
            border: InputBorder.none,
            suffixIcon:
                const Icon(Icons.search, size: 24, color: Color(0xff2A2A2A)),
          )),
        );
      });

  Widget _keyword() => Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 10),
            ),
            Text(
              "기한 임박! 먹어서 구해 주세요!!",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                _customContainer("남은 음식"),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: _customContainer("버섯"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: _customContainer("양파"),
                ),
                _plus(),
              ],
            ),
          ],
        );
      });

  Widget _customContainer(String text) => Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Builder(builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                border: Border.all(color: const Color(0xff362703))),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       ingredients.remove(text);
                //     });
                //   },
                // ),
                const Icon(Icons.close),
              ],
            ),
          );
        }),
      );

  Widget _plus() => Padding(
        padding: const EdgeInsets.only(left: 50.0, top: 7),
        child: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.add_circle,
            size: 40,
          ),
        ),
      );

  Widget _button() => Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 22),
              child: Container(
                width: 75,
                height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff362703)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "추천순",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      });

  Widget _menu() => RecipeView();

  Widget _ingredientKeyword(String text) => IngredientKeyword(text: text);
}
