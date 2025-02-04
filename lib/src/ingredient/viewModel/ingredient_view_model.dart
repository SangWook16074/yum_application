import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/common/enums/status.dart';
import 'package:yum_application/src/data/ingredient/model/basic_ingredient.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/util/global_variable.dart';

class IngredientViewModelImpl extends ChangeNotifier
    implements IngredientViewModel {
  final IngredientRepository ingredientRepository;

  // 연결 상태
  Status status = Status.init;

  // 냉장고 식재료 데이터
  List<Ingredient> _myIngredients = List.empty(growable: true);

  IngredientViewModelImpl({required this.ingredientRepository}) {
    fetchData();
  }

  @override
  Future<void> fetchData() async {
    status = Status.loading;
    notifyListeners();
    try {
      final result = await ingredientRepository.getMyIngredient();
      _myIngredients.clear();
      _myIngredients.addAll(result);
      status = Status.loaded;
    } on Exception catch (e) {
      // 예를 들어, 에러상황에서는 토스트 메시지를 띄워서 사용자에게 알림을 보냄.
      status = Status.error;
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  /// [isWaringFilterOn]이 활성화되면,
  /// 냉장고 재료 중 기간이 임박한 재료만 필터링하게 됩니다.
  /// 그렇지 않은 경우에는 전체 재료를 반환합니다.
  bool isWarningFilterOn = false;

  /// [isWarningFilterOn]은 이 메소드를 통해서 값을 변경할 수 있습니다.
  @override
  toggleWarning(bool value) {
    isWarningFilterOn = value;

    notifyListeners();
  }

  String _ingredientName = "";

  void updateIngredientName(String newName) {
    _ingredientName = newName;
  }

  /// 나의 냉동 재료 getter
  /// [isWarningFilterOn]이 활성화되면 기간이 임박한
  /// 냉동 식재료만을 반환합니다.
  @override
  List<Ingredient> get myFreezedIngredients {
    return _myIngredients
        .where((ingredient) => ingredient.isFreezed == true)
        .where((ingredient) => !isWarningFilterOn || ingredient.isWarning)
        .toList();
  }

  /// 나의 냉장 재료 getter
  /// /// [isWarningFilterOn]이 활성화되면 기간이 임박한
  /// 냉장 식재료만을 반환합니다.
  @override
  List<Ingredient> get myUnfreezedIngredients {
    return _myIngredients
        .where((ingredient) => ingredient.isFreezed == false)
        .where((ingredient) => !isWarningFilterOn || ingredient.isWarning)
        .toList();
  }

  Ingredient? _selectedIngredient;

  @override
  Ingredient? get selectedIngredient => _selectedIngredient;

  bool _notInfinity = true;
  bool get notINF => _notInfinity;

  bool _isFreezed = false;
  bool get isFreezed => _isFreezed;

  @override
  Future<void> createNewIngredient() async {
    // 선택한 재료가 없으면 return;
    if (_selectedIngredient == null) {
      return;
    }

    try {
      // 선택한 재료를 타겟으로 설정
      final newIngredient = selectedIngredient!.copy(name: _ingredientName);
      final prevIngredients = _myIngredients;
      _myIngredients = [
        ...prevIngredients,
        newIngredient,
      ];
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
      // 선택 재료 초기화 및 화면 갱신
      cancel();
    } on Exception catch (e) {
      throw Exception("재료 생성 에러");
    }
  }

  @override
  Future<void> updateIngredient() async {
    // 선택한 재료가 없으면 return;
    if (_selectedIngredient == null) {
      return;
    }
    try {
      final updatedIngredient =
          _selectedIngredient!.copy(name: _ingredientName);
      print(updatedIngredient);
      // 선택한 재료를 타겟으로 설정
      // 기존 냉장고 재료 목록에서 해당 재료를 찾아 수정
      _myIngredients = _myIngredients.map((ingredient) {
        if (ingredient.id == updatedIngredient.id) {
          return updatedIngredient;
        } else {
          return ingredient;
        }
      }).toList();

      notifyListeners();

      SchedulerBinding.instance.addPostFrameCallback((_) {
        final context = GlobalVariable.naviagatorState.currentContext!;
        Navigator.of(context).pop();
      });
      // Api를 통해 재료 수정
      final result =
          await ingredientRepository.updateIngredient(updatedIngredient);
      print(result);
      _myIngredients = _myIngredients.map((ingredient) {
        if (ingredient.id == result.id) {
          return result;
        } else {
          return ingredient;
        }
      }).toList();
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void deleteIngredient(Ingredient ingredient) {
    _myIngredients = _myIngredients.where((i) => ingredient != i).toList();
    ingredientRepository.deleteIngredient(ingredient.id!);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final context = GlobalVariable.naviagatorState.currentContext!;
      Navigator.of(context).pop();
    });
    notifyListeners();
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
  void selectPrevIngredient(Ingredient prevIngredient) {
    _selectedIngredient = prevIngredient;
    _isFreezed = prevIngredient.isFreezed;
    notifyListeners();
  }

  @override
  void cancel() {
    _selectedIngredient = null;
    notifyListeners();
  }

  @override
  void toggleIsFreezed(bool value) {
    _isFreezed = value;
    if (_selectedIngredient != null) {
      _selectedIngredient = _selectedIngredient!.copy(isFreezed: _isFreezed);
    }
    notifyListeners();
  }

  void toggleNotInfinity(bool value) {
    _notInfinity = value;
    // print(_notInfinity);
    if (_selectedIngredient != null && !_notInfinity) {
      _selectedIngredient = _selectedIngredient!.copy(endAt: null);
    }
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

  void updateIngredient();

  void deleteIngredient(Ingredient ingredient);

  void selectIngredient(BasicIngredient ingredient);

  void selectPrevIngredient(Ingredient prevIngredient);

  void cancel();

  void toggleIsFreezed(bool value);

  void updateStartAt(DateTime startAt);

  void updateEndAt(DateTime endAt);

  void toggleWarning(bool value);
}
