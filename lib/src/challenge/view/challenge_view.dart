import 'package:flutter/material.dart';
import 'package:yum_application/src/challenge/widget/challenge_list.dart';
import 'package:yum_application/src/challenge/widget/challenge_storage_box.dart';

class ChallengeView extends StatefulWidget {
  const ChallengeView({super.key});

  @override
  _ChallengeViewState createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  // DefaultTabController의 탭 인덱스를 관리
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['도전하기', '보관함'];

    return DefaultTabController(
      length: tabs.length,
      initialIndex: _currentTabIndex, // 초기 탭 설정
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    '챌린지',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  pinned: true,
                  elevation: 0,
                  expandedHeight: 180.0,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 130, left: 20, right: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // 현재 탭에 맞는 텍스트를 동적으로 표시
                              Text(
                                _currentTabIndex == 0
                                    ? "단계마다 비밀 식재료를 획득해요\n식재료를 모아 요리를 완성해보세요"
                                    : "완료한 도전을 여기에서 확인하세요!",
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
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: AppBar().preferredSize,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          Divider(
                            height: 0.5,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                          Container(
                            color: Colors.white,
                            child: TabBar(
                              indicator: const BoxDecoration(),
                              labelStyle:
                                  Theme.of(context).textTheme.headlineSmall,
                              unselectedLabelStyle:
                                  Theme.of(context).textTheme.labelLarge,
                              onTap: (index) {
                                // 탭이 변경될 때마다 텍스트 갱신
                                setState(() {
                                  _currentTabIndex = index;
                                });
                              },
                              tabs: tabs
                                  .map((String name) => Tab(text: name))
                                  .toList(),
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
                                ? _challenges() // 도전하기 탭
                                : _challengesStorageView(), // 보관함 탭
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

  Widget _challenges() => const ChallengeList();

  Widget _challengesStorageView() => const ChallengeStorageBox();
}
