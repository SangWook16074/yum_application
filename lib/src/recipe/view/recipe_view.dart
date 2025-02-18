import 'package:flutter/material.dart';
import 'package:yum_application/main.dart';
import 'package:yum_application/src/recipe/view/recipe_%20register_view.dart';
import 'package:yum_application/src/recipe/view/recipe_detail_view.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  List<String> ingredients = ["남은 음식", "양파", "버섯"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      // floatingActionButton: _floating(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _button(),
            _menu(),
          ],
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
            contentPadding:
                EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 10),
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
              "사망 직전! 먹어서 구해 주세요!!",
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
                Icon(Icons.close),
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

  Widget _menu() => Builder(builder: (context) {
        return Column(
          children: List.generate(30, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecipeDetailView()));
                },
                child: Container(
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          width: 154,
                          height: 150,
                          decoration: BoxDecoration(
                              color: const Color((0xFFEEEEEE)),
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                "토마토 스프",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                "깨끗이 씻은 토마토는 4~6 등분으로...",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: _ingredientKeyword("토마토"),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: _ingredientKeyword("양파"),
                                ),
                                _ingredientKeyword("버섯"),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: _ingredientKeyword("토마토"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: _ingredientKeyword("토마토"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      });

  Widget _floating() => Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RecipeRegisterView()));
          },
          backgroundColor: const Color(0xffFFB300),
          child: Image.asset(
            'assets/images/floating.png',
            width: 33,
            height: 28,
          ),
        );
      });

  Widget _ingredientKeyword(String text) => Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Builder(builder: (context) {
          return Container(
            height: 26,
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(15, 58, 57, 57)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }),
      );
}
