import 'package:flutter/material.dart';

class OrDivider extends Row {
  const OrDivider({super.key});

  @override
  List<Widget> get children {
    return [
      const Expanded(child: Divider()),
      const SizedBox(width: 12),
      const Text('Or'),
      const SizedBox(width: 12),
      const Expanded(child: Divider()),
    ];
  }
}
