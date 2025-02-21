/// 모든 Ingredient 유형은 부모로 [Ingredient]를 상속받습니다.
///
/// 최 상단의 부모 클래스로서, 코드의 재사용을 위해서 사용됩니다.
abstract base class Ingredient {
  final String name;

  Ingredient({required this.name});
}
