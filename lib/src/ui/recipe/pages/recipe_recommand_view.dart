import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/widget/primary_theme_button.dart';

class RecipeRecommandView extends StatefulWidget {
  const RecipeRecommandView({super.key});

  @override
  State<RecipeRecommandView> createState() => _RecipeStartPageState();
}

class _RecipeStartPageState extends State<RecipeRecommandView> {
  int remainingCount = 3;

  void _decreaseCount() {
    if (remainingCount > 0) {
      setState(() {
        remainingCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "레시피 추천",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "$remainingCount 회 남음",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "AI 가 추천해드려요!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "냉장고 재료를 기반으로 맞춤 레시피를 생성합니다",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryThemeButton(
                    text: "새 레시피 추천받기",
                    width: double.infinity,
                    onPressed: _decreaseCount),
              )
            ],
          ),
        ));
  }
}
