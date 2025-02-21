import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/basic_ingredient_view_model.dart';

final baiscIngredientViewModelProvider =
    ChangeNotifierProvider<BasicIngredientViewModel>(
  create: (context) => BasicIngredientViewModel(
    ingredientRepository: context.read<IngredientRepository>(),
  ),
);
