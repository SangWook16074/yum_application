import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/viewModel/login_view_model.dart';
import 'package:yum_application/src/ui/auth/widget/login_button.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';

/// 로그인 화면에서 다양한 로그인 버튼을 지정합니다.
class LoginButtonView extends StatelessWidget {
  const LoginButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 구글 로그인 버튼
        _googleLoginButton(),
        const SizedBox(
          height: 20,
        ),

        /// 애플 로그인 버튼
        _appleLoginButton(),
        const SizedBox(
          height: 20,
        ),

        /// 카카오 로그인 버튼
        _kakaoLoginButton(),
        const SizedBox(
          height: 20,
        ),

        /// 이메일 로그인 버튼
        _emailLoginButtion(),
      ],
    );
  }

  /// 구글 로그인 버튼
  ///
  /// 디자인 가이드가 변경될 수 있기에 직접 TextStyle을 지정하였습니다.
  Widget _googleLoginButton() => Builder(builder: (context) {
        final viewModel = Provider.of<LoginViewModel>(context);
        return LoginButton(
            onTap: viewModel.signIn,
            path: LoginImagePath.google,
            label: "Google로 로그인",
            backgroundColor: const Color(0xffF2F2F2),
            labelStyle: const TextStyle(
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.w500));
      });

  /// 애플 로그인 버튼
  ///
  /// 디자인 가이드가 변경될 수 있기에 직접 TextStyle을 지정하였습니다.
  Widget _appleLoginButton() => Builder(builder: (context) {
        final viewModel = Provider.of<LoginViewModel>(context);
        return LoginButton(
            onTap: viewModel.signIn,
            path: LoginImagePath.apple,
            label: "Apple로 로그인",
            backgroundColor: const Color(0xff000000),
            labelStyle: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 20,
                fontWeight: FontWeight.w500));
      });

  /// 카카오 로그인 버튼
  ///
  /// 디자인 가이드가 변경될 수 있기에 직접 TextStyle을 지정하였습니다.
  Widget _kakaoLoginButton() => Builder(builder: (context) {
        final viewModel = Provider.of<LoginViewModel>(context);

        return LoginButton(
            onTap: viewModel.signIn,
            path: LoginImagePath.kakao,
            label: "카카오로 로그인",
            backgroundColor: const Color(0xffFEE500),
            labelStyle: const TextStyle(
              color: Color(0xff000000),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ));
      });

  /// 자취얌 자체 로그인 버튼
  ///
  /// 이메일을 통해 사용자가 로그인을 할 수 있도록 로그인 화면으로 이동시킵니다.
  Widget _emailLoginButtion() => Builder(builder: (context) {
        final viewModel = Provider.of<LoginViewModel>(context);

        final theme = Theme.of(context);
        return LoginButton(
            onTap: viewModel.signIn,
            path: LoginImagePath.auth,
            label: "이메일로 로그인",
            backgroundColor: theme.colorScheme.primary,
            labelStyle: theme.textTheme.bodyLarge);
      });
}

/// 각 로그인 버튼 로고에 대한 ImagePath 확장
///
/// 각 로그인 버튼에 맞는 이미지 로고의 경로를 getter로 지정하였습니다.
extension LoginImagePath on ImagePath {
  static String get google => "assets/images/google_ic.svg";
  static String get apple => "assets/images/apple_ic.svg";
  static String get kakao => "assets/images/kakao_ic.svg";
  static String get auth => "assets/images/auth_ic.svg";
}
