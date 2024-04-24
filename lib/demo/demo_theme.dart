import 'package:flutter/material.dart';

class DemoTheme extends StatelessWidget {
  const DemoTheme({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // final minimumSize = const Size.fromHeight(54);
    // const minimumSize = Size.fromHeight(50);
    const minimumSize = Size(50, 50);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );

    // Fully traverse this list before moving on.
    return Theme(
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          // outline: theme.colorScheme.primary,
          outline: theme.colorScheme.outlineVariant,
        ),
        dividerColor: theme.colorScheme.outlineVariant,
        dividerTheme: DividerThemeData(
          color: theme.colorScheme.outlineVariant,
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
            // minimumSize: theme.filledButtonTheme.style?.minimumSize.,
            minimumSize: minimumSize,
            shape: shape,
          ).merge(theme.filledButtonTheme.style),

          // style:  FilledButton.styleFrom(
          //   shadowColor: Colors.transparent,
          //   shape: shape,
          //   // minimumSize: minimumSize,
          // ),
        ),
      ),
      child: child,
    );
  }
}
