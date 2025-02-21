import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';

// Challenge List ( 도전하기 )
// Challenge List를 구성해주는 위젯.
// 최초 여부도 판단해줌.

class ChallengeRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final void Function() onTap;

  // 추후에 확인을 위한 로직 작성이 필요함.
  final bool isFirst;

  const ChallengeRow({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
    this.isFirst = false, // True이면 앞에 '최초' 컨테이너가 생성.
    super.key,
  });

// 이미지와 title, subtitle, isFrist의 여부를 입력받아 하나의 Challenge Row를 생성.
// 도전하기에는 5개의 Challenge Row가 존재.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 80,
                height: 78.08,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SizedBox(
                      width: 68,
                      height: 68,
                      child: ImageWidget(path: imagePath)),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 35),
                    child: Row(
                      children: [
                        if (isFirst)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 9),
                                child: Text("최초",
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Text(title,
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            onPressed: onTap,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              size: 24,
                            ),
                            padding: EdgeInsets.zero,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(subtitle,
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
