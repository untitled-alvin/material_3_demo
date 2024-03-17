import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';

import 'form_header.dart';

enum AIcons {
  eyeSlash,
  eyeSlashBold,

  eyeBold,

  lock1Bold,

  sms1Bold,

  googleBold,
  facebookBold,
  appleBold,

  //
  profileCircleBold,

  //
  userSquareBold,

  //
  notificationBold,

  //
  codeCircleBold,

  //
  briefcaseBold,

  //
  arrowRight3,

  //
  settings4Bold,

  //
  securitySafeBold,

  //
  commandSquareBold,
}

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon, {super.key, this.size});

  final AIcons icon;
  final double? size;

  Widget get child {
    return switch (icon) {
      AIcons.eyeSlash => Icon(IconsaxOutline.eye_slash, size: size),
      AIcons.eyeSlashBold => Icon(IconsaxBold.eye_slash, size: size),
      //
      AIcons.eyeBold => Icon(IconsaxBold.eye, size: size),
      //
      AIcons.lock1Bold => Icon(IconsaxBold.lock_1, size: size),
      //
      AIcons.sms1Bold => Icon(IconsaxBold.sms, size: size),

      //
      AIcons.googleBold => Icon(MingCuteIcons.mgc_google_fill, size: size),
      AIcons.facebookBold => Icon(MingCuteIcons.mgc_facebook_fill, size: size),
      AIcons.appleBold => Icon(MingCuteIcons.mgc_apple_fill, size: size),

      //
      AIcons.profileCircleBold => Icon(IconsaxBold.profile_circle, size: size),
      //
      AIcons.userSquareBold => Icon(IconsaxBold.user_square, size: size),
      //
      AIcons.notificationBold => Icon(IconsaxBold.notification, size: size),
      //
      AIcons.codeCircleBold => Icon(IconsaxBold.code_circle, size: size),
      //
      AIcons.briefcaseBold => Icon(IconsaxBold.briefcase, size: size),

      //
      AIcons.arrowRight3 => Icon(IconsaxOutline.arrow_right_3, size: size),

      //
      AIcons.settings4Bold => Icon(IconsaxBold.setting_4, size: size),

      //
      AIcons.securitySafeBold => Icon(IconsaxBold.security_safe, size: size),

      //
      AIcons.commandSquareBold => Icon(IconsaxBold.command_square, size: size),
    };
  }

  @override
  Widget build(BuildContext context) => child;
}

class Element extends StatelessWidget {
  const Element({super.key, required this.icon, this.tooltip});

  final Widget icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        iconSize: 20,
        elevation: 2,
      ),
      onPressed: () {},
      tooltip: tooltip,
      icon: icon,
    );
  }
}

class IconsList extends StatelessWidget {
  const IconsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      FormHeader(title: const Text('Icons')),
      Wrap(spacing: 16, runSpacing: 16, children: [
        for (var element in AIcons.values)
          Element(
            tooltip: element.name,
            icon: AppIcon(element),
          ),
      ]),
    ]);
  }
}
