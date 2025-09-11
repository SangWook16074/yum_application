import 'package:flutter/material.dart';

class PrimaryThemeButton extends StatelessWidget {
  final String? text;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double borderRadius;

  const PrimaryThemeButton({
    super.key,
    this.text,
    this.width,
    this.height = 50,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.borderRadius = 12,
  }) : assert(text != ''); // 기본 검증

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed ?? () {}, // null일 경우 안전 처리
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFFF97316),
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text ?? '',
          style: textStyle ??
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.white,
              ),
        ),
      ),
    );
  }
}
