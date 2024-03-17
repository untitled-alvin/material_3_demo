import 'package:flutter/material.dart';

class FormHeader extends AppBar {
  FormHeader({super.key, super.title});

  @override
  List<Widget>? get actions => [const SizedBox.shrink()];

  @override
  bool? get centerTitle => false;

  @override
  double? get titleSpacing => 0;

  @override
  double? get elevation => 0;

  @override
  double? get scrolledUnderElevation => 0;

  @override
  Color? get backgroundColor => Colors.transparent;
}
