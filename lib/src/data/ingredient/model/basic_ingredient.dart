class BasicIngredient {
  /// [BasicIngredient]의 기본 이름입니다.
  ///
  /// 사용자는 [Ingredinet]의 이름을 지정하지 않으면,
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
  /// [IngredientAddBottomSheet]에서 type을 통해서
  /// 영역을 분리하여 재료를 렌더링합니다.
  final IngredientType type;

  /// [BasicIngredient]의 기본 생성자입니다.
  BasicIngredient({
    required this.name,
    this.isFavorite = false,
    required this.category,
    required this.type,
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

/// [BasicIngredient]의 타입을 지정하는 ENUM 클래스입니다.
enum IngredientType {
  carbohydrate,
  vegetable,
  meatsAndEggs,
  fishAndShrimp,
  processedFood,
  milkAndNuts,
  drink,
  favorite
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
