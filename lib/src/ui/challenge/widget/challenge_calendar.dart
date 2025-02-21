import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yum_application/src/ui/challenge/widget/challenge_check_list.dart';

// Challenge Storage ( 보관함 )
// Git의 잔디 심기처럼 이 앱을 사용했던 기록을 기반해 점점 진해지는 컨테이너를 달력 형식으로 보여줌.

class ChallengeCalendar extends StatelessWidget {
  const ChallengeCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    int startWeekday = DateTime(now.year, now.month, 1).weekday % 7;
    String currentMonth = DateFormat('yyyy년 M월').format(now);

    List<bool> dayCompletion =
        List.generate(daysInMonth, (index) => index % 2 == 0);

// Figma에 생성된 컨테이너 투명도
    List<double> opacities = [
      0.23,
      0.51,
      0.96,
      1.0,
      0.75,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                "오늘의 챌린지",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          // 오늘의 챌린지 컨테이너 생성.
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    currentMonth,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 7 + daysInMonth + startWeekday,
                  itemBuilder: (context, index) {
                    if (index < 7) {
                      List<String> weekdays = [
                        "일",
                        "월",
                        "화",
                        "수",
                        "목",
                        "금",
                        "토"
                      ];
                      // 요일을 크기에 맞춰 배치해줌.
                      return Center(
                        child: Text(
                          weekdays[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    } else {
                      int dayIndex = index - 7 - startWeekday;
                      if (dayIndex < 0 || dayIndex >= daysInMonth) {
                        return const SizedBox();
                      }
                      // 컨테이너의 개수.
                      int day = dayIndex + 1;
                      bool isToday = (day == now.day);

                      double opacity = opacities[dayIndex % opacities.length];

                      return Container(
                        decoration: BoxDecoration(
                          color: isToday
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : dayCompletion[dayIndex]
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(opacity)
                                  : Theme.of(context).colorScheme.scrim,
                          borderRadius: BorderRadius.circular(5),
                          // 현재 날짜를 표시해주는 컨테이너는 배경이 흰색, 테두리 적용, 현재 날짜 보여주기.
                          border: isToday
                              ? Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 2,
                                )
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: isToday
                            ? Text("$day",
                                style: Theme.of(context).textTheme.bodyMedium)
                            : null,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: ChallengeCheckList(), // 잔디 밑 예시 부분.
          ),
        ],
      ),
    );
  }
}
