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
  static String get recipeResister => "assets/images/recipe.png";
  static String get recipeReview => "assets/images/chef.png";
  static String get recipeRecommendation => "assets/images/like.png";
  static String get recipeUses => "assets/images/wok.png";
  static String get consecutiveUses => "assets/images/group.png";
}
