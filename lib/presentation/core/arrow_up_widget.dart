import 'package:flutter/material.dart';

class ArrowUpWidget extends StatelessWidget {
  final double width;
  final double height;
  final double strokeWidth;
  final Color color;

  const ArrowUpWidget({
    super.key,
    required this.width,
    required this.height,
    this.strokeWidth = 2.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _ArrowPainter(color: color, strokeWidth: strokeWidth),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  const _ArrowPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final path =
        Path()
          ..moveTo(0, size.height)
          ..lineTo(size.width / 2, 0)
          ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ArrowPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}
