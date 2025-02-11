import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/view/challenge_list_view.dart';
import 'package:yum_application/src/challenge/widget/challenge_calendar.dart';
import 'package:yum_application/src/challenge/widget/challenge_ranking.dart';
import 'package:yum_application/src/challenge/widget/challenge_reward_card.dart';

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

Widget _challengeCompleted() {
  return const SliverToBoxAdapter(
    child: Column(
      children: [
        ChallengeRewardCard(),
        ChallengeRanking(),
        ChallengeCalendar(),
      ],
    ),
  );
}
