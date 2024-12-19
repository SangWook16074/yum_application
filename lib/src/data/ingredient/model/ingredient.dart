import 'package:intl/intl.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_image.dart';

class Ingredient {
  final int? id;
  final String name;
  bool isFreezed;
  final IngredientCategory category;
  bool isFavorite;
  DateTime startAt;
  DateTime endAt;

  Ingredient({
    this.id,
    required this.name,
    required this.category,
    required this.isFreezed,
    this.isFavorite = false,
    DateTime? startAt,
    DateTime? endAt,
  })  : startAt = startAt ?? DateTime.now(),
        endAt = endAt ?? DateTime.now();

  Ingredient copyWith({
    int? id,
    String? name,
    bool? isFreezed,
    IngredientCategory? cateorty,
    bool? isFavorrite,
    DateTime? startAt,
    DateTime? endAt,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      isFreezed: isFreezed ?? this.isFreezed,
      category: category ?? category,
      isFavorite: isFavorite ?? isFavorite,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
    );
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
        "name": name,
        "isFreezed": isFreezed,
        "isFavorite": isFavorite,
        "category": category.name,
        "startAt": DateFormat("yyyy-MM-dd").format(startAt),
        "endAt": DateFormat("yyyy-MM-dd").format(endAt),
      };
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
