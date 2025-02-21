import 'package:yum_application/src/data/ingredient/entity/ingredient_category.dart';

final class BasicIngredient {
  /// [BasicIngredient]의 기본 이름입니다.
  ///
  /// 사용자는 [BasicIngredient]의 이름을 지정하지 않으면,
  /// [BasicIngredient]의 기본 이름을 사용하게 됩니다.
  final String name;

  /// [BasicIngredient]의 즐겨찾기 여부 필드입니다.
  ///
  /// 사용자는 자신이 즐겨찾기에 등록한 [BasicIngredient]를
  /// [IngredientAddBottomSheet]의 가장 상단에서 볼 수 있습니다.
  final bool isFavorite;

  /// [BasicIngredient]의 카테고리입니다.
  ///
  /// 카테고리를 통해서 asset 이미지 파일을 찾을 수 있습니다.
  final IngredientCategory category;

  /// [BasicIngredient]의 타입입니다.
  ///
  /// 이는 기본 식재료의 카테고리 그룹을 지정하기 위한 열거형 타입으로 지정됩니다.
  final IngredientType type;

  /// [BasicIngredient]의 기본 생성자입니다.
  BasicIngredient({
    required this.name,
    this.isFavorite = false,
    required this.category,
    this.type = IngredientType.none,
  });

  /// [BasicIngredient]의 copy 메소드입니다.
  ///
  /// 사용자가 전달한 값만을 갱신하여 반환합니다.
  BasicIngredient copy({
    bool? isFavorite,
    IngredientCategory? category,
  }) {
    return BasicIngredient(
        name: name,
        isFavorite: isFavorite ?? this.isFavorite,
        category: category ?? this.category,
        type: type);
  }
}

enum IngredientType {
  carbohydrate,
  vegetable,
  meatsAndEggs,
  fishAndShrimp,
  processedFood,
  milkAndNuts,
  drink,
  favorite,
  none,
}
