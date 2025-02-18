import 'package:flutter/material.dart';

// Challenge Storage ( 보관함 )
// Challenge Calendar 밑에 예시 부분을 담당함.
// 예시부분에 색이 다른 컨테이너를 생성할때 사용되는 위젯.

class StackContainer extends StatelessWidget {
  final String title;
  final Color color;
  final double opacity;

// 각 컨테이너의 색상과 투명도, title이 다르기 때문에 명시해줌.
  const StackContainer({
    super.key,
    required this.title,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Opacity(
            opacity: opacity,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
