import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/stack_container.dart';

// Challenge Storage ( 보관함 )
// Challenge Calendar 밑에 Check List 예시를 보여줌.

class ChallengeCheckList extends StatelessWidget {
  const ChallengeCheckList({super.key});

  @override
  Widget build(BuildContext context) {
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
            // 세로로 컨테이너를 겹처야 하기 때문에 Stack으로 생성.
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
                    // 각각 다른 Opacity 값을 갖게 해서 순서대로 배치.
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
  }
}
