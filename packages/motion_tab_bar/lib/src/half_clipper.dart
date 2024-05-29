import 'package:flutter/material.dart';

/// {@template half_clipper}
/// Half Clipper For Motion Navigation Bar Flutter package
/// {@endtemplate}
class HalfClipper extends CustomClipper<Rect> {
  /// {@macro half_clipper}
  HalfClipper();

  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width, size.height / 2);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
