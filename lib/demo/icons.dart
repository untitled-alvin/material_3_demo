// ignore_for_file: constant_identifier_names

import 'package:bulk_icons/bulk_icons.dart';
import 'package:flutter/material.dart';
import 'package:standard_ui_kit/standard_ui_kit.dart';

import 'form_header.dart';

class Element extends StatelessWidget {
  const Element({super.key, required this.icon, this.tooltip});

  final Widget icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      iconSize: 20,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      onPressed: () {},
      tooltip: tooltip,
      icon: icon,
    );
  }
}

class Icons extends StatelessWidget {
  const Icons({super.key});

  @override
  Widget build(BuildContext context) {
    final space = Theme.of(context).space.s4;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      FormHeader(title: const Text('Bulk')),
      Wrap(spacing: space, runSpacing: space, children: [
        for (var icon in BulkIcons.values)
          Element(tooltip: icon.label, icon: BulkIcon(icon)),
      ]),
      FormHeader(title: const Text('Icons')),
      Wrap(spacing: space, runSpacing: space, children: [
        for (var icon in StandardIcons.values)
          Element(tooltip: icon.codePoint.toString(), icon: Icon(icon)),
      ]),
    ]);
  }
}
