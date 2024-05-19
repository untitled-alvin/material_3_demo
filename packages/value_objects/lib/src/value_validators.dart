// ignore_for_file: always_use_package_imports, public_member_api_docs
import 'package:dartz/dartz.dart';

import 'value_failure.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<List<T>>, List<T>> validateMaxListLength<T>(
  List<T> input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.listTooLong(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // const emailRegex =
  //     r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  const emailRegex =
      r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&"*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+';

  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  final hasMinLength = input.length > 6;
  final hasUppercase = input.contains(RegExp('[A-Z]'));
  final hasDigits = input.contains(RegExp('[0-9]'));
  final hasSpecialCharacters =
      input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  // if (input.length >= 6) {
//   return right(input);
// } else {
//   return left(ValueFailure.shortPassword(failedValue: input));
// }

  if (!hasMinLength) {
    return left(
      ValueFailure.shortPassword(failedValue: input),
    );
  } else if (!hasUppercase) {
    return left(
      ValueFailure.noUpperCase(failedValue: input),
    );
  } else if (!hasDigits) {
    return left(
      ValueFailure.noNumber(failedValue: input),
    );
  } else if (!hasSpecialCharacters) {
    return left(
      ValueFailure.noSpecialSymbol(failedValue: input),
    );
  } else {
    return right(input);
  }
}
