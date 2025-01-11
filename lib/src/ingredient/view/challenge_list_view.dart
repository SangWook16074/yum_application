import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/challenge_list.dart';

class ChallengeListView extends StatefulWidget {
  const ChallengeListView({super.key});

  @override
  State<ChallengeListView> createState() => _ChallengeListViewState();
}

class _ChallengeListViewState extends State<ChallengeListView> {
  final List<Map<String, String>> challenges = [
    {
      "title": "레시피 등록 도전!",
      "subtitle": "챌린지를 시작해주세요.",
      "image": "assets/images/recipe.png"
    },
    {
      "title": "레시피 리뷰 작성 도전!",
      "subtitle": "000님 외 142명이 도전 중",
      "image": "assets/images/chef.png"
    },
    {
      "title": "레시피 추천 도전!",
      "subtitle": "챌린지를 시작해주세요.",
      "image": "assets/images/like.png"
    },
    {
      "title": "레시피 사용 횟수 도전!",
      "subtitle": "000님 외 142명이 도전 중",
      "image": "assets/images/wok.png"
    },
    {
      "title": "레시피 연속 사용 횟수 도전!",
      "subtitle": "000님 외 142명이 도전 중",
      "image": "assets/images/group.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Provider.of<IngredientViewModelImpl>(context, listen: false)
                    .cancel();
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
              ),
            );
          },
        ),
        elevation: 0.0,
        title: Text(
          "챌린지",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: ListView(
        children: [
          _header(context),
          ...challenges.map((challenge) {
            return ChallengeList(
              title: challenge["title"]!,
              subtitle: challenge["subtitle"]!,
              imagePath: challenge["image"]!,
              isRecommended: challenge["title"] == "레시피 등록 도전!" ||
                  challenge["title"] == "레시피 추천 도전!",
            );
          }),
        ],
      ),
    );
  }
}

Widget _header(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Column(
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
      ),
    );
