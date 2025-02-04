import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/common/image_widget.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';

class ChallengeDetailView extends StatelessWidget {
  final String imagePath;

  const ChallengeDetailView({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Container(
        color: Theme.of(context).colorScheme.tertiary,
        child: CustomScrollView(
          slivers: [
            _header(imagePath),
            _body(),
            _bottom(),
            _button(),
          ],
        ),
      ),
    );
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
          "챌린지 상세",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      );
    }),
  );
}

Widget _header(String imagePath) => Builder(builder: (context) {
      return SliverAppBar(
        toolbarHeight: 220,
        floating: false,
        pinned: false,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        flexibleSpace: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 138,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: ImageWidget(path: imagePath),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 18),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              "레시피 사용 횟수 도전!",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          Text(
                            "레시피 사용 횟수 챌린지의 히든 요리는 무엇일까요?",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });

Widget _body() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Builder(builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3단계 도전중",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "3개 달성! 다음 단계까지 2개 남았어요",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 20, bottom: 41),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    ),
  );
}

Widget _bottom() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Builder(builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "레시피 리뷰 작성 발자취",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(12),
                    child: ImageWidget(path: "assets/images/reward.png"),
                  );
                },
              ),
            ],
          ),
        );
      }),
    ),
  );
}

Widget _button() {
  return SliverToBoxAdapter(
    child: Builder(builder: (context) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "챌린지를 완료하고 싶나요?",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SingleButton(
              text: "레시피 등록하러 가기",
              onTap: () {},
            ),
          ),
        ],
      );
    }),
  );
}
