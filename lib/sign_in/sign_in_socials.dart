import 'package:flutter/material.dart';
import 'package:standard_ui_kit/standard_ui_kit.dart';

class SocialsSignIn extends Column {
  const SocialsSignIn({super.key});

  @override
  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.stretch;

  @override
  List<Widget> get children {
    return [
      FilledButton.tonalIcon(
        onPressed: () {},
        icon: const Icon(StandardIcons.apple_bold),
        // icon: const Icon(MingCuteIcons.mgc_apple_fill),
        label: const Text('Sign In With Apple'),
      ),
      const SizedBox(height: 12),
      FilledButton.tonalIcon(
        onPressed: () {},
        icon: Icon(StandardIcons.facebook_bold, color: Colors.blue[800]),
        // icon: Icon(MingCuteIcons.mgc_facebook_fill, color: Colors.blue[800]),
        label: const Text('Sign In With Facebook', maxLines: 1),
      ),
      const SizedBox(height: 12),
      FilledButton.tonalIcon(
        onPressed: () {},
        icon: const Icon(StandardIcons.google_bold),
        // icon: const Icon(MingCuteIcons.mgc_google_fill),
        label: const Text('Sign In With Google'),
      ),
    ];
  }
}

// @override
// Widget build(BuildContext context) {
//   return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//     FilledButton.tonalIcon(
//       onPressed: () {},
//       icon: const Icon(MingCuteIcons.mgc_apple_fill),
//       label: const Text('Sign In With Apple'),
//     ),
//     const SizedBox(height: 12),
//     FilledButton.tonalIcon(
//       onPressed: () {},
//       icon: Icon(MingCuteIcons.mgc_facebook_fill, color: Colors.blue[800]),
//       label: const Text('Sign In With Facebook', maxLines: 1),
//     ),
//     const SizedBox(height: 12),
//     FilledButton.tonalIcon(
//       onPressed: () {},
//       icon: const Icon(MingCuteIcons.mgc_google_fill),
//       label: const Text('Sign In With Google'),
//     ),
//   ]);
// }
  
// @override
// Widget build(BuildContext context) {
//   const minimumSize = Size.fromHeight(56);
//   return OutlinedButtonTheme(
//     data: OutlinedButtonThemeData(
//       style: OutlinedButton.styleFrom(minimumSize: minimumSize),
//     ),
//     child: Row(children: [
//       Flexible(
//         child: OutlinedButton.icon(
//           onPressed: () {},
//           icon: const Icon(MingCuteIcons.mgc_google_fill),
//           label: const Text('Google'),
//         ),
//         // child: OutlinedButton(onPressed: () {}, child: const Text('Google')),
//       ),
//       const SizedBox(width: 24),
//       Flexible(
//         child: OutlinedButton.icon(
//           onPressed: () {},
//           icon: const Icon(MingCuteIcons.mgc_apple_fill),
//           label: const Text('Apple'),
//         ),
//       ),
//       const SizedBox(width: 24),
//       Flexible(
//         child: OutlinedButton.icon(
//           onPressed: () {},
//           icon: const Icon(MingCuteIcons.mgc_facebook_fill),
//           label: const Text(
//             'Facebook',
//             maxLines: 1,
//           ),
//         ),
//       ),
//     ]),
//   );
// }

