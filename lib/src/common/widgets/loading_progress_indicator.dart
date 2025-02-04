// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

/// [LoadingProgressIndicator]위젯은 프로젝트에서 사용할
/// 로딩 위젯입니다.
/// 위젯의 사이즈는 기본으로 64를 갖습니다. 커스터마이징을 원하면 [width]로 수정할 수 있습니다.
/// 로딩 위젯의 두께 기본으로 10입니다. [strokeWidth]를 통해 수정이 가능합니다.
class LoadingProgressIndicator extends StatefulWidget {
  final double width;
  final double strokeWidth;
  const LoadingProgressIndicator({
    super.key,
    this.width = 64,
    this.strokeWidth = 10,
  });

  @override
  State<LoadingProgressIndicator> createState() =>
      _LoadingProgressIndicatorState();
}

class _LoadingProgressIndicatorState extends State<LoadingProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  /// 위젯이 초기화되면 INFINITE한 회전 애니메이션을 수행합니다.
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
      child: CustomPaint(
        size: Size(widget.width, widget.width),
        painter: IndicatorPainter(strokeWidth: widget.strokeWidth),
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  /// [strokeWidth]를 전달받아 렌더링을 수행합니다.
  final double strokeWidth;

  IndicatorPainter({required this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final pointRadius = strokeWidth / 2;
    final pointCenter = Offset(size.width / 2, size.height - pointRadius);
    final outerRadius = size.width / 2;
    final innerRadius = size.width / 2 - strokeWidth;
    // 포인트 Rect
    final pointRect = Rect.fromCircle(center: pointCenter, radius: pointRadius);
    // 도넛 외부 Rect
    final outerRect = Rect.fromCircle(center: center, radius: outerRadius);

    // 더넛 내부 Rect
    final innerRect = Rect.fromCircle(center: center, radius: innerRadius);
    final Paint paint = Paint()
      ..shader =
          SweepGradient(transform: const GradientRotation(pi / 2), colors: [
        const Color(0xffffb300),
        const Color(0xffffb300),
        const Color(0xffffffff).withOpacity(0.2),
      ]).createShader(outerRect)
      ..style = PaintingStyle.fill;

    /// 기본이 되는 path 생성
    final Path path = Path()
      ..addOval(outerRect)
      ..addOval(innerRect);

    path.fillType = PathFillType.evenOdd; // 내부를 비우도록 설정

    // 도넛 렌더링
    canvas.drawPath(path, paint);

    // Point Rect 렌더링
    final pointPaint = Paint()..color = const Color(0xffffb300);
    canvas.drawOval(pointRect, pointPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
