import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:standard_ui_kit/standard_ui_kit.dart';
import 'package:value_objects/value_objects.dart';

class VisibilityIcon extends Icon {
  const VisibilityIcon(bool obscure, {super.key})
      : super(obscure ? StandardIcons.eye_bold : StandardIcons.eye_slash_bold,
            size: 20);
}

class ObscureButton extends IconButton {
  ObscureButton({
    required bool obscure,
    super.key,
    super.onPressed,
  }) : super(icon: VisibilityIcon(obscure));
}

class InputLabel extends StatelessWidget {
  const InputLabel(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).inputDecorationTheme.labelStyle);
  }
}

class MailInput extends StatelessWidget {
  const MailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }

        return EmailAddress(value).failureOrUnit.fold(
          (failure) {
            return switch (failure) {
              InvalidEmail() => 'Email invalid',
              _ => 'Email invalid'
            };
          },
          (_) => null,
        );
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(StandardIcons.sms1_bold, size: 20),
        // filled: true,
        hintText: 'Email Address',
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }

        // return Password(value).failureOrUnit.fold((failure) {
        //   return switch (failure) {
        //     ShortPassword() => 'ShortPassword',
        //     NoUpperCase() => 'NoUpperCase',
        //     NoNumber() => 'NoNumber',
        //     NoSpecialSymbol() => 'NoSpecialSymbol',
        //     _ => 'PasswordInvalid'
        //   };
        // }, (_) => null);

        return Password(value).failureOrUnit.fold((failure) {
          return failure.runtimeType.toString();
        }, (_) => null);
      },
      decoration: InputDecoration(
        hintText: 'Password',
        // filled: true,
        prefixIcon: const Icon(StandardIcons.lock_1_bold, size: 20),
        suffixIcon: ObscureButton(
          onPressed: () => setState(() => _obscure = !_obscure),
          obscure: _obscure,
        ),
      ),
      obscureText: _obscure,
    );
  }
}

enum FormStatus { idle, busy }

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    this.status = FormStatus.idle,
    this.onPressed,
  });

  final FormStatus status;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: switch (status) {
        FormStatus.busy => null,
        FormStatus.idle => onPressed,
      },
      child: switch (status) {
        FormStatus.busy => const CupertinoActivityIndicator(),
        _ => const Text('Sign In'),
      },
    );
  }
}
