import 'package:flutter/material.dart';
import 'package:yum_application/src/auth/view/login_button_view.dart';
import 'package:yum_application/src/auth/view/login_logo_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고 뷰
            _logoView(),
            const SizedBox(
              height: 100,
            ),
            // 로그인 버튼 뷰
            _loginButtonView(),
            const SizedBox(
              height: 20,
            ),
            // 회원가입 뷰
            _resister(),
          ],
        ),
      ),
    );
  }

  /// 로그인 로고 뷰입니다.
  Widget _logoView() => const LoginLogoView();

  /// 각 로그인 버튼을 담당하는 로그인 버튼뷰입니다.
  ///
  /// google, apple, kakao, email 로그인 버튼을 지정합니다.
  Widget _loginButtonView() => const LoginButtonView();

  Widget _resister() => SizedBox(
        width: 350,
        child: Builder(builder: (context) {
          final textTheme = Theme.of(context).textTheme.labelSmall;
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("자취얌이 처음이신가요?", style: textTheme),
              GestureDetector(
                /// 사용자가 위젯을 탭하면
                /// 회원가입 UI로 이동합니다.
                onTap: () {},
                child: Text(
                  "회원 가입",
                  style: textTheme,
                ),
              )
            ],
          );
        }),
      );
}
