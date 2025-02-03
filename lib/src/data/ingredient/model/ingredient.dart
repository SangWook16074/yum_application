import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:yum_application/src/data/ingredient/model/basic_ingredient.dart';

class Ingredient extends Equatable {
  final int? id;
  final String name;
  final bool isFreezed;
  final IngredientCategory category;
  final DateTime startAt;
  final DateTime endAt;

  Ingredient({
    this.id,
    required this.name,
    required this.category,
    required this.isFreezed,
    DateTime? startAt,
    DateTime? endAt,
  })  : startAt = startAt ?? DateTime.now(),
        endAt = endAt ?? DateTime.now();

  bool get isWarning {
    final now = DateTime.now();
    final th = DateTime(now.year, now.month, now.day);
    final diff = endAt.difference(th).inDays;
    if (diff <= 3) {
      return true;
    } else {
      return false;
    }
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json["id"],
      name: json["name"],
      isFreezed: json["isFreezed"],
      category: IngredientCategory.fromString(json["category"]),
      startAt: DateTime.parse(json["startAt"]),
      endAt: DateTime.parse(json["endAt"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isFreezed": isFreezed,
        "category": category.name,
        "startAt": DateFormat("yyyy-MM-dd").format(startAt),
        "endAt": DateFormat("yyyy-MM-dd").format(endAt),
      };

  Ingredient copy({
    String? name,
    bool? isFreezed,
    IngredientCategory? category,
    DateTime? startAt,
    DateTime? endAt,
  }) {
    return Ingredient(
      id: id,
      name: name ?? this.name,
      category: category ?? this.category,
      isFreezed: isFreezed ?? this.isFreezed,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        isFreezed,
        startAt,
        endAt,
      ];
}
