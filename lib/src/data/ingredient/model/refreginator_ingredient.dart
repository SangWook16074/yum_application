import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:yum_application/src/data/ingredient/model/initial_ingredient.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';

final class RefreginatorIngredient extends Ingredient with EquatableMixin {
  /// [RefreginatorIngredient]의 식별자입니다.
  ///
  /// id는 사용자가 생성하는 경우에만 null이며,
  /// 서버로부터 불러온 재료는 모두 null이 될 수 없습니다.
  final int? id;

  /// [RefreginatorIngredient]의 재료의 냉동 여부입니다.
  ///
  /// true 또는 false가 지정됩니다.
  final bool isFreezed;

  /// [RefreginatorIngredient]의 카테고리입니다.
  ///
  /// 카테고리를 통해서 asset 이미지 파일을 찾을 수 있습니다.
  final IngredientCategory category;

  /// [RefreginatorIngredient]의 제조일입니다.
  ///
  /// 기본값으로 오늘날짜가 지정됩니다.
  final DateTime startAt;

  /// [RefreginatorIngredient]의 유통기한입니다.
  ///
  /// 기본값으로 오늘날짜가 지정됩니다.
  final DateTime endAt;

  /// [RefreginatorIngredient]의 기본 생성자입니다.
  ///
  /// 재료 생성 중에 사용되는 생성자입니다.
  RefreginatorIngredient({
    this.id,
    required super.name,
    required this.category,
    required this.isFreezed,
    DateTime? startAt,
    DateTime? endAt,
  })  : startAt = startAt ?? DateTime.now(),
        endAt = endAt ?? DateTime.now();

  /// [Ingredient]의 유통기한 임박 관련 bool getter입니다.
  ///
  /// 유통기한이 3일 이하로 남은 경우에는 true가 반환됩니다.
  /// 그렇지 않은 경우에는 false가 반환됩니다.
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

  /// [Ingredient]의 Deserializes 메소드입니다.
  ///
  /// JSON 데이터를 [Ingredient]로 역직렬화합니다.
  factory RefreginatorIngredient.fromJson(Map<String, dynamic> json) {
    return RefreginatorIngredient(
      id: json["id"],
      name: json["name"],
      isFreezed: json["isFreezed"],
      category: IngredientCategory.fromString(json["category"]),
      startAt: DateTime.parse(json["startAt"]),
      endAt: DateTime.parse(json["endAt"]),
    );
  }

  /// [Ingredient]의 serializes 메소드입니다.
  /// JSON 데이터로 직렬화를 수행합니다.
  ///
  /// 재료의 id 필드가 지정되지 않은 경우에는 재료가 새롭게 create되며,
  /// id가 존재하는 경우에는 update됩니다.
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isFreezed": isFreezed,
        "category": category.name,
        "startAt": DateFormat("yyyy-MM-dd").format(startAt),
        "endAt": DateFormat("yyyy-MM-dd").format(endAt),
      };

  /// [Ingredient]의 copy를 반환하는 메소드입니다.
  ///
  /// 전달되는 값만을 갱신합니다.
  RefreginatorIngredient copy({
    String? name,
    bool? isFreezed,
    IngredientCategory? category,
    DateTime? startAt,
    DateTime? endAt,
  }) {
    return RefreginatorIngredient(
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
