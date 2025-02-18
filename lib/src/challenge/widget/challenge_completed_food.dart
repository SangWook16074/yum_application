import 'package:flutter/material.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

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
          _header(context),
          _body(context),
          _bottom(),
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
              title,
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
            width: 240,
            height: 190,
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 60),
            child: Column(
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
