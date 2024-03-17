import 'package:flutter/material.dart';

import 'form_header.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({super.key});

  static final options = <String>[
    'Ensure',
    'Some',
    'Incorporate',
    'Experience',
    'Here',
    'UX/UI',
    'About',
    'Today',
    'User',
    'Allow',
    'Tag',
    'Liked',
    'Post',
  ];

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  String? _selected = FilterForm.options.first;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      FormHeader(title: const Text('Tags')),
      //
      Wrap(spacing: 12, runSpacing: 12, children: [
        for (var element in FilterForm.options)
          FilterChip(
            label: Text(element),
            side: switch (brightness) { _ => BorderSide.none },
            // side: BorderSide.none,
            selected: _selected == element,
            onSelected: (selected) => setState(() => _selected = element),
          ),

        //
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('More'),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ]),

      //
      const SizedBox(height: 48),
      Row(children: [
        Expanded(
          child: FilledButton.tonal(
            onPressed: () {
              setState(() => _selected = FilterForm.options.first);
            },
            child: const Text('Reset'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FilledButton(
            onPressed: () {},
            child: const Text('Apply'),
          ),
        )
      ]),
    ]);
  }
}
