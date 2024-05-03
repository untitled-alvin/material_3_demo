// ignore_for_file: constant_identifier_names, public_member_api_docs,
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';

@immutable
class StandardIcons {
  const StandardIcons._();

  static const eye_slash = IconsaxOutline.eye_slash;

  static const eye_slash_bold = IconsaxBold.eye_slash;

  static const eye_bold = IconsaxBold.eye;

  static const lock_1_bold = IconsaxBold.lock_1;

  static const sms1_bold = IconsaxBold.sms;

  static const google_bold = MingCuteIcons.mgc_google_fill;

  static const facebook_bold = MingCuteIcons.mgc_facebook_fill;

  static const apple_bold = MingCuteIcons.mgc_apple_fill;

  static const profile_circle_bold = IconsaxBold.profile_circle;

  static const user_square_bold = IconsaxBold.user_square;

  static const notification_bold = IconsaxBold.notification;

  static const code_circle_bold = IconsaxBold.code_circle;

  static const briefcase_bold = IconsaxBold.briefcase;

  static const arrow_right_3 = IconsaxOutline.arrow_right_3;

  static const settings_4_bold = IconsaxBold.setting_4;

  static const security_safe_bold = IconsaxBold.security_safe;

  static const command_square_bold = IconsaxBold.command;

  static const values = [
    eye_slash,
    eye_slash_bold,
    eye_bold,
    lock_1_bold,
    sms1_bold,
    google_bold,
    facebook_bold,
    apple_bold,
    profile_circle_bold,
    user_square_bold,
    notification_bold,
    code_circle_bold,
    briefcase_bold,
    arrow_right_3,
    settings_4_bold,
    security_safe_bold,
    command_square_bold,
  ];
}

// enum StandardIcons {
//   eye_slash('eye_slash', IconsaxOutline.eye_slash),
//   eye_slash_bold('eye_slash_bold', IconsaxBold.eye_slash),
//   eye_bold('eye_bold', IconsaxBold.eye),
//   lock_1_bold('lock_1_bold', IconsaxBold.lock_1),
//   sms1_bold('sms1_bold', IconsaxBold.sms),
//   google_bold('google_bold', MingCuteIcons.mgc_google_fill),
//   facebook_bold('facebook_bold', MingCuteIcons.mgc_facebook_fill),
//   apple_bold('apple_bold', MingCuteIcons.mgc_apple_fill),
//   profile_circle_bold('profile_circle_bold', IconsaxBold.profile_circle),
//   user_square_bold('user_square_bold', IconsaxBold.user_square),
//   notification_bold('notification_bold', IconsaxBold.notification),
//   code_circle_bold('code_circle_bold', IconsaxBold.code_circle),
//   briefcase_bold('briefcase_bold', IconsaxBold.briefcase),
//   arrow_right_3('arrow_right_3', IconsaxOutline.arrow_right_3),
//   settings_4_bold('settings_4_bold', IconsaxBold.setting_4),
//   security_safe_bold('security_safe_bold', IconsaxBold.security_safe),
//   command_square_bold('command_square_bold', IconsaxBold.command);

//   const StandardIcons(this.label, this.data);
//   final String label;
//   final IconData data;
// }

// class Lexicon extends Icon {
//   Lexicon(StandardIcons icon, {super.key, super.size, super.color})
//       : super(icon.data);
// }
