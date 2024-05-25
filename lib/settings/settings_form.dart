import 'package:flutter/material.dart';
import 'package:standard_ui_kit/standard_ui_kit.dart';

import 'form_header.dart';

class SettingsForm extends Column {
  const SettingsForm({super.key});

  @override
  List<Widget> get children {
    return [
      FormHeader(title: const Text('Tabs')),
      const Tabs(),
      const SizedBox(height: 12),
      FormHeader(title: const Text('Personal Settings')),
      const PersonalSettings(),
      const SizedBox(height: 12),
      FormHeader(title: const Text('App Settings')),
      const AppSettings(),
    ];
  }

  @override
  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.stretch;
}

class CardPane extends StatelessWidget {
  const CardPane({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(elevation: 0, child: child);
  }
}

class PersonalSettings extends StatelessWidget {
  const PersonalSettings({super.key});

  static final options = <String, Widget>{
    'Profile': const Icon(StandardIcons.profile_circle_bold),
    'Account': const Icon(StandardIcons.user_square_bold),
    'Notifications': const Icon(StandardIcons.notification_bold),
    'Organizations': const Icon(StandardIcons.briefcase_bold),
    'Dev Settings': const Icon(StandardIcons.code_circle_bold),
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
              trailing: const Icon(StandardIcons.arrow_right_3, size: 16),
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
    'Appearance': const Icon(StandardIcons.settings_4_bold),
    'UX/UI': const Icon(StandardIcons.user_square_bold),
    'Shortcuts': const Icon(StandardIcons.command_square_bold),
    'SSO': const Icon(StandardIcons.security_safe_bold),
  };

  @override
  Widget build(BuildContext context) {
    // leading: Icon(Icons.abc_outlined),
    return CardPane(
      child: Column(
        children: ListTile.divideTiles(context: context, tiles: [
          for (var element in options.entries)
            SwitchTile(title: Text(element.key), leading: element.value),
        ]).toList(),
      ),
    );
  }
}

class SwitchTile extends StatefulWidget {
  const SwitchTile({super.key, this.title, this.leading});

  final Widget? title;
  final Widget? leading;

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  bool _value = true;

  void valueChanged(bool value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.leading,
      trailing: Theme(
        // ignore: deprecated_member_use
        data: Theme.of(context).copyWith(useMaterial3: false),
        child: Switch(value: _value, onChanged: valueChanged),
      ),
      title: widget.title,
      onTap: () => valueChanged(!_value),
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin {
  late TabController _tabController;

  static final options = <String, Widget>{
    'Profile': const Icon(StandardIcons.profile_circle_bold),
    'Account': const Icon(StandardIcons.user_square_bold),
    'Notifications': const Icon(StandardIcons.notification_bold),
    'Organizations': const Icon(StandardIcons.briefcase_bold),
    'Dev Settings': const Icon(StandardIcons.code_circle_bold),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: options.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // final _colors = Theme.of(context).colorScheme;
    return TabBar(
      padding: EdgeInsets.zero,
      controller: _tabController,
      isScrollable: true,
      // enableFeedback: false,
      // splashFactory: NoSplash.splashFactory,
      splashBorderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      // overlayColor: MaterialStateColor.resolveWith((states) {
      //   if (states.contains(MaterialState.selected)) {
      //     if (states.contains(MaterialState.pressed)) {
      //       return _colors.primary.withOpacity(0.12);
      //     }
      //     return Colors.transparent;
      //   }
      //   if (states.contains(MaterialState.pressed)) {
      //     return Colors.transparent;
      //   }
      //   if (states.contains(MaterialState.hovered)) {
      //     return Colors.transparent;
      //   }
      //   if (states.contains(MaterialState.focused)) {
      //     return Colors.transparent;
      //   }
      //   return Colors.transparent;
      // }),
      // dividerHeight: 0,
      tabs: [
        for (var element in options.entries)
          Tab(
            // icon: element.value,
            text: element.key,
            iconMargin: const EdgeInsets.only(bottom: 0.0),
          ),
      ],
    );
  }
}
