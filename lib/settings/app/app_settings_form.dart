import 'package:flutter/material.dart';
import 'package:standard_ui_kit/standard_ui_kit.dart';

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
    return Column(
      children: ListTile.divideTiles(context: context, tiles: [
        for (var element in options.entries)
          SwitchTile(title: Text(element.key), leading: element.value),
      ]).toList(),
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
