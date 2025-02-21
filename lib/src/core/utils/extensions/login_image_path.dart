import 'package:yum_application/src/ui/common/widgets/image_widget.dart';

/// 각 로그인 버튼 로고에 대한 ImagePath 확장
///
/// 각 로그인 버튼에 맞는 이미지 로고의 경로를 getter로 지정하였습니다.
extension LoginImagePath on ImagePath {
  static String get google => "assets/images/google_ic.svg";
  static String get apple => "assets/images/apple_ic.svg";
  static String get kakao => "assets/images/kakao_ic.svg";
  static String get auth => "assets/images/auth_ic.svg";
}
