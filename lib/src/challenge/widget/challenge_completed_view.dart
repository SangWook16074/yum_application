import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/challenge_list_view.dart';
import 'package:yum_application/src/challenge/widget/challenge_calendar.dart';
import 'package:yum_application/src/challenge/widget/challenge_carousel.dart';
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
    return const Column(
      children: [
        ChallengeCarousel(),
        ChallengeRanking(),
        ChallengeCalendar(),
      ],
    );
  }
}
