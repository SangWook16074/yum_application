import 'package:flutter/material.dart';
import 'package:yum_application/src/common/widgets/image_widget.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

// Challenge Storage ( 보관함 )
// 챌린지 달성 시 보상 화면.

class ChallengeCompletedFood extends StatelessWidget {
  final String title;
  final String imagePath;
  final String label;

  const ChallengeCompletedFood({
    required this.title,
    required this.imagePath,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 위젯을 3개로 나누어 구성.
          _header(context), // 가장 상단 텍스트를 구성.
          _body(context), // 이미지와 그 밑 텍스트를 구성.
          _bottom(), // 버튼을 구성.
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "🥳레시피 등록 마스터🎉",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 60),
            child: Text(
              title, // 이미지에 맞는 텍스트를 명시.
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            // 이미지의 크기를 지정.
            width: 240,
            height: 190,
            child: ImageWidget(path: imagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 60),
            child: Column(
              // 이미지 밑 텍스트를 구성.
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "보관함에서 카드를 확인해보세요!",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottom() {
    return SizedBox(
      width: double.infinity,
      child: SingleButton(text: "보관함 가기", onTap: () {}),
    );
  }
}
