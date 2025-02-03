// Mocks generated by Mockito 5.4.4 from annotations
// in yum_application/test/challenge/view/challenge_list_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:yum_application/src/data/ingredient/model/basic_ingredient.dart'
    as _i5;
import 'package:yum_application/src/data/ingredient/model/ingredient.dart'
    as _i2;
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart'
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

class _FakeIngredient_0 extends _i1.SmartFake implements _i2.Ingredient {
  _FakeIngredient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IngredientRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIngredientRepository extends _i1.Mock
    implements _i3.IngredientRepository {
  @override
  _i4.Future<List<_i2.Ingredient>> getMyIngredient() => (super.noSuchMethod(
        Invocation.method(
          #getMyIngredient,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Ingredient>>.value(<_i2.Ingredient>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.Ingredient>>.value(<_i2.Ingredient>[]),
      ) as _i4.Future<List<_i2.Ingredient>>);

  @override
  _i4.Future<_i2.Ingredient> createNewIngredient(_i2.Ingredient? ingredient) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewIngredient,
          [ingredient],
        ),
        returnValue: _i4.Future<_i2.Ingredient>.value(_FakeIngredient_0(
          this,
          Invocation.method(
            #createNewIngredient,
            [ingredient],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Ingredient>.value(_FakeIngredient_0(
          this,
          Invocation.method(
            #createNewIngredient,
            [ingredient],
          ),
        )),
      ) as _i4.Future<_i2.Ingredient>);

  @override
  _i4.Future<_i2.Ingredient> updateIngredient(_i2.Ingredient? ingredient) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateIngredient,
          [ingredient],
        ),
        returnValue: _i4.Future<_i2.Ingredient>.value(_FakeIngredient_0(
          this,
          Invocation.method(
            #updateIngredient,
            [ingredient],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Ingredient>.value(_FakeIngredient_0(
          this,
          Invocation.method(
            #updateIngredient,
            [ingredient],
          ),
        )),
      ) as _i4.Future<_i2.Ingredient>);

  @override
  _i4.Future<List<_i5.IngredientCategory>> getMyFavoriteIngredient() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMyFavoriteIngredient,
          [],
        ),
        returnValue: _i4.Future<List<_i5.IngredientCategory>>.value(
            <_i5.IngredientCategory>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.IngredientCategory>>.value(
                <_i5.IngredientCategory>[]),
      ) as _i4.Future<List<_i5.IngredientCategory>>);

  @override
  _i4.Future<void> deleteIngredient(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteIngredient,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> createNewFavoriteIngredient(
          _i5.IngredientCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewFavoriteIngredient,
          [category],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteFavoriteIngredient(_i5.IngredientCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFavoriteIngredient,
          [category],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
