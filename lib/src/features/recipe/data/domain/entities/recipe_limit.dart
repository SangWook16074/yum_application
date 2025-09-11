class RecipeLimit {
  final int maxPerDay;
  final int remaining;

  const RecipeLimit({
    this.maxPerDay = 3,
    int? remaining,
  }) : remaining = remaining ?? maxPerDay;

  bool get canGenerate => remaining > 0;

  RecipeLimit decrease() {
    if (!canGenerate) {
      throw Exception("오늘 레시피 생성 횟수를 모두 사용했습니다.");
    }
    return RecipeLimit(
      maxPerDay: maxPerDay,
      remaining: remaining - 1,
    );
  }
}
