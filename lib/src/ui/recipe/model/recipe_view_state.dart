import 'package:equatable/equatable.dart';
import 'package:yum_application/src/data/recipe/model/recipe.dart';

sealed class RecipeViewState extends Equatable {}

final class InitState extends RecipeViewState {
  @override
  List<Object?> get props => [];
}

final class LoadingState extends RecipeViewState {
  @override
  List<Object?> get props => [];
}

final class ErrorState extends RecipeViewState {
  @override
  List<Object?> get props => [];
}

final class LoadedState extends RecipeViewState {
  final List<Recipe> recipes;

  LoadedState({required this.recipes});

  LoadedState copyWith({List<Recipe>? recipes}) {
    return LoadedState(recipes: recipes ?? this.recipes);
  }

  @override
  List<Object?> get props => [recipes];
}
