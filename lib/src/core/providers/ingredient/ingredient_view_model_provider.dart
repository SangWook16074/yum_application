import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/ingredient_view_model.dart';

/// [Ingredient]관련 뷰모델 Provider 주입
final ingredientViewModelProvider =
    ChangeNotifierProvider<RefreginatorIngredientViewModel>(
        create: (context) => RefreginatorIngredientViewModel(
            ingredientRepository: context.read<IngredientRepository>()));
