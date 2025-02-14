import 'package:flutter/material.dart';
import 'package:yum_application/src/user/widgets/profile_option_button.dart';
import 'package:yum_application/src/user/widgets/user_info_edit_button.dart';

class MyInfoView extends StatelessWidget {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _header(),
          _profile(),
          const SizedBox(
            height: 40,
          ),
          _options(),
        ],
      ),
    );
  }

  /// 나의 정보를 나타내는 헤더 영역
  ///
  /// 나의 정보 label과 내 정보 수정 버튼이 존재함.
  Widget _header() => Row(
        key: const Key("my-info-box-header"),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(builder: (context) {
            return Text(
              "나의 정보",
              style: Theme.of(context).textTheme.headlineMedium,
            );
          }),
          const Spacer(),
          UserInfoEditButton(onTap: () {})
        ],
      );

  Widget _profile() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 60,
            height: 60,
            child: CircleAvatar(),
          ),
          const SizedBox(
            height: 8,
          ),
          Builder(builder: (context) {
            return Text(
              "강은지123님",
              style: Theme.of(context).textTheme.headlineLarge,
            );
          })
        ],
      );

  Widget _options() => const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileOptionButton(
              key: Key("my-info-view-recipe-button"), label: "레시피", count: 3),
          ProfileOptionButton(
              key: Key("my-info-view-review-button"), label: "리뷰", count: 3),
          ProfileOptionButton(
              key: Key("my-info-view-like-button"), label: "좋아요", count: 3),
        ],
      );
}
