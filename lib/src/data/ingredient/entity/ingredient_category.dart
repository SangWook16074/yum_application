/// [BasicIngredient]와 [RefreginatorIngredient]의 타입을 지정하는 재료 ENUM 클래스입니다.
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
