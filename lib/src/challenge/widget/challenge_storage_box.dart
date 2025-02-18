import 'package:flutter/material.dart';

import 'package:yum_application/src/challenge/widget/challenge_calendar.dart';
import 'package:yum_application/src/challenge/widget/challenge_card_scroll.dart';
import 'package:yum_application/src/challenge/widget/challenge_ranking.dart';

class ChallengeStorageBox extends StatefulWidget {
  const ChallengeStorageBox({super.key});

  @override
  State<ChallengeStorageBox> createState() => _ChallengeStorageBoxState();
}

class _ChallengeStorageBoxState extends State<ChallengeStorageBox> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChallengeCardScroll(),
        ChallengeRanking(),
        ChallengeCalendar(),
      ],
    );
  }
}
