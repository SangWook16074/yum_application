import 'package:equatable/equatable.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';

final class InitialIngredient extends Ingredient with EquatableMixin {
  // /// [InitialIngredient]의 기본 이름입니다.
  // ///
  // /// 사용자는 [InitialIngredient]의 이름을 지정하지 않으면,
  // /// [InitialIngredient]의 기본 이름을 사용하게 됩니다.
  // @override
  // final String name;

  /// [InitialIngredient]의 즐겨찾기 여부 필드입니다.
  ///
  /// 사용자는 자신이 즐겨찾기에 등록한 [InitialIngredient]를
  /// [IngredientAddBottomSheet]의 가장 상단에서 볼 수 있습니다.
  final bool isFavorite;

  /// [InitialIngredient]의 카테고리입니다.
  ///
  /// 카테고리를 통해서 asset 이미지 파일을 찾을 수 있습니다.
  final IngredientCategory category;

  /// [InitialIngredient]의 타입입니다.
  ///
  /// 이는 기본 식재료의 카테고리 그룹을 지정하기 위한 열거형 타입으로 지정됩니다.
  final IngredientType type;

  /// [InitialIngredient]의 기본 생성자입니다.
  InitialIngredient({
    required super.name,
    this.isFavorite = false,
    required this.category,
    this.type = IngredientType.none,
  });

  /// [InitialIngredient]의 copy 메소드입니다.
  ///
  /// 사용자가 전달한 값만을 갱신하여 반환합니다.
  InitialIngredient copy({
    bool? isFavorite,
    IngredientCategory? category,
  }) {
    return InitialIngredient(
        name: name,
        isFavorite: isFavorite ?? this.isFavorite,
        category: category ?? this.category,
        type: type);
  }

  @override
  List<Object?> get props => [name, isFavorite, category, type];

  /// [BasicIngredient]의 타입을 지정하는 ENUM 클래스입니다.
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

/// [BasicIngredient]와 [Ingredient]의 타입을 지정하는 재료 ENUM 클래스입니다.
enum IngredientCategory {
  beef("beef"),
  beer("beer"),
  bread("bread"),
  broccoli("broccoli"),
  cabbage("cabbage"),
  canned_goods("canned_goods"),
  canned_tuna("canned_tuna"),
  cheese("cheese"),
  chicken_breast("chicken_breast"),
  drink("drink"),
  dumpling("dumpling"),
  egg("egg"),
  fish("fish"),
  fork("fork"),
  garlic("garlic"),
  grape("grape"),
  green_onion("green_onion"),
  ice_cream("ice_cream"),
  instance_noodle("instance_noodle"),
  milk("milk"),
  mushroom("mushroom"),
  noodle("noodle"),
  nut("nut"),
  onion("onion"),
  pepper("pepper"),
  potato("potato"),
  processed_meat("processed_meat"),
  rice("rice"),
  seaweed("seaweed"),
  shrimp("shrimp"),
  soju("soju"),
  tomato("tomato"),
  topu("topu"),
  ;

  final String name;
  const IngredientCategory(this.name);

  String get imagePath {
    return "assets/images/$name.png";
  }

  /// [IngredientCategory]의 역직렬화 메소드입니다.
  ///
  /// JSON 데이터를 [IngredientCategory]타입으로 변환합니다.
  factory IngredientCategory.fromJson(Map<String, dynamic> json) {
    return IngredientCategory.fromString(json["category"]);
  }

  /// [IngredientCategory]의 String 생성자입니다.
  ///
  /// 사용자는 String 값을 통해서 [IngredientCategory]를 반환할 수 있습니다.
  factory IngredientCategory.fromString(String name) {
    return IngredientCategory.values
        .firstWhere((category) => category.name == name);
  }

  /// [IngredientCategory]의 직렬화 메소드입니다.
  Map<String, dynamic> toJson() => {
        "category": name,
      };
}
