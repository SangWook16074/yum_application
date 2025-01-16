import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

class ChallengeDetailView extends StatelessWidget {
  const ChallengeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
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
            _body(context),
            _bottom(),
            SingleButton(
              text: "레시피 등록하러 가기",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 138,
            child: Image.asset("assets/images/wok.png"),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 27, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "레시피 사용 횟수 도전!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text("레시피 사용 횟수 챌린지의 히든 요리는 무엇일까요?",
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget _body(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        width: double.infinity,
        height: 171,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "3단계 도전중",
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    );

Widget _bottom() => Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 32),
      child: Builder(builder: (context) {
        return Container(
          width: double.infinity,
          height: 171,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "레시피 리뷰 작성 발자취",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        );
      }),
    );
