import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGImageWidget extends StatelessWidget {
  final String path;
  const SVGImageWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 20, height: 20, child: SvgPicture.asset(path));
  }
}
