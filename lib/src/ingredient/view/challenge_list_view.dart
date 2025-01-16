import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/challenge_list.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

class ChallengeListView extends StatefulWidget {
  const ChallengeListView({super.key});

  @override
  State<ChallengeListView> createState() => _ChallengeListViewState();
}

class _ChallengeListViewState extends State<ChallengeListView> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            _body(),
          ],
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) => SizedBox(
      key: const Key("Challenge Header"),
      width: double.infinity,
      child: Padding(
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
      ),
    );

Widget _body() {
  return const Column(
    key: Key("Challenge Body"),
    children: [
      ChallengeList(
          key: Key("Recipe registration"),
          title: "레시피 등록",
          subtitle: '챌린지를 시작해주세요.',
          imagePath: "assets/images/recipe.png"),
      ChallengeList(
          key: Key("Recipe Review"),
          title: "레시피 리뷰 작성",
          subtitle: '000님 외 142명이 도전 중',
          imagePath: "assets/images/chef.png"),
      ChallengeList(
          key: Key("Recipe recommendation"),
          title: "레시피 추천",
          subtitle: '챌린지를 시작해주세요.',
          imagePath: "assets/images/like.png"),
      ChallengeList(
          key: Key("Number of recipe uses"),
          title: "레시피 사용 횟수",
          subtitle: '000님 외 142명이 도전 중',
          imagePath: "assets/images/wok.png"),
      ChallengeList(
          key: Key("Number of consecutive recipe uses"),
          title: "레시피 연속 사용 횟수",
          subtitle: '000님 외 142명이 도전 중',
          imagePath: "assets/images/group.png"),
    ],
  );
}
