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
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Container(
            width: 330,
            height: 170,
            decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    "최대 4 장",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_library_rounded,
                            size: 20, color: Color(0xffA2A2A2)),
                        Text(
                          "사진 추가하기",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20), // Padding 추가
              child: Text(
                "본문 내용을 작성해 주세요.",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
