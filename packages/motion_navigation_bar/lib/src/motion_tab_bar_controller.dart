// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class MotionTabBarController extends TabController {
  MotionTabBarController({
    required super.length,
    required super.vsync,
    super.initialIndex,
    super.animationDuration,
  });

  // programmatic tab change
  // ignore: annotate_overrides
  set index(int index) {
    super.index = index;
    _changeIndex!(index);
  }

  // callback for tab change
  void Function(int)? _changeIndex;

  // ignore: avoid_setters_without_getters
  set onTabChange(void Function(int)? fx) {
    _changeIndex = fx;
  }
}
