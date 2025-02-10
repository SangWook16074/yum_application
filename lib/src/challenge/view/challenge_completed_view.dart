import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/view/challenge_list_view.dart';
import 'package:yum_application/src/challenge/widget/challenge_calendar.dart';
import 'package:yum_application/src/challenge/widget/challenge_ranking.dart';

class ChallengeCompletedView extends StatefulWidget {
  const ChallengeCompletedView({super.key});

  @override
  State<ChallengeCompletedView> createState() => _ChallengeCompletedViewState();
}

class _ChallengeCompletedViewState extends State<ChallengeCompletedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: Container(
          color: Theme.of(context).colorScheme.tertiary,
          child: CustomScrollView(
            slivers: [
              _header(),
              _mychallenge(),
              _challengeCompleted(),
            ],
          ),
        ));
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Builder(builder: (context) {
        return AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          elevation: 0.0,
          title: Text(
            "챌린지",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        );
      }),
    );
  }

  Widget _header() {
    return SliverAppBar(
      toolbarHeight: 140,
      floating: false,
      pinned: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Builder(
              builder: (context) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context).colorScheme.tertiary))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "나의 챌린지 달성 현황을 확인해보세요!",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: Image.asset(
                            "assets/images/trophy.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Builder(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChallengeListView()),
                        );
                      },
                      child: const Text("도전하기"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ChallengeListView(),
                          ),
                        );
                      },
                      child: const Text("보관함"),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

Widget _mychallenge() {
  PageController pageController =
      PageController(initialPage: 1000, viewportFraction: 0.7);
  List<String> images = [
    "assets/images/tomato_pasta.png",
    "assets/images/spicy_sausage_stew.png",
    "assets/images/salmon_salad.png",
    "assets/images/egg_fried_rice.png",
    "assets/images/handmade_hamburger.png",
  ];

  return SliverToBoxAdapter(
    child: StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "나의 챌린지 현황",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 200, // 컨테이너 크기

            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                int actualIndex = index % images.length; // 무한 루프처럼 보이게 만들기

                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double scale = 1.0;
                    if (pageController.hasClients) {
                      double page = pageController.page ?? 1000;
                      scale = (1 - (page - index).abs() * 0.3).clamp(0.8, 1.0);
                    } else {
                      scale = index == 1000 ? 1.0 : 0.8; // 초기 진입 시 중앙만 크게
                    }

                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 0),
                          width: 300 * scale, // 중앙일 때 커짐
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(images[actualIndex]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      );
    }),
  );
}

Widget _challengeCompleted() {
  return const SliverToBoxAdapter(
    child: Column(
      children: [
        ChallengeRanking(),
        ChallengeCalendar(),
      ],
    ),
  );
}
