import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ingredient/view/home_view.dart';
import 'package:yum_application/src/ingredient/view/ingredient_add_view.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

import '../../common/mock_navigator_observer.dart';
import 'home_view_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientViewModel>()])
void main() {
  /// 테스트 UI 랜더링 의존성 주입 코드
  /// HomeView는 IngredientViewModel이 주입되어야
  /// Consumer 위젯이 해당 데이터를 가져옴
  final viewModel = MockIngredientViewModel();
  final mockNavigatorObserver = MockNavigatorObserver();
  final homeView = ChangeNotifierProvider<IngredientViewModel>(
    create: (context) => viewModel,
    builder: (context, child) => MaterialApp(
      navigatorObservers: [mockNavigatorObserver],
      home: const HomeView(),
    ),
  );
  group("Home View test", () {
    testWidgets("Home View에는 label과 Floating Action Button, 냉동칸, 냉장칸이 랜더링된다",
        (WidgetTester tester) async {
      await tester.pumpWidget(homeView);
      expect(find.byKey(const Key("header")), findsOneWidget);
      expect(find.byKey(const Key("freezer")), findsOneWidget);
      expect(find.byKey(const Key("fridge")), findsOneWidget);
      expect(find.byKey(const Key("fab")), findsOneWidget);
    });

    testWidgets("사용자는 FAB을 통해서 Ingredient Add View로 이동할 수 있다.",
        (WidgetTester tester) async {
      await tester.pumpWidget(homeView);
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // verify(mockNavigatorObserver.didPush(any, any));

      expect(find.byType(IngredientAddView), findsOneWidget);
    });
  });
}
