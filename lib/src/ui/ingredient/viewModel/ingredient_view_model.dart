import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/ui/common/enums/status.dart';
import 'package:yum_application/src/data/ingredient/model/initial_ingredient.dart';
import 'package:yum_application/src/data/ingredient/model/refreginator_ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/util/global_variable.dart';

class RefreginatorIngredientViewModel extends ChangeNotifier {
  final IngredientRepository ingredientRepository;

  /// 연결 상태 [Status]
  ///
  /// 사용자의 현재 api 호출 여부를 나타내는 ENUM 클래스입니다.
  Status status = Status.init;

  /// 냉장고 식재료 데이터
  ///
  /// 초기에는 빈 배열로 초기화됩니다.
  List<RefreginatorIngredient> _myIngredients = List.empty(growable: true);

  RefreginatorIngredientViewModel({required this.ingredientRepository}) {
    fetchData();
  }

  /// 사용자가 자신의 모든 재료를 READ하는 메소드
  ///
  /// 사용자가 이 메소드를 호출하면 모든 재료를 불러오는 API 호출을 실행합니다.
  Future<void> fetchData() async {
    status = Status.loading;
    notifyListeners();
    try {
      final result = await ingredientRepository.getMyIngredient();

      // 기존의 재료 모두 삭제
      _myIngredients.clear();

      // 호출된 재료들을 재료 배열의 삽입
      _myIngredients.addAll(result);

      // 상태 갱신 -> loading -> loaded
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
  List<RefreginatorIngredient> get myFreezedIngredients {
    return _myIngredients
        .where((ingredient) => ingredient.isFreezed == true)
        .where((ingredient) => !isWarningFilterOn || ingredient.isWarning)
        .toList();
  }

  /// 나의 냉장 재료 getter
  /// /// [isWarningFilterOn]이 활성화되면 기간이 임박한
  /// 냉장 식재료만을 반환합니다.
  List<RefreginatorIngredient> get myUnfreezedIngredients {
    return _myIngredients
        .where((ingredient) => ingredient.isFreezed == false)
        .where((ingredient) => !isWarningFilterOn || ingredient.isWarning)
        .toList();
  }

  RefreginatorIngredient? _selectedIngredient;

  RefreginatorIngredient? get selectedIngredient => _selectedIngredient;

  bool _notInfinity = true;
  bool get notINF => _notInfinity;

  bool _isFreezed = false;
  bool get isFreezed => _isFreezed;

  /// 세로운 재료를 생성하는 API 호출 메소드입니다.
  ///
  /// 새로운 재료 생성에 성공한다면, 생성된 재료를 기존 재료 List에 추가합니다.
  /// 실패한다면 에러를 반환합니다.
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
      // api 호출 이전에 기존 재료 List에 생성될 재료를 잠시 추가
      SchedulerBinding.instance.addPostFrameCallback((_) {
        final context = GlobalVariable.naviagatorState.currentContext!;
        Navigator.of(context).pop();
      });
      final result =
          await ingredientRepository.createNewIngredient(newIngredient);

      /// api 호출에 성공하면 기존 재료 List에 잠시 추가된 재료 대신 본래의 데이터를 추가
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

  Future<void> updateIngredient() async {
    // 선택한 재료가 없으면 return;
    if (_selectedIngredient == null) {
      return;
    }
    try {
      final updatedIngredient =
          _selectedIngredient!.copy(name: _ingredientName);
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

  /// 재료 삭제 API 호출 메소드
  ///
  /// 사용자가 자신의 재료를 삭제하는 경우 이 메소드를 통해서 삭제할 수 있습니다.
  void deleteIngredient(RefreginatorIngredient ingredient) {
    try {
      ingredientRepository.deleteIngredient(ingredient.id!);
      SchedulerBinding.instance.addPostFrameCallback((_) {
        final context = GlobalVariable.naviagatorState.currentContext!;
        Navigator.of(context).pop();
      });
      _myIngredients = _myIngredients.where((i) => ingredient != i).toList();
      notifyListeners();
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// 사용자가 새롭게 생성할 재료를 선택하는 메소드
  ///
  ///
  /// 사용자는 이 메소드를 통해서 새로운 재료를 이미지와 함께 시트에 렌더링할 수 있습니다.
  /// 기본 이름은 [BasicIngredient]의 기본 이름을 따릅니다.
  void selectIngredient(InitialIngredient ingredient) {
    final newIngredient = RefreginatorIngredient(
        name: ingredient.name,
        category: ingredient.category,
        isFreezed: _isFreezed);
    _selectedIngredient = newIngredient;
    notifyListeners();
  }

  void selectPrevIngredient(RefreginatorIngredient prevIngredient) {
    _selectedIngredient = prevIngredient;
    _isFreezed = prevIngredient.isFreezed;
    notifyListeners();
  }

  /// 선택 재료 초기화 메소드
  ///
  /// 사용자는 이 메소드를 통해서 선택한 재료 데이터를 지울 수 있습니다.
  void cancel() {
    _selectedIngredient = null;
    notifyListeners();
  }

  /// 냉동 여부 토글링 함수
  ///
  /// 이 메소드를 통해서 재료의 냉동 냉장 여부를 선택할 수 있습니다.
  void toggleIsFreezed(bool value) {
    _isFreezed = value;
    // 선택한 재료가 있는 경우에만 수행
    if (_selectedIngredient != null) {
      _selectedIngredient = _selectedIngredient!.copy(isFreezed: _isFreezed);
    }
    notifyListeners();
  }

  /// 선택한 재료의 유통기한 유무 표시 메소드
  ///
  /// 재료가 유통기한이 없다면 이 메소드를 통해서
  /// 유통기한의 유무를 토글링할 수 있습니다.
  void toggleNotInfinity(bool value) {
    _notInfinity = value;
    // 선택한 재료가 있는 경우에만 수행
    if (_selectedIngredient != null && !_notInfinity) {
      _selectedIngredient = _selectedIngredient!.copy(endAt: null);
    }
    notifyListeners();
  }

  /// 재료의 생성일 수정 메소드
  void updateStartAt(DateTime newStartAt) {
    // 선택한 재료가 없다면 종료
    if (_selectedIngredient == null) return;
    _selectedIngredient = _selectedIngredient!.copy(startAt: newStartAt);
    notifyListeners();
  }

  /// 재료의 유통기한 수정 메소드
  ///
  /// 사용자는 이 메소드를 통해서 유통기한을 지정할 수 있습니다.
  void updateEndAt(DateTime newEndAt) {
    // 선택한 재료가 없다면 종료
    if (_selectedIngredient == null) return;
    _selectedIngredient = _selectedIngredient!.copy(endAt: newEndAt);
    notifyListeners();
  }
}
