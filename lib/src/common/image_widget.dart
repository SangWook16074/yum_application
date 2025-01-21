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
}
