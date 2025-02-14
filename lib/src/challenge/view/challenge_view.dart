import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/challenge_storage_box.dart';
import 'package:yum_application/src/challenge/widget/challenge_list.dart';

class ChallengeView extends StatelessWidget {
  const ChallengeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['도전하기', '보관함'];
    return DefaultTabController(
      key: const Key("app view challenge view"),
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  title: Text(
                    '챌린지',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  pinned: true,
                  elevation: 0,
                  expandedHeight: 180.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    labelStyle: Theme.of(context).textTheme.headlineSmall,
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "단계마다 비밀 식재료를 획득해요\n식재료를 모아 요리를 완성해보세요",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Image.asset(
                              "assets/images/trophy.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          sliver: SliverToBoxAdapter(
                            child: name == '도전하기'
                                ? const ChallengeList() // 도전하기 탭에서만 ChallengeListView
                                : const ChallengeStorageBox(), // 보관함 탭에서만 ChallengeCompletedView
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
