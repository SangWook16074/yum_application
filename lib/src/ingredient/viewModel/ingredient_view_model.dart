import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/data/ingredient/model/basic_ingredient.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/util/global_variable.dart';

class IngredientViewModelImpl extends ChangeNotifier
    implements IngredientViewModel {
  final IngredientRepository ingredientRepository;
  List<Ingredient> _myIngredients = List.empty(growable: true);

  IngredientViewModelImpl({required this.ingredientRepository}) {
    fetchData();
  }

  Ingredient? _selectedIngredient;

  @override
  List<Ingredient> get myFreezedIngredients =>
      _myIngredients.where((ingredient) => ingredient.isFreezed).toList();

  @override
  List<Ingredient> get myUnfreezedIngredients =>
      _myIngredients.where((ingredient) => !ingredient.isFreezed).toList();

  @override
  Ingredient? get selectedIngredient => _selectedIngredient;

  bool _isFreezed = false;
  bool get isFreezed => _isFreezed;

  @override
  Future<void> fetchData() async {
    try {
      final result = await ingredientRepository.getMyIngredient();
      _myIngredients.clear();
      _myIngredients.addAll(result);
      notifyListeners();
    } on Exception catch (e) {
      // 예를 들어, 에러상황에서는 토스트 메시지를 띄워서 사용자에게 알림을 보냄.
      throw Exception("재료 불러오기 에러");
    }
  }

  @override
  Future<void> createNewIngredient() async {
    // 선택한 재료가 없으면 return;
    if (_selectedIngredient == null) {
      return;
    }
    try {
      // 선택한 재료를 타겟으로 설정
      final newIngredient = selectedIngredient!;
      final prevIngredients = [
        ..._myIngredients,
      ];
      _myIngredients = [...prevIngredients, newIngredient];
      notifyListeners();
      // 서버와 통신이 종료되면 원래의 데이터를 바꿔끼움.
      SchedulerBinding.instance.addPostFrameCallback((_) {
        final context = GlobalVariable.naviagatorState.currentContext!;
        Navigator.of(context).pop();
      });
      final result =
          await ingredientRepository.createNewIngredient(newIngredient);
      _myIngredients = [
        ...prevIngredients,
        result,
      ];
      _selectedIngredient = null;
      notifyListeners();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void selectIngredient(BasicIngredient ingredient) {
    final newIngredient = Ingredient(
        name: ingredient.name,
        category: ingredient.category,
        isFreezed: _isFreezed);
    _selectedIngredient = newIngredient;
    notifyListeners();
  }

  @override
  void cancel() {
    _selectedIngredient = null;
    notifyListeners();
  }

  @override
  void toggleIsFreezed(bool value) {
    if (_selectedIngredient != null) {
      _selectedIngredient = _selectedIngredient!.copy(isFreezed: value);
    }
    _isFreezed = value;
    notifyListeners();
  }

  @override
  void updateStartAt(DateTime newStartAt) {
    if (_selectedIngredient == null) return;
    _selectedIngredient = _selectedIngredient!.copy(startAt: newStartAt);
    notifyListeners();
  }

  @override
  void updateEndAt(DateTime newEndAt) {
    if (_selectedIngredient == null) return;
    _selectedIngredient = _selectedIngredient!.copy(endAt: newEndAt);
    notifyListeners();
  }
}

abstract class IngredientViewModel {
  List<Ingredient> get myFreezedIngredients;

  List<Ingredient> get myUnfreezedIngredients;

  Ingredient? get selectedIngredient;

  Future<void> fetchData();

  void createNewIngredient();

  void selectIngredient(BasicIngredient ingredient);

  void cancel();

  void toggleIsFreezed(bool value);

  void updateStartAt(DateTime startAt);

  void updateEndAt(DateTime endAt);
}
