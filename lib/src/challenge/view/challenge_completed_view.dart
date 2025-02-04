import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/view/challenge_case_view.dart';

class ChallengeCompletedView extends StatelessWidget {
  const ChallengeCompletedView({super.key});

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
              _body1(),
              _body2(),
              _body3(),
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
            "챌린지 도전",
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
      // expandedHeight: 300,
      title: Column(
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
                    onPressed: () {},
                    child: const Text("도전하기"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChallengeCaseView(),
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
    );
  }
}

Widget _body1() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 10),
                  child: Text(
                    "나의 챌린지 현황",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

Widget _body2() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Builder(builder: (context) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: Text(
                  "강은주123 님의 순위는?",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: 110,
                    height: 141,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: 110,
                    height: 141,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 141,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 141,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        );
      }),
    ),
  );
}

Widget _body3() {
  return SliverToBoxAdapter(
    child: Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "오늘의 챌린지",
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 450,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      );
    }),
  );
}
