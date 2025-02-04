import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String path;
  final double width;
  const ImageWidget({super.key, required this.path, this.width = 110});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width / MediaQuery.of(context).devicePixelRatio,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ));
  }
}

class ImagePath {
  static String get fab => "/assets/images/floating.png";
  static String get recipeOff => "assets/images/bottom_nav_recipe_off.png";
  static String get recipeOn => "assets/images/bottom_nav_recipe_on.png";
  static String get ingredientOff =>
      "assets/images/bottom_nav_ingredient_off.png";
  static String get ingredientOn =>
      "assets/images/bottom_nav_ingredient_on.png";
  static String get challengeOff =>
      "assets/images/bottom_nav_challenge_off.png";
  static String get challengeOn => "assets/images/bottom_nav_challenge_on.png";
  static String get mypageOff => "assets/images/bottom_nav_mypage_off.png";
  static String get mypageOn => "assets/images/bottom_nav_mypage_on.png";
  static String get recipeResister => "assets/images/recipe.png";
  static String get recipeReview => "assets/images/chef.png";
  static String get recipeRecommendation => "assets/images/like.png";
  static String get recipeUses => "assets/images/wok.png";
  static String get consecutiveUses => "assets/images/group.png";
}
