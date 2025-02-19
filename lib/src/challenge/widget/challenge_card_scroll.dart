import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/challenge_reward_card.dart';
import 'package:yum_application/src/common/widgets/image_widget.dart';

// Challenge Storage ( 보관함 )
// 나의 챌린지 부분 Challenge Reward Card를 보여주는 Scroll의 기능을 구성해줌.

class ChallengeCardScroll extends StatefulWidget {
  const ChallengeCardScroll({super.key});

  @override
  _ChallengeCardScrollState createState() => _ChallengeCardScrollState();
}

class _ChallengeCardScrollState extends State<ChallengeCardScroll> {
  final PageController _pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 0,
  );

  double _currentPage = 0.0;

  final List<Widget> _cards = [
    ChallengeRewardCard(
      title: '부대찌개 완성🔥',
      subTitle: '레시피북을 만들어도 되겠어요!',
      rewardTitle: '레시피 등록 100회',
      imagePath: ChallengeImagePath.spicyStew,
    ),
    ChallengeRewardCard(
      title: '연어 샌드위치 완성🔥',
      subTitle: '꼼꼼한 리뷰로 레시피 퀄리티 Up!',
      rewardTitle: '레시피 등록 100회',
      imagePath: ChallengeImagePath.salmonSalad,
    ),
    ChallengeRewardCard(
      title: '계란 볶음밥 완성🔥',
      subTitle: '레시피북을 만들어도 되겠어요!',
      rewardTitle: '레시피 등록 100회',
      imagePath: ChallengeImagePath.eggRice,
    ),
    ChallengeRewardCard(
      title: '새우 토마토 파스타 완성🔥',
      subTitle: '레시피북을 만들어도 되겠어요!',
      rewardTitle: '레시피 등록 100회',
      imagePath: ChallengeImagePath.tomatoPasta,
    ),
    ChallengeRewardCard(
      title: '수제 햄버거 완성🔥',
      subTitle: '레시피북을 만들어도 되겠어요!',
      rewardTitle: '레시피 등록 100회',
      imagePath: ChallengeImagePath.hambuger,
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
            itemCount: 5,
            itemBuilder: (context, index) {
              int cardIndex = index % _cards.length;
              // 중앙에 있는 Reward Card는 더 커지도록 설정.
              double scale =
                  (1 - ((_currentPage - index).abs() * 0.3)).clamp(0.8, 1.0);

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

extension ChallengeImagePath on ImagePath {
  static String get spicyStew => 'assets/images/spicy_sausage_stew.png';
  static String get salmonSalad => 'assets/images/salmon_salad.png';
  static String get eggRice => 'assets/images/egg_fried_rice.png';
  static String get tomatoPasta => 'assets/images/tomato_pasta.png';
  static String get hambuger => 'assets/images/handmade_hamburger.png';
}
