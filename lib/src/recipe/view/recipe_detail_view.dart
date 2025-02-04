import 'package:flutter/material.dart';

class RecipeDetailView extends StatefulWidget {
  const RecipeDetailView({super.key});

  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            slivers: [
              _appbar(),
              _recipeInformation(),
              _firstStep(),
              _secondStep(),
              _secondStep(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _appbar() => SliverAppBar.large(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      pinned: true,
      elevation: 0.0,
      title: Text(
        "딱맞는 레시피",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      expandedHeight: 400,
      collapsedHeight: AppBar().toolbarHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30.0))),
            ),
            Positioned(
              bottom: 1,
              left: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Text(
                          "토마토 스프",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Text(
                        "25 분",
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 10, bottom: 20, top: 20),
                        child: Text(
                          "리뷰(0,000)",
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "전체보기",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 12)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ));

  Widget _recipeInformation() => SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                children: [
                  Image.asset(
                    _isExpanded
                        ? 'assets/images/arrow_down.png'
                        : 'assets/images/arrow_up.png',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "레시피 정보 한눈에 보기",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded) ...[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Text(
                              "재료",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Text(
                            "1.5 인분 기준",
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            "토마토 3 개 ",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "양파 1/2 개 ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Text(
                            "버섯 1 개 ",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              "소금 한 꼬집",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Text(
                            "간장 1 스푼",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]
        ]),
      );

  Widget _firstStep() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "요리 방법",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Step 1",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: 270,
                                height: 170,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  width: 270,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "오늘은 생토마토가 없어서 홀토마토를 사용했어요.^^ 요거 한 통 다 들어갔네요. 전체 스프의 양은 8인분 정도??",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _secondStep() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Step 2",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "호주산 국거리감인데 400그램이네요. 여기에 밀가루 넣고 뒤적뒤적... 요 방법은 원래는 스튜 만들 때 사용하기도 하지만... 스프가 넘 맑은 게 싫을 경우 살짝 걸쭉한 게 좋다면 요렇게 시작하시면 좋아요. 그리고 저는 스프의 감자를 별로 좋아하지않아서 넣지 않거든요. 그래서 밀가루옷을 입혀 준답니다. 살짝 걸쭉하라고요. 감자를 많이 넣는",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
