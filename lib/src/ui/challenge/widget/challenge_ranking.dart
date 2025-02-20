import 'package:flutter/material.dart';

class ChallengeRanking extends StatelessWidget {
  const ChallengeRanking({super.key});

// Challenge Storage ( 보관함 )
// 사용자들의 순위를 확인시켜준다.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _header(),
          _body(),
          _bottom(),
        ],
      ),
    );
  }
}

// title 부분과 전체보기 텍스트 버튼 생성.
Widget _header() {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "강은주 123님의 순위는?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "전체보기",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        );
      }),
    ),
  );
}

// 사용자의 순위를 최대 3명까지 랜더링.
// 가로로 배치된 3개의 컨테이너.
Widget _body() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Flexible(
        fit: FlexFit.tight,
        // 임시로 생성한 데이터.
        child: _rankingContainer(),
      ),
      Flexible(
        fit: FlexFit.tight,
        child: _rankingContainer(),
      ),
      Flexible(
        fit: FlexFit.tight,
        child: _rankingContainer(),
      ),
    ],
  );
}

// 사용자의 순위를 최대 3명까지 랜더링.
// 하나의 컨테이너
Widget _bottom() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Builder(builder: (context) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              _rank(),
              _rank(),
              _rank(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "강은주123 님은 자취얌 사용자 중 상위 32%이에요!",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}

// 3개의 컨테이너 안에 들어가는 데이터.
Widget _rankingContainer() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.circle,
              size: 60,
            ),
            Text(
              "data1",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "data",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  });
}

// 하나의 컨테이너 안에 들어가는 사용자의 정보와 최대 3명의 데이터.
Widget _rank() {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "46",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 10, right: 8),
              child: Icon(Icons.circle)),
          Text(
            "data",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      );
    }),
  );
}
