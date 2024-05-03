// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'radius.dart';
part 'sizes.dart';
part 'space.dart';
part 'theme.tailor.dart';

extension StandardExt on ThemeData {
  ThemeData standard() {
    // final minimumSize = const Size.fromHeight(54);
    // const minimumSize = Size.fromHeight(50);
    const minimumSize = Size(50, 50);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );

    return copyWith(
      extensions: [
        TokenRadius.standard(),
        Space.standard(),
        Sizes.standard(),
      ],
      colorScheme: colorScheme.copyWith(
        // outline: colorScheme.primary,
        outline: colorScheme.outlineVariant,
      ),
      dividerColor: colorScheme.outlineVariant,
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
      ),
      iconTheme: const IconThemeData(size: 20),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        tabAlignment: TabAlignment.start,
      ),
      cardTheme: const CardTheme(
        clipBehavior: Clip.hardEdge,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      shadowColor: Colors.transparent,
      // chipTheme: ChipThemeData(
      //   side: BorderSide.none,
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          shape: shape,
          // minimumSize: minimumSize,
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shadowColor: Colors.transparent,
          // minimumSize: filledButtonStyle?.minimumSize.,
          minimumSize: minimumSize,
          shape: shape,
        ).merge(filledButtonTheme.style),

        // style:  FilledButton.styleFrom(
        //   shadowColor: Colors.transparent,
        //   shape: shape,
        //   // minimumSize: minimumSize,
        // ),
      ),
    );
  }
}

class DemoTheme extends StatelessWidget {
  const DemoTheme({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(data: Theme.of(context).standard(), child: child);
  }
}
