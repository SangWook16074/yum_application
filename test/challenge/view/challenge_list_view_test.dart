import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/challenge/widget/challenge_list.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import '../../common/mock_navigator_observer.dart';
import '../../ingredient/view/home_view_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientRepository>()])
void main() {
  late IngredientRepository repository;
  late IngredientViewModelImpl viewModel;
  late Widget challengeListView;

  setUp(() {
    repository = MockIngredientRepository();
    viewModel = IngredientViewModelImpl(ingredientRepository: repository);
    final observer = MockNavigatorObserver();
    challengeListView = ChangeNotifierProvider<IngredientViewModelImpl>(
      create: (_) => viewModel,
      builder: (_, __) => MaterialApp(
        navigatorObservers: [observer],
        home: const ChallengeList(),
      ),
    );
  });

  group("Challenge List View 랜더링 테스트", () {
    testWidgets(
        "Challenge List View에는 title, subtitle, image를 가진 Challenge List가 랜더링 된다.",
        (WidgetTester tester) async {
      await tester.pumpWidget(challengeListView);

      expect(find.byKey(const Key("Recipe registration")),
          findsAtLeastNWidgets(1));
      expect(find.byKey(const Key("Recipe Review")), findsAtLeastNWidgets(1));
      expect(find.byKey(const Key("Recipe recommendation")),
          findsAtLeastNWidgets(1));
      expect(find.byKey(const Key("Number of recipe uses")),
          findsAtLeastNWidgets(1));
      expect(find.byKey(const Key("Number of consecutive recipe uses")),
          findsAtLeastNWidgets(1));
    });
  });
}
