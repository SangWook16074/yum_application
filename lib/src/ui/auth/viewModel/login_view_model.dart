import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/ui/app/page/app_page.dart';
import 'package:yum_application/src/core/utils/variable/global_variable.dart';

class LoginViewModel extends ChangeNotifier {
  /// 임시 로그인 화면
  ///
  ///
  /// 임시 로그인 액션으로 바로 사용자 UI로 이동합니다.
  void signIn() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final context = GlobalVariable.naviagatorState.currentContext!;

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AppPage()));
    });
    notifyListeners();
  }
}
