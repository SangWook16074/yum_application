// Mocks generated by Mockito 5.4.4 from annotations
// in yum_application/test/app/view/app_ui_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i8;

import 'package:mockito/mockito.dart' as _i1;
import 'package:yum_application/src/data/ingredient/entity/refreginator_ingredient.dart'
    as _i5;
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart'
    as _i2;
import 'package:yum_application/src/ui/common/enums/status.dart' as _i4;
import 'package:yum_application/src/ui/ingredient/model/basic_ingredient.dart'
    as _i7;
import 'package:yum_application/src/ui/ingredient/viewModel/ingredient_view_model.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIngredientRepository_0 extends _i1.SmartFake
    implements _i2.IngredientRepository {
  _FakeIngredientRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RefreginatorIngredientViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreginatorIngredientViewModel extends _i1.Mock
    implements _i3.RefreginatorIngredientViewModel {
  @override
  _i2.IngredientRepository get ingredientRepository => (super.noSuchMethod(
        Invocation.getter(#ingredientRepository),
        returnValue: _FakeIngredientRepository_0(
          this,
          Invocation.getter(#ingredientRepository),
        ),
        returnValueForMissingStub: _FakeIngredientRepository_0(
          this,
          Invocation.getter(#ingredientRepository),
        ),
      ) as _i2.IngredientRepository);

  @override
  _i4.Status get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i4.Status.init,
        returnValueForMissingStub: _i4.Status.init,
      ) as _i4.Status);

  @override
  set status(_i4.Status? _status) => super.noSuchMethod(
        Invocation.setter(
          #status,
          _status,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isWarningFilterOn => (super.noSuchMethod(
        Invocation.getter(#isWarningFilterOn),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set isWarningFilterOn(bool? _isWarningFilterOn) => super.noSuchMethod(
        Invocation.setter(
          #isWarningFilterOn,
          _isWarningFilterOn,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i5.RefreginatorIngredient> get myFreezedIngredients =>
      (super.noSuchMethod(
        Invocation.getter(#myFreezedIngredients),
        returnValue: <_i5.RefreginatorIngredient>[],
        returnValueForMissingStub: <_i5.RefreginatorIngredient>[],
      ) as List<_i5.RefreginatorIngredient>);

  @override
  List<_i5.RefreginatorIngredient> get myUnfreezedIngredients =>
      (super.noSuchMethod(
        Invocation.getter(#myUnfreezedIngredients),
        returnValue: <_i5.RefreginatorIngredient>[],
        returnValueForMissingStub: <_i5.RefreginatorIngredient>[],
      ) as List<_i5.RefreginatorIngredient>);

  @override
  bool get notINF => (super.noSuchMethod(
        Invocation.getter(#notINF),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isFreezed => (super.noSuchMethod(
        Invocation.getter(#isFreezed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i6.Future<void> fetchData() => (super.noSuchMethod(
        Invocation.method(
          #fetchData,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  dynamic toggleWarning(bool? value) => super.noSuchMethod(
        Invocation.method(
          #toggleWarning,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateIngredientName(String? newName) => super.noSuchMethod(
        Invocation.method(
          #updateIngredientName,
          [newName],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<void> createNewIngredient() => (super.noSuchMethod(
        Invocation.method(
          #createNewIngredient,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> updateIngredient() => (super.noSuchMethod(
        Invocation.method(
          #updateIngredient,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  void deleteIngredient(_i5.RefreginatorIngredient? ingredient) =>
      super.noSuchMethod(
        Invocation.method(
          #deleteIngredient,
          [ingredient],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void selectIngredient(_i7.BasicIngredient? ingredient) => super.noSuchMethod(
        Invocation.method(
          #selectIngredient,
          [ingredient],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void selectPrevIngredient(_i5.RefreginatorIngredient? prevIngredient) =>
      super.noSuchMethod(
        Invocation.method(
          #selectPrevIngredient,
          [prevIngredient],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void toggleIsFreezed(bool? value) => super.noSuchMethod(
        Invocation.method(
          #toggleIsFreezed,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void toggleNotInfinity(bool? value) => super.noSuchMethod(
        Invocation.method(
          #toggleNotInfinity,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateStartAt(DateTime? newStartAt) => super.noSuchMethod(
        Invocation.method(
          #updateStartAt,
          [newStartAt],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateEndAt(DateTime? newEndAt) => super.noSuchMethod(
        Invocation.method(
          #updateEndAt,
          [newEndAt],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void resetSelectIngredient() => super.noSuchMethod(
        Invocation.method(
          #resetSelectIngredient,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
