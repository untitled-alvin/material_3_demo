// ignore_for_file: public_member_api_docs

sealed class ValueFailure<T> {
  ValueFailure({
    required this.failedValue,
  });

  factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) {
    return ExceedingLength(failedValue: failedValue, max: max);
  }

  factory ValueFailure.empty({required T failedValue}) {
    return Empty(failedValue: failedValue);
  }

  factory ValueFailure.multiline({required T failedValue}) {
    return Multiline(failedValue: failedValue);
  }

  factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) {
    return ListTooLong(failedValue: failedValue, max: max);
  }

  factory ValueFailure.invalidEmail({required T failedValue}) {
    return InvalidEmail(failedValue: failedValue);
  }

  factory ValueFailure.shortPassword({required T failedValue}) {
    return ShortPassword(failedValue: failedValue);
  }

  final T failedValue;
}

class Empty<T> extends ValueFailure<T> {
  Empty({required super.failedValue});
}

class Multiline<T> extends ValueFailure<T> {
  Multiline({required super.failedValue});
}

class InvalidEmail<T> extends ValueFailure<T> {
  InvalidEmail({required super.failedValue});
}

class ShortPassword<T> extends ValueFailure<T> {
  ShortPassword({required super.failedValue});
}

class ExceedingLength<T> extends ValueFailure<T> {
  ExceedingLength({
    required super.failedValue,
    required this.max,
  });

  final int max;
}

class ListTooLong<T> extends ValueFailure<T> {
  ListTooLong({
    required super.failedValue,
    required this.max,
  });

  final int max;
}
