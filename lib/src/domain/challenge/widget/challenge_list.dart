import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/challenge_row.dart';
import 'package:yum_application/src/domain/challenge/widget/challenge_detail_view.dart';
import 'package:yum_application/src/common/widgets/image_widget.dart';

class ChallengeList extends StatelessWidget {
  const ChallengeList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRecipeFirst = true;
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }
}
