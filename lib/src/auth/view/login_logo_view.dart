import 'package:flutter/material.dart';
import 'package:yum_application/src/common/widgets/image_widget.dart';

class LoginLogoView extends StatelessWidget {
  const LoginLogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageWidget(
          path: LogoIconPath.logo,
          width: 200,
        ),
        const SizedBox(
          height: 21,
        ),
        Text(
          "냉장고를 스마트하게, 자취를 맛있게",
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}

extension LogoIconPath on ImagePath {
  static String get logo => "assets/images/app_ic.png";
}
