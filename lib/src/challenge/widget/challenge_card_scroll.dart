import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/challenge_reward_card.dart';

class ChallengeCardScroll extends StatefulWidget {
  const ChallengeCardScroll({super.key});

  @override
  _ChallengeCardScrollState createState() => _ChallengeCardScrollState();
}

class _ChallengeCardScrollState extends State<ChallengeCardScroll> {
  final PageController _pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 1,
  );
  double _currentPage = 1.0;

  final List<Widget> _cards = [
    const ChallengeRewardCard(
      title: '부대찌개 완성🔥',
      subTitle: '레시피북을 만들어도 되겠어요!',
      rewardTitle: '레시피 등록 100회',
      imagePath: 'assets/images/spicy_sausage_stew.png',
    ),
    const ChallengeRewardCard(
      title: '연어 샌드위치 완성🔥',
      subTitle: '꼼꼼한 리뷰로 레시피 퀄리티 Up!',
      rewardTitle: '레시피 등록 100회',
      imagePath: 'assets/images/salmon_salad.png',
    ),
    const ChallengeRewardCard(
      title: '계란 볶음밥 완성🔥',
      subTitle: '레시피북을 만들어도 되겠어요!',
      rewardTitle: '레시피 등록 100회',
      imagePath: 'assets/images/egg_fried_rice.png',
    ),
    const ChallengeRewardCard(
      title: '새우 토마토 파스타 완성🔥',
      subTitle: '레시피북을 만들어도 되겠어요!',
      rewardTitle: '레시피 등록 100회',
      imagePath: 'assets/images/tomato_pasta.png',
    ),
    const ChallengeRewardCard(
      title: '수제 햄버거 완성🔥',
      subTitle: '레시피북을 만들어도 되겠어요!',
      rewardTitle: '레시피 등록 100회',
      imagePath: 'assets/images/handmade_hamburger.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 40,
              bottom: 10,
            ),
            child: Text(
              "나의 챌린지 현황",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        SizedBox(
          height: 453,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: null,
            itemBuilder: (context, index) {
              double scale =
                  (1 - ((_currentPage - index).abs() * 0.2)).clamp(0.8, 1.0);

              int cardIndex = index % _cards.length;

              return Transform.scale(
                scale: scale,
                child: _cards[cardIndex],
              );
            },
          ),
        ),
      ],
    );
  }
}
