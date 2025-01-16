import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/common/image_widget.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/challege/widget/challenge_list.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

class ChallengeListView extends StatelessWidget {
  const ChallengeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        elevation: 0.0,
        title: Text(
          "챌린지",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _challenges(),
          ],
        ),
      ),
    );
  }
}

Widget _header() => SizedBox(
      key: const Key("Challenge Header"),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20),
        child: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 8),
                child: Text(
                  "챌린지 도전하기",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Text(
                "챌린지에 도전하여 단계마다 식재료를 획득해요.",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                "획득한 식재료를 모아 요리를 완성해보세요!",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          );
        }),
      ),
    );

Widget _challenges() {
  return Column(
    key: const Key("Challenge Body"),
    children: [
      ChallengeList(
        key: const Key("Recipe registration"),
        title: "레시피 등록",
        subtitle: '챌린지를 시작해주세요.',
        imagePath: ImagePath.recipeResister,
      ),
      ChallengeList(
        key: const Key("Recipe Review"),
        title: "레시피 리뷰 작성",
        subtitle: '000님 외 142명이 도전 중',
        imagePath: ImagePath.recipeReview,
      ),
      ChallengeList(
        key: const Key("Recipe recommendation"),
        title: "레시피 추천",
        subtitle: '챌린지를 시작해주세요.',
        imagePath: ImagePath.recipeRecommendation,
      ),
      ChallengeList(
        key: const Key("Number of recipe uses"),
        title: "레시피 사용 횟수",
        subtitle: '000님 외 142명이 도전 중',
        imagePath: ImagePath.recipeUses,
      ),
      ChallengeList(
        key: const Key("Number of consecutive recipe uses"),
        title: "레시피 연속 사용 횟수",
        subtitle: '000님 외 142명이 도전 중',
        imagePath: ImagePath.consecutiveUses,
      ),
    ],
  );
}
