import 'package:yum_application/src/ingredient/widget/ingredient_image.dart';

class Ingredient {
  final int? id;
  final String name;
  bool isFreezed;
  final IngredientCategory category;
  bool isFavorite;
  DateTime? startAt;
  DateTime? endAt;

  Ingredient({
    this.id,
    required this.name,
    required this.category,
    required this.isFreezed,
    this.isFavorite = false,
    this.startAt,
    this.endAt,
  }) {
    final now = DateTime.now();
    final currTime = DateTime(now.year, now.month, now.day);
    startAt = currTime;
    endAt = currTime;
  }

  /// 재료 이미지 getter
  IngredientImage get image {
    return IngredientImage(isFreezed: isFreezed, path: category.imagePath);
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json["id"],
      name: json["name"],
      isFreezed: json["isFreezed"],
      isFavorite: json["isFavorite"],
      category: IngredientCategory.fromString(json["category"]),
      startAt: DateTime.parse(json["startAt"]),
      endAt: DateTime.parse(json["endAt"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isFreezed": isFreezed,
        "isFavorite": isFavorite,
        "category": category.name,
        "startAt": startAt,
        "endAt": endAt,
      };

  void updateIsFavorite() {
    isFavorite = !isFavorite;
  }

  void updateStartAt(DateTime newStartAt) {
    startAt = newStartAt;
  }

  void updateEndAt(DateTime newEndAt) {
    endAt = newEndAt;
  }
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
