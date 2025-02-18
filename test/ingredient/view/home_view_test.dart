import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/model/basic_ingredient.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/domain/ingredient/view/home_view.dart';
import 'package:yum_application/src/domain/ingredient/widget/ingredient_image.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

import '../../common/mock_navigator_observer.dart';
import 'home_view_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientRepository>()])
void main() {
  /// 테스트 UI 랜더링 의존성 주입 코드
  /// HomeView는 IngredientViewModel이 주입되어야
  /// Consumer 위젯이 해당 데이터를 가져옴
  late IngredientRepository repository;
  late IngredientViewModelImpl viewModel;
  late Widget homeView;
  group("Home View Widget Initialize test", () {
    setUp(() {
      repository = MockIngredientRepository();
      viewModel = IngredientViewModelImpl(ingredientRepository: repository);
      final observer = MockNavigatorObserver();
      homeView = ChangeNotifierProvider<IngredientViewModelImpl>(
        create: (context) => viewModel,
        builder: (context, child) => MaterialApp(
          navigatorObservers: [observer],
          home: const HomeView(),
        ),
      );
    });

    testWidgets("Home View에는 label과 Floating Action Button, 냉동칸, 냉장칸이 랜더링된다",
        (WidgetTester tester) async {
      await tester.pumpWidget(homeView);
      expect(find.byKey(const Key("header")), findsAtLeast(1));
      expect(find.byKey(const Key("freezer")), findsAtLeast(1));
      expect(find.byKey(const Key("fridge")), findsAtLeast(1));
    });

    testWidgets("사용자의 냉장고 재료가 올바르게 렌더링 된다.", (WidgetTester tester) async {
      await tester.pumpWidget(homeView);
      when(repository.getMyIngredient()).thenAnswer((_) async => [
            Ingredient(
                id: 1,
                name: "계란",
                category: IngredientCategory.egg,
                isFreezed: true,
                startAt: DateTime(2024, 12, 4),
                endAt: DateTime(2024, 12, 4)),
            Ingredient(
                id: 1,
                name: "소고기",
                category: IngredientCategory.egg,
                isFreezed: true,
                startAt: DateTime(2024, 12, 4),
                endAt: DateTime(2024, 12, 4)),
            Ingredient(
                id: 1,
                name: "우유",
                category: IngredientCategory.milk,
                isFreezed: false,
                startAt: DateTime(2024, 12, 4),
                endAt: DateTime(2024, 12, 4)),
          ]);
      await viewModel.fetchData();
      await tester.pumpAndSettle();

      expect(find.byType(IngredientImage), findsAtLeast(3));
    });

    testWidgets("각 칸의 재료의 수가 특정 개수를 넘어가면 최대 20개가 렌더링 된다.",
        (WidgetTester tester) async {
      await tester.pumpWidget(homeView);
      when(repository.getMyIngredient()).thenAnswer((_) async =>
          List.generate(
              10,
              (index) => Ingredient(
                  id: index + 1,
                  name: "egg",
                  category: IngredientCategory.egg,
                  isFreezed: true,
                  startAt: DateTime(2024, 12, 4),
                  endAt: DateTime(2024, 12, 4))) +
          List.generate(
              20,
              (index) => Ingredient(
                  id: index + 1,
                  name: "egg",
                  category: IngredientCategory.egg,
                  isFreezed: false,
                  startAt: DateTime(2024, 12, 4),
                  endAt: DateTime(2024, 12, 4))));

      await viewModel.fetchData();
      await tester.pumpAndSettle();

      expect(find.byType(IngredientImage), findsAtLeast(20));
    });
  });
}
