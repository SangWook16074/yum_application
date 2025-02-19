import 'package:flutter/material.dart';

// Challenge Storage ( 보관함 )
// 보관함의 탭바뷰를 담당함.

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
    return Column(
      children: [
        _myChallenges(),
        _myRanking(),
        _todayChallenges(),
      ],
    );
  }

  Widget _myChallenges() =>
      const ChallengeCardScroll(); // Reward Card + Scroll.

  Widget _myRanking() => const ChallengeRanking(); // 사용자 순위 부분.

  Widget _todayChallenges() => const ChallengeCalendar(); // 잔디 심기 부분.
}
