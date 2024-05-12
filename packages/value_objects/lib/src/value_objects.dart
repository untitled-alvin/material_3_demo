// ignore_for_file: always_use_package_imports, public_member_api_docs
import 'package:dartz/dartz.dart';

import 'value_failure.dart';
import 'value_object.dart';
import 'value_validators.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class Password extends ValueObject<String> {
  factory Password(String input) => Password._(validatePassword(input));

  const Password._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
