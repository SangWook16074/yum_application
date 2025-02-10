import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/challenge_check_list.dart';

class ChallengeCalendar extends StatelessWidget {
  const ChallengeCalendar({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const ChallengeCheckList(),
        ],
      ),
    );
  }
}
