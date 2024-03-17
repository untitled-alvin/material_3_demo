import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_3_demo/demo/icons.dart';

import 'form_header.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      FormHeader(title: const Text('Personal Settings')),
      const PersonalSettings(),
      const SizedBox(height: 12),
      FormHeader(title: const Text('App Settings')),
      const AppSettings(),
    ]);
  }
}

class CardPane extends StatelessWidget {
  const CardPane({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: child,
    );
  }
}

class PersonalSettings extends StatelessWidget {
  const PersonalSettings({super.key});

  static final options = <String, Widget>{
    'Profile': const AppIcon(AIcons.profileCircleBold),
    'Account': const AppIcon(AIcons.userSquareBold),
    'Notifications': const AppIcon(AIcons.notificationBold),
    'Organizations': const AppIcon(AIcons.briefcaseBold),
    'Dev Settings': const AppIcon(AIcons.codeCircleBold),
  };

  @override
  Widget build(BuildContext context) {
    return CardPane(
      child: Column(
        children: ListTile.divideTiles(context: context, tiles: [
          for (var element in options.entries)
            ListTile(
              onTap: () {},
              leading: element.value,
              trailing: const AppIcon(AIcons.arrowRight3, size: 16),
              title: Text(element.key),
            ),
        ]).toList(),
      ),
    );
  }
}

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  static final options = <String, Widget>{
    'Appearance': const AppIcon(AIcons.settings4Bold),
    'UX/UI': const AppIcon(AIcons.userSquareBold),
    'Shortcuts': const AppIcon(AIcons.commandSquareBold),
    'SSO': const AppIcon(AIcons.securitySafeBold),
  };

  @override
  Widget build(BuildContext context) {
    // leading: Icon(Icons.abc_outlined),
    return CardPane(
      child: Column(
        children: ListTile.divideTiles(context: context, tiles: [
          for (var element in options.entries)
            NotificationsTile(title: Text(element.key), leading: element.value),
        ]).toList(),
      ),
    );
  }
}

class NotificationsTile extends StatefulWidget {
  const NotificationsTile({super.key, this.title, this.leading});

  final Widget? title;
  final Widget? leading;

  @override
  State<NotificationsTile> createState() => _NotificationsTileState();
}

class _NotificationsTileState extends State<NotificationsTile> {
  bool _value = true;

  void valueChanged(bool value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.leading,
      trailing: Switch(value: _value, onChanged: valueChanged),
      title: widget.title,
      onTap: () => valueChanged(!_value),
    );
  }
}
