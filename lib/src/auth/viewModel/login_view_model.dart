import 'package:flutter/material.dart';
import 'package:yum_application/src/app/page/app_page.dart';
import 'package:yum_application/src/util/global_variable.dart';

class LoginViewModel extends ChangeNotifier {
  /// 임시 로그인 화면
  ///
  ///
  /// 임시 로그인 액션으로 바로 사용자 UI로 이동합니다.
  void signIn() {
    final context = GlobalVariable.naviagatorState.currentContext!;
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AppPage()));
  }
}
