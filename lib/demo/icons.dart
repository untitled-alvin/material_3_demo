import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      AIcons.commandSquareBold => Icon(IconsaxBold.command, size: size),
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

class IconsList extends StatelessWidget {
  const IconsList({super.key});

  @override
  Widget build(BuildContext context) {
    const svgString =
        '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M11.129 15.879c-.25 0-.5-.13-.64-.36-.21-.35-.1-.82.26-1.03l.89-.53v-1.08c0-.41.34-.75.75-.75s.75.34.75.75v1.5c0 .26-.14.51-.36.64l-1.25.75c-.14.07-.27.11-.4.11Z" fill="#FF8A65"></path><path opacity=".4" d="m21.848 11.41-.62 6.78c-.21 2-1.03 4.04-5.43 4.04h-7.62c-4.4 0-5.22-2.04-5.42-4.03l-.61-6.51c.01.01.02.02.04.03.34.22.67.44 1.03.64.14.09.29.17.44.25 1.13.62 2.34 1.11 3.59 1.45.5.15 1.01.26 1.53.35a3.25 3.25 0 0 0 3.22 2.84c1.67 0 3.05-1.27 3.23-2.9v-.01c.51-.1 1.02-.23 1.52-.38 1.25-.39 2.46-.91 3.59-1.57.06-.03.11-.06.15-.09.46-.25.9-.54 1.32-.84.02-.01.03-.03.04-.05Z" fill="#FF8A65"></path><path d="M21.091 6.98c-.85-.94-2.26-1.41-4.33-1.41h-.24v-.04c0-1.68 0-3.76-3.76-3.76h-1.52c-3.76 0-3.76 2.08-3.76 3.76v.04h-.24c-2.07 0-3.49.47-4.33 1.41-.99 1.11-.96 2.58-.86 3.59l.01.07.09 1.05c.01.01.03.02.05.03.34.22.67.44 1.03.64.14.09.29.17.44.25 1.13.62 2.34 1.11 3.58 1.45a4.755 4.755 0 0 0 4.75 4.69c2.62 0 4.75-2.13 4.75-4.75v-.04c1.26-.38 2.47-.91 3.6-1.57.06-.03.1-.06.15-.09.46-.25.9-.54 1.32-.84.01-.01.03-.03.04-.05l.04-.36.05-.47c.01-.06.01-.11.02-.18.08-1 .06-2.38-.88-3.42ZM8.911 5.53c0-1.7 0-2.34 2.33-2.34h1.52c2.33 0 2.33.64 2.33 2.34v.04h-6.18v-.04Zm3.09 11.72a3.25 3.25 0 0 1-3.22-2.84c-.02-.13-.03-.27-.03-.41 0-1.79 1.46-3.25 3.25-3.25s3.25 1.46 3.25 3.25c0 .12-.01.23-.02.34v.01a3.258 3.258 0 0 1-3.23 2.9Z" fill="#FF8A65"></path></svg>''';

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      FormHeader(title: const Text('Icons')),
      Wrap(spacing: 16, runSpacing: 16, children: [
        Element(
          tooltip: 'element.name',
          icon: SvgPicture.string(svgString, width: 24, height: 24),
        ),
        for (var element in AIcons.values)
          Element(
            tooltip: element.name,
            icon: AppIcon(element),
          ),
      ]),
    ]);
  }
}
