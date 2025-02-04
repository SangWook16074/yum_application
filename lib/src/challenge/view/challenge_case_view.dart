import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/challenge/widget/challenge_detail_view.dart';
import 'package:yum_application/src/common/image_widget.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/challenge/widget/challenge_row.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

class ChallengeCaseView extends StatelessWidget {
  const ChallengeCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: Container(
          color: Theme.of(context).colorScheme.tertiary,
          child: CustomScrollView(
            slivers: [
              _header(),
            ],
          ),
        ));
  }
}

PreferredSizeWidget _appBar() {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: Builder(builder: (context) {
      return AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        elevation: 0.0,
        title: Text(
          "챌린지 도전",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      );
    }),
  );
}

Widget _header() {
  return SliverAppBar(
    toolbarHeight: 140,
    floating: true,
    pinned: false,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    // expandedHeight: 300,
    title: Column(
      children: [
        Builder(
          builder: (context) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "단계마다 비밀 식재료를 획득해요\n식재료를 모아 요리를 완성해보세요",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Image.asset(
                        "assets/images/trophy.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("도전하기"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("보관함"),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _challenges() {
  return SliverToBoxAdapter(
    child: Builder(builder: (context) {
      bool isRecipeFirst = true;
      return Column(
        key: const Key("Challenge Body"),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, top: 40),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "챌린지 리스트",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          ChallengeRow(
            key: const Key("Recipe registration"),
            title: "레시피 등록",
            subtitle: '챌린지를 시작해주세요.',
            imagePath: ImagePath.recipeResister,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChallengeDetailView(
                    imagePath: ImagePath.recipeResister,
                  ),
                ),
              );
            },
            isFirst: isRecipeFirst,
          ),
          ChallengeRow(
            key: const Key("Recipe Review"),
            title: "레시피 리뷰 작성",
            subtitle: '000님 외 142명이 도전 중',
            imagePath: ImagePath.recipeReview,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChallengeDetailView(
                    imagePath: ImagePath.recipeReview,
                  ),
                ),
              );
            },
          ),
          ChallengeRow(
            key: const Key("Recipe recommendation"),
            title: "레시피 추천",
            subtitle: '챌린지를 시작해주세요.',
            imagePath: ImagePath.recipeRecommendation,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChallengeDetailView(
                    imagePath: ImagePath.recipeRecommendation,
                  ),
                ),
              );
            },
            isFirst: isRecipeFirst,
          ),
          ChallengeRow(
            key: const Key("Number of recipe uses"),
            title: "레시피 사용 횟수",
            subtitle: '000님 외 142명이 도전 중',
            imagePath: ImagePath.recipeUses,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChallengeDetailView(
                    imagePath: ImagePath.recipeUses,
                  ),
                ),
              );
            },
          ),
          ChallengeRow(
            key: const Key("Number of consecutive recipe uses"),
            title: "레시피 연속 사용 횟수",
            subtitle: '000님 외 142명이 도전 중',
            imagePath: ImagePath.consecutiveUses,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChallengeDetailView(
                    imagePath: ImagePath.consecutiveUses,
                  ),
                ),
              );
            },
          ),
        ],
      );
    }),
  );
}
