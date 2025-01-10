import 'package:flutter/material.dart';

class ChallengeList extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isRecommended;

  const ChallengeList({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.isRecommended = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
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
                child: Image.asset(
                  imagePath,
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
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
                        if (isRecommended)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "최초",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              size: 20,
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
                    child: Text(
                      subtitle,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
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
