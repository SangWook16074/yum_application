import 'package:flutter/material.dart';

// Challenge Storage ( 보관함 )
// 보관함의 탭바뷰를 담당함.

import 'package:yum_application/src/ui/challenge/widget/challenge_calendar.dart';
import 'package:yum_application/src/ui/challenge/widget/challenge_card_scroll.dart';
import 'package:yum_application/src/ui/challenge/widget/challenge_ranking.dart';

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
        ChallengeCardScroll(), // Reward Card + Scroll.
        ChallengeRanking(), // 사용자 순위 부분.
        ChallengeCalendar(), // 잔디 심기 부분.
      ],
    );
  }
}
