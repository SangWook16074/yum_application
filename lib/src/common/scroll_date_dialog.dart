import 'package:flutter/material.dart';
import 'package:yum_application/src/common/basic_bottom_sheet.dart';

class ScrollDateDialog extends StatefulWidget {
  final ValueSetter<DateTime> onStartAtComp;
  final ValueSetter<DateTime> onEndAtComp;
  final bool initialStatus;
  const ScrollDateDialog({
    super.key,
    required this.onStartAtComp,
    required this.onEndAtComp,
    this.initialStatus = true,
  });

  @override
  State<ScrollDateDialog> createState() => _ScrollDateDialogState();
}

class _ScrollDateDialogState extends State<ScrollDateDialog> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  int selectedDay = DateTime.now().day;
  int selectedYearIndex = DateTime.now().year - 2000;
  int selectedMonthIndex = DateTime.now().month - 1;
  int selectedDayIndex = DateTime.now().day - 1;
  int daysInMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;

  late bool selectedButton;
  late DateTime startAt;
  late DateTime endAt;

  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  void updateDaysInMonth() {
    setState(() {
      daysInMonth = getDaysInMonth(selectedYear, selectedMonth);
      if (selectedDay > daysInMonth) {
        selectedDay = daysInMonth;
        selectedDayIndex = selectedDay - 1;
      }
    });
  }

  void updateDate() {
    DateTime selectedDate = DateTime(selectedYear, selectedMonth, selectedDay);

    if (selectedButton) {
      startAt = selectedDate;
      widget.onStartAtComp(startAt);
    } else {
      endAt = selectedDate;
      widget.onEndAtComp(endAt);
    }
  }

  bool isButtonDisabled() {
    return endAt
        .isBefore(startAt); // Disable if expiration is earlier than purchase
  }

  @override
  void initState() {
    selectedButton = widget.initialStatus;
    super.initState();
    startAt = DateTime(selectedYear, selectedMonth, selectedDay);
    endAt = DateTime(selectedYear, selectedMonth, selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
      height: 400,
      child: Column(
        children: [
          _header(),
          _body(),
          _bottom(),
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedButton
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onPrimaryContainer,
              minimumSize: const Size(80, 26),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedButton = true;
              });
              updateDate();
            },
            child: Text(
              "구매날짜",
              style: selectedButton
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(0xffA2A2A2),
                      ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, top: 20, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: !selectedButton
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onPrimaryContainer,
              minimumSize: const Size(80, 26),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedButton = false;
              });
              updateDate();
            },
            child: Text(
              "소비기한",
              style: !selectedButton
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(0xffA2A2A2),
                      ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Expanded(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 42.0,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          Row(
            children: [
              _yearDate(),
              _monthDate(),
              _dayDate(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _yearDate() {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: ListWheelScrollView(
          physics: const FixedExtentScrollPhysics(),
          controller:
              FixedExtentScrollController(initialItem: selectedYearIndex),
          itemExtent: 32.0,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedYearIndex = index;
              selectedYear = 2000 + index;
              updateDaysInMonth();
              updateDate();
            });
          },
          children: List.generate(
            51,
            (index) {
              bool isSelected = index == selectedYearIndex;
              return Container(
                height: 28.0,
                alignment: Alignment.center,
                child: Text(
                  '${2000 + index}년',
                  style: isSelected
                      ? Theme.of(context).textTheme.labelLarge
                      : Theme.of(context).textTheme.labelSmall,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _monthDate() {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: ListWheelScrollView(
          physics: const FixedExtentScrollPhysics(),
          controller:
              FixedExtentScrollController(initialItem: selectedMonthIndex),
          itemExtent: 32.0,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedMonthIndex = index;
              selectedMonth = index + 1;
              updateDaysInMonth();
              updateDate();
            });
          },
          children: List.generate(
            12,
            (index) {
              bool isSelected = index == selectedMonthIndex;
              return Container(
                height: 28.0,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}월',
                  style: isSelected
                      ? Theme.of(context).textTheme.labelLarge
                      : Theme.of(context).textTheme.labelSmall,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _dayDate() {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: ListWheelScrollView(
          physics: const FixedExtentScrollPhysics(),
          controller:
              FixedExtentScrollController(initialItem: selectedDayIndex),
          itemExtent: 32.0,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedDayIndex = index;
              selectedDay = index + 1;
              updateDate();
            });
          },
          children: List.generate(
            daysInMonth,
            (index) {
              bool isSelected = index == selectedDayIndex;
              return Container(
                height: 28.0,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}일',
                  style: isSelected
                      ? Theme.of(context).textTheme.labelLarge
                      : Theme.of(context).textTheme.labelSmall,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _bottom() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: isButtonDisabled()
              ? const Color(0xffF0ECE8)
              : Theme.of(context).colorScheme.primary,
          fixedSize: const Size(390, 48),
        ),
        onPressed: isButtonDisabled()
            ? null
            : () {
                if (selectedButton) {
                  widget.onStartAtComp(
                      DateTime(selectedYear, selectedMonth, selectedDay));
                } else {
                  widget.onEndAtComp(
                      DateTime(selectedYear, selectedMonth, selectedDay));
                }
                Navigator.of(context).pop();
              },
        child: Text(
          "선택하기",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
