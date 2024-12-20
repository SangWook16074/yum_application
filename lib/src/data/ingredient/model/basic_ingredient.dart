class BasicIngredient {
  final String name;
  final bool isFavorite;
  final IngredientCategory category;
  final IngredientType type;

  BasicIngredient({
    required this.name,
    this.isFavorite = false,
    required this.category,
    required this.type,
  });

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
  favorite
}

// 재료 속성 enum
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

  factory IngredientCategory.fromString(String name) {
    return IngredientCategory.values
        .firstWhere((category) => category.name == name);
  }
}
