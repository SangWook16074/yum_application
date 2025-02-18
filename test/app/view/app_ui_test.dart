import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/domain/app/page/app_page.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

import 'app_ui_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientViewModelImpl>()])
void main() {
  late IngredientViewModelImpl ingredientViewModel;
  late Widget widget;
  group("App UI Test", () {
    ingredientViewModel =
        MockIngredientViewModelImpl() as IngredientViewModelImpl;
    setUpAll(() {
      widget = ChangeNotifierProvider(
        create: (context) => ingredientViewModel,
        child: const MaterialApp(home: AppPage()),
      );
    });
    testWidgets("App UI가 잘 랜더링된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("app view body")), findsOneWidget);
      expect(find.byKey(const Key("app view bottom nav")), findsOneWidget);
      expect(find.byKey(const Key("app view ingredient view")), findsOneWidget);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsNothing);
    });

    testWidgets("사용자는 레시피 탭을 터치하면 레시피 뷰로 전환된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("app view ingredient view")), findsOneWidget);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsNothing);

      await tester.tap(find.byKey(const Key("bottom nav recipe")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("app view ingredient view")), findsNothing);
      expect(find.byKey(const Key("app view recipe view")), findsOneWidget);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsNothing);
    });

    testWidgets("사용자는 챌린지 탭을 터치하면 챌린지 뷰로 전환된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("app view ingredient view")), findsOneWidget);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsNothing);

      await tester.tap(find.byKey(const Key("bottom nav challenge")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("app view ingredient view")), findsNothing);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsOneWidget);
      expect(find.byKey(const Key("app view mypage view")), findsNothing);
    });

    testWidgets("사용자는 마이페이지 탭을 터치하면 마이페이지 뷰로 전환된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("app view ingredient view")), findsOneWidget);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsNothing);

      await tester.tap(find.byKey(const Key("bottom nav mypage")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("app view ingredient view")), findsNothing);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsOneWidget);
    });

    testWidgets("사용자는 여러번 뷰를 이동할 수 있다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("app view ingredient view")), findsOneWidget);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsNothing);

      await tester.tap(find.byKey(const Key("bottom nav mypage")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("app view ingredient view")), findsNothing);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsOneWidget);

      await tester.tap(find.byKey(const Key("bottom nav ingredient")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("app view ingredient view")), findsOneWidget);
      expect(find.byKey(const Key("app view recipe view")), findsNothing);
      expect(find.byKey(const Key("app view challenge view")), findsNothing);
      expect(find.byKey(const Key("app view mypage view")), findsNothing);
    });
  });
}
