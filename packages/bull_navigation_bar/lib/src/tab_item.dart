// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

class TabItem {
  TabItem(
    this.icon,
    this.title,
    this.circleColor, {
    this.circleStrokeColor,
    this.labelStyle = const TextStyle(fontWeight: FontWeight.bold),
  });

  IconData icon;
  String title;
  Color circleColor;
  Color? circleStrokeColor;
  TextStyle labelStyle;
}
