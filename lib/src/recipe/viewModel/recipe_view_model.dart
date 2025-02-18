import 'package:flutter/material.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';

class RecipeViewModel extends ChangeNotifier {
  final List<Ingredient> initIngredient;

  List<Ingredient> _selectedIngredient = List.empty(growable: true);

  List<Ingredient> get selectedIngredient => _selectedIngredient;

  RecipeViewModel({required this.initIngredient}) {
    _initSelectedIngredient(initIngredient);
  }

  void _initSelectedIngredient(List<Ingredient> initIngredient) {
    _selectedIngredient.addAll(initIngredient);
  }
}
