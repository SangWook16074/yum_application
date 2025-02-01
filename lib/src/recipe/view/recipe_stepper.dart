import 'package:flutter/material.dart';

class RecipeStepper extends StatelessWidget {
  final int sequence;
  const RecipeStepper({
    super.key,
    required this.sequence,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      width: 390,
      height: 290,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Step $sequence",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Container(
            width: 330,
            height: 170,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(
                      "최대 4 장",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                Positioned(
                  top: 1,
                  bottom: 1,
                  right: 1,
                  left: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/gallery.png',
                          color: Color(0xffA2A2A2)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "사진 추가하기",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "본문 내용을 작성해 주세요.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
