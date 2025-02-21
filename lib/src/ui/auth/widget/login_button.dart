import 'package:flutter/widgets.dart';
import 'package:yum_application/src/ui/common/widgets/svg_image_widget.dart';

class LoginButton extends StatelessWidget {
  /// 버튼의 액션을 지정하는 프로퍼티입니다.
  ///
  /// 개발자가 지정한 함수를 통해서 [LoginButton]에서
  /// 로그인을 실행합니다.
  final void Function()? onTap;

  /// 버튼의 로고를 지정하는 path 입니다.
  ///
  /// path는 SVG 형식의 이미지만을 지정해야만 합니다.
  final String path;

  /// 버튼의 label을 지정할 수 있는 label 프로퍼티입니다.
  ///
  /// 지정된 label이 [LoginButton] 중앙에 정렬됩니다.
  /// [TextStyle]은 지정할 수 없습니다.
  final String label;

  /// [LoginButton]의 배경색상을 지정하는 프로퍼티입니다.
  ///
  /// 각 로그인 형식에 맞는 색상을 지정해야만 합니다.
  /// Google => [Color(0xffF2F2F2)]
  /// Apple => [Color(0xff000000)]
  /// Kakao => [Color(0xffFEE500)]
  /// Email => 앱의 PrimaryColor로 지정해야만 합니다.
  final Color backgroundColor;

  /// [LoginButton]의 label 프로퍼티의 스타일을 지정하는 프로퍼티입니다.
  ///
  /// 각 로그인 형식에 맞는 테마 스타일을 지정해야만 합니다.
  final TextStyle? labelStyle;
  const LoginButton(
      {super.key,
      this.onTap,
      required this.path,
      required this.label,
      required this.backgroundColor,
      required this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// 버튼의 액션 함수
      ///
      /// 지정된 onTap은 수정하면 안됩니다.
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        width: 350,
        height: 48,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// 버튼의 leading icon 위젯
            _leading(),

            /// 버튼의 label
            _label(),

            /// 좌우 정렬을 위하여 지정한 아이콘
            ///
            /// 실제로는 Opacity가 0으로 보이지 않음.
            Opacity(opacity: 0.0, child: _leading()),
          ],
        ),
      ),
    );
  }

  /// 버튼의 Leading Icon 위젯
  Widget _leading() => SizedBox(
        height: 44,
        width: 44,
        child: SVGImageWidget(
          path: path,
        ),
      );

  /// 버튼의 Label 위젯
  Widget _label() => Text(
        label,
        style: labelStyle,
      );
}
