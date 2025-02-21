import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/ingredient/widget/single_button.dart';

main() {
  late final MaterialApp widget;
  late String text;

  group("Single Button Widget Test", () {
    final result = [];
    text = "Test Button";
    setUpAll(() {
      widget = MaterialApp(
        home: SingleButton(
            text: text,
            onTap: () {
              result.add(1);
            }),
      );
    });

    testWidgets("Single Button이 성공적으로 랜더링 된다.", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byKey(const Key("Single Button")), findsOneWidget);
    });

    testWidgets("Single Button이 성공적으로 눌린다.", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(result.length, 0);
      await tester.tap(find.byType(SingleButton));
      await tester.pumpAndSettle();
      expect(result.length, 1);
    });
  });
}
