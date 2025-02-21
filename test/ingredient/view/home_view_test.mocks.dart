// Mocks generated by Mockito 5.4.4 from annotations
// in yum_application/test/ingredient/view/home_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:yum_application/src/data/ingredient/entity/ingredient_category.dart'
    as _i6;
import 'package:yum_application/src/data/ingredient/entity/refreginator_ingredient.dart'
    as _i4;
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart'
    as _i2;

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

/// A class which mocks [IngredientRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIngredientRepository extends _i1.Mock
    implements _i2.IngredientRepository {
  @override
  _i3.Future<List<_i4.RefreginatorIngredient>> getMyIngredient() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMyIngredient,
          [],
        ),
        returnValue: _i3.Future<List<_i4.RefreginatorIngredient>>.value(
            <_i4.RefreginatorIngredient>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.RefreginatorIngredient>>.value(
                <_i4.RefreginatorIngredient>[]),
      ) as _i3.Future<List<_i4.RefreginatorIngredient>>);

  @override
  _i3.Future<_i4.RefreginatorIngredient> createNewIngredient(
          _i4.RefreginatorIngredient? ingredient) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewIngredient,
          [ingredient],
        ),
        returnValue: _i3.Future<_i4.RefreginatorIngredient>.value(
            _i5.dummyValue<_i4.RefreginatorIngredient>(
          this,
          Invocation.method(
            #createNewIngredient,
            [ingredient],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i4.RefreginatorIngredient>.value(
            _i5.dummyValue<_i4.RefreginatorIngredient>(
          this,
          Invocation.method(
            #createNewIngredient,
            [ingredient],
          ),
        )),
      ) as _i3.Future<_i4.RefreginatorIngredient>);

  @override
  _i3.Future<_i4.RefreginatorIngredient> updateIngredient(
          _i4.RefreginatorIngredient? ingredient) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateIngredient,
          [ingredient],
        ),
        returnValue: _i3.Future<_i4.RefreginatorIngredient>.value(
            _i5.dummyValue<_i4.RefreginatorIngredient>(
          this,
          Invocation.method(
            #updateIngredient,
            [ingredient],
          ),
        )),
        returnValueForMissingStub: _i3.Future<_i4.RefreginatorIngredient>.value(
            _i5.dummyValue<_i4.RefreginatorIngredient>(
          this,
          Invocation.method(
            #updateIngredient,
            [ingredient],
          ),
        )),
      ) as _i3.Future<_i4.RefreginatorIngredient>);

  @override
  _i3.Future<List<_i6.IngredientCategory>> getMyFavoriteIngredient() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMyFavoriteIngredient,
          [],
        ),
        returnValue: _i3.Future<List<_i6.IngredientCategory>>.value(
            <_i6.IngredientCategory>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i6.IngredientCategory>>.value(
                <_i6.IngredientCategory>[]),
      ) as _i3.Future<List<_i6.IngredientCategory>>);

  @override
  _i3.Future<void> deleteIngredient(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteIngredient,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> createNewFavoriteIngredient(
          _i6.IngredientCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewFavoriteIngredient,
          [category],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> deleteFavoriteIngredient(_i6.IngredientCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFavoriteIngredient,
          [category],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
