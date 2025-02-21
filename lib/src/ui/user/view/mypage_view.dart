import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/user/view/my_info_view.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _header(),
          const SizedBox(
            height: 40,
          ),
          _myInfo(),
        ],
      )),
    );
  }

  /// 헤더 영억
  ///
  /// 마이 페이지 label을 렌더링 하는 헤더 영역입니다.
  Widget _header() => Padding(
        key: const Key("header"),
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
        child: Builder(builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "마이 페이지",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          );
        }),
      );

  /// 내 정보를 요약해서 보여주는 myinfoview입니다.
  Widget _myInfo() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: MyInfoView(),
      );
}
