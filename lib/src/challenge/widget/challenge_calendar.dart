import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/stack_container.dart';

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
          _todayList(),
        ],
      ),
    );
  }
}

Widget _todayList() {
  return Builder(
    builder: (context) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 20),
              child: Text(
                "2월 7일 금요일",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 40, bottom: 20),
              child: Stack(
                children: [
                  Container(
                    width: 30,
                    height: 180,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).colorScheme.onPrimaryContainer,
                              Theme.of(context).colorScheme.secondary,
                            ]),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Column(
                    children: [
                      StackContainer(
                        title: "레시피 등록",
                        color: Theme.of(context).colorScheme.secondary,
                        opacity: 0.23,
                      ),
                      StackContainer(
                        title: "레시피 리뷰 작성",
                        color: Theme.of(context).colorScheme.secondary,
                        opacity: 0.51,
                      ),
                      StackContainer(
                        title: "레시피 리뷰 작성",
                        color: Theme.of(context).colorScheme.secondary,
                        opacity: 0.96,
                      ),
                      StackContainer(
                        title: "오늘자 출석 체크!",
                        color: Theme.of(context).colorScheme.secondary,
                        opacity: 1,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
