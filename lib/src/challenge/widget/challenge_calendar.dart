import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yum_application/src/challenge/widget/challenge_check_list.dart';

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
                Text(
                  currentMonth,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
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
            child: ChallengeCheckList(),
          ),
        ],
      ),
    );
  }
}
