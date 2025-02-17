import 'package:flutter/material.dart';

class ChallengeRewardCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String rewardTitle;
  final String imagePath;

  const ChallengeRewardCard({
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.rewardTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _body(context),
        _bottom(context),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            height: 344,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(0, 255, 255, 255),
                    Color(0xffFFB300),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(rewardTitle,
                    style: Theme.of(context).textTheme.titleMedium),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 28,
                        child: Image.asset("assets/images/download.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.52),
                      child: GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          height: 28,
                          child: Image.asset("assets/images/sharing.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottom(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
