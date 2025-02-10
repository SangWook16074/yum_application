import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/common/widgets/basic_bottom_sheet.dart';
import 'package:yum_application/src/common/widgets/scroll_date_dialog.dart';

main() {
  late final MaterialApp widget;

  group("Scroll Date Dialog Widget Test", () {
    DateTime testStartAt = DateTime.now();
    DateTime testEndAt = DateTime.now();

    setUpAll(() {
      widget = MaterialApp(
          home: ScrollDateDialog(onStartAtComp: (value) {
        testStartAt = value;
      }, onEndAtComp: (value) {
        testEndAt = value;
      }));
    });

    testWidgets("Scroll Date Dialog가 성공적으로 랜더링 된다.",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(BasicBottomSheet), findsOneWidget);
      expect(find.byKey(const Key("header")), findsOneWidget);
      expect(find.byKey(const Key("body")), findsOneWidget);
      expect(find.byKey(const Key("year date")), findsOneWidget);
      expect(find.byKey(const Key("month date")), findsOneWidget);
      expect(find.byKey(const Key("day date")), findsOneWidget);
      expect(find.byKey(const Key("bottom")), findsOneWidget);
    });

    testWidgets(
        "사용자가 소비기한을 누른 후 연도, 달, 날짜를 모두 밑으로 내리면 2050년 12월 31일이 EndAt에 전달된다.",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      await tester.tap(find.byKey(const Key("Scroll Date Dialog 소비기한 버튼")));
      await tester.pumpAndSettle();
      await tester.drag(
          find.byKey(const Key("year date")), const Offset(0, -5000));
      await tester.pumpAndSettle();
      await tester.drag(
          find.byKey(const Key("month date")), const Offset(0, -5000));
      await tester.pumpAndSettle();
      await tester.drag(
          find.byKey(const Key("day date")), const Offset(0, -5000));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("bottom")));
      await tester.pumpAndSettle();
      expect(testEndAt, DateTime(2050, 12, 31));
    });

    testWidgets(
        "사용자가 구매날짜를 누른 후 연도, 달, 날짜를 모두 밑으로 내리면 2050년 12월 31일이 StartAt에 전달된다.",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      await tester.tap(find.byKey(const Key("Scroll Date Dialog 구매날짜 버튼")));
      await tester.pumpAndSettle();
      await tester.drag(
          find.byKey(const Key("year date")), const Offset(0, -5000));
      await tester.pumpAndSettle();
      await tester.drag(
          find.byKey(const Key("month date")), const Offset(0, -5000));
      await tester.pumpAndSettle();
      await tester.drag(
          find.byKey(const Key("day date")), const Offset(0, -5000));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("bottom")));
      await tester.pumpAndSettle();
      expect(testStartAt, DateTime(2050, 12, 31));
    });
  });
}
