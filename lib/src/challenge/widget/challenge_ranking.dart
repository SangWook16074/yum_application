import 'package:flutter/material.dart';

class ChallengeRanking extends StatelessWidget {
  const ChallengeRanking({super.key});

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

Widget _body() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _mcontainer(),
      _mcontainer(),
      _mcontainer(),
    ],
  );
}

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

Widget _mcontainer() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 100,
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
