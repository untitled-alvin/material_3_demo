import 'package:flutter/material.dart';

/// {@template half_painter}
/// Painter For Motion Navigation Bar Flutter package
/// {@endtemplate}
class HalfPainter extends CustomPainter {
  /// {@macro half_painter}
  HalfPainter({this.color});

  // Background Color
  // ignore: public_member_api_docs
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    const curveSize = 10.0;
    const xStartingPos = 0.0;
    final yStartingPos = size.height / 2;
    final yMaxPos = yStartingPos - curveSize;

    final path = Path()
      ..moveTo(xStartingPos, yStartingPos)
      ..lineTo(size.width - xStartingPos, yStartingPos)
      ..quadraticBezierTo(
        size.width - curveSize,
        yStartingPos,
        size.width - (curveSize + 5),
        yMaxPos,
      )
      ..lineTo(xStartingPos + (curveSize + 5), yMaxPos)
      ..quadraticBezierTo(
        xStartingPos + curveSize,
        yStartingPos,
        xStartingPos,
        yStartingPos,
      )
      ..close();

    canvas.drawPath(path, Paint()..color = color ?? Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
