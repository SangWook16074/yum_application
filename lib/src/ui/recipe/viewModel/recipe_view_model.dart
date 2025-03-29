import 'package:flutter/material.dart';
import 'package:yum_application/src/data/recipe/model/recipe.dart';
import 'package:yum_application/src/data/recipe/repository/recipe_respository.dart';
import 'package:yum_application/src/ui/recipe/model/recipe_view_event.dart';
import 'package:yum_application/src/ui/recipe/model/recipe_view_state.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeRepository recipeRepository;

  RecipeViewModel({required this.recipeRepository}) {
    getFirstPages();
  }

  RecipeViewState _state = InitState();
  RecipeViewState get state => _state;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void onEvent(RecipeViewEvent event) {
    switch (event) {
      case GetFirstPages():
        getFirstPages();
        break;
      case GetNextPages():
        getSecondPages(event.page);
        break;
    }
  }

  Future<void> getFirstPages() async {
    try {
      _isLoading = true;
      notifyListeners();

      final recipes = await recipeRepository.getAllRecipes();
      _state = LoadedState(recipes: recipes);
    } catch (e) {
      _state = ErrorState();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getSecondPages(int page) async {
    try {
      _isLoading = true;
      notifyListeners();

      if (_state is LoadedState) {
        final currState = _state as LoadedState;
        final newRecipes = await recipeRepository.getAllRecipes(page: page);
        _state = currState.copyWith(recipes: [
          ...currState.recipes,
          ...newRecipes,
        ]);
      }
    } catch (e) {
      _state = ErrorState();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
