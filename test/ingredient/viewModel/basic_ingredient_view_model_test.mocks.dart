// Mocks generated by Mockito 5.4.4 from annotations
// in yum_application/test/ingredient/viewModel/basic_ingredient_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart'
    as _i2;
import 'package:yum_application/src/data/ingredient/model/initial_ingredient.dart'
    as _i7;
import 'package:yum_application/src/data/ingredient/model/refreginator_ingredient.dart'
    as _i5;
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

class _FakeRemoteDatasource_0 extends _i1.SmartFake
    implements _i2.RemoteDatasource {
  _FakeRemoteDatasource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IngredientRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockIngredientRepositoryImpl extends _i1.Mock
    implements _i3.IngredientRepositoryImpl {
  @override
  _i2.RemoteDatasource get remoteDatasource => (super.noSuchMethod(
        Invocation.getter(#remoteDatasource),
        returnValue: _FakeRemoteDatasource_0(
          this,
          Invocation.getter(#remoteDatasource),
        ),
        returnValueForMissingStub: _FakeRemoteDatasource_0(
          this,
          Invocation.getter(#remoteDatasource),
        ),
      ) as _i2.RemoteDatasource);

  @override
  _i4.Future<List<_i5.RefreginatorIngredient>> getMyIngredient() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMyIngredient,
          [],
        ),
        returnValue: _i4.Future<List<_i5.RefreginatorIngredient>>.value(
            <_i5.RefreginatorIngredient>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.RefreginatorIngredient>>.value(
                <_i5.RefreginatorIngredient>[]),
      ) as _i4.Future<List<_i5.RefreginatorIngredient>>);

  @override
  _i4.Future<_i5.RefreginatorIngredient> createNewIngredient(
          _i5.RefreginatorIngredient? ingredient) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewIngredient,
          [ingredient],
        ),
        returnValue: _i4.Future<_i5.RefreginatorIngredient>.value(
            _i6.dummyValue<_i5.RefreginatorIngredient>(
          this,
          Invocation.method(
            #createNewIngredient,
            [ingredient],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i5.RefreginatorIngredient>.value(
            _i6.dummyValue<_i5.RefreginatorIngredient>(
          this,
          Invocation.method(
            #createNewIngredient,
            [ingredient],
          ),
        )),
      ) as _i4.Future<_i5.RefreginatorIngredient>);

  @override
  _i4.Future<_i5.RefreginatorIngredient> updateIngredient(
          _i5.RefreginatorIngredient? ingredient) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateIngredient,
          [ingredient],
        ),
        returnValue: _i4.Future<_i5.RefreginatorIngredient>.value(
            _i6.dummyValue<_i5.RefreginatorIngredient>(
          this,
          Invocation.method(
            #updateIngredient,
            [ingredient],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i5.RefreginatorIngredient>.value(
            _i6.dummyValue<_i5.RefreginatorIngredient>(
          this,
          Invocation.method(
            #updateIngredient,
            [ingredient],
          ),
        )),
      ) as _i4.Future<_i5.RefreginatorIngredient>);

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
  _i4.Future<List<_i7.IngredientCategory>> getMyFavoriteIngredient() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMyFavoriteIngredient,
          [],
        ),
        returnValue: _i4.Future<List<_i7.IngredientCategory>>.value(
            <_i7.IngredientCategory>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i7.IngredientCategory>>.value(
                <_i7.IngredientCategory>[]),
      ) as _i4.Future<List<_i7.IngredientCategory>>);

  @override
  _i4.Future<void> createNewFavoriteIngredient(
          _i7.IngredientCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNewFavoriteIngredient,
          [category],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteFavoriteIngredient(_i7.IngredientCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFavoriteIngredient,
          [category],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
