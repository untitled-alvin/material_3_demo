// ignore_for_file: public_member_api_docs

sealed class ValueFailure<T> {
  ValueFailure({
    required this.failedValue,
  });

  factory ValueFailure.empty({required T failedValue}) {
    return Empty(failedValue: failedValue);
  }

  factory ValueFailure.multiline({required T failedValue}) {
    return Multiline(failedValue: failedValue);
  }

  factory ValueFailure.invalidEmail({required T failedValue}) {
    return InvalidEmail(failedValue: failedValue);
  }

  factory ValueFailure.shortPassword({required T failedValue}) {
    return ShortPassword(failedValue: failedValue);
  }

  factory ValueFailure.noSpecialSymbol({required T failedValue}) {
    return NoSpecialSymbol(failedValue: failedValue);
  }

  factory ValueFailure.noUpperCase({required T failedValue}) {
    return NoUpperCase(failedValue: failedValue);
  }

  factory ValueFailure.noNumber({required T failedValue}) {
    return NoNumber(failedValue: failedValue);
  }

  factory ValueFailure.exceedingLength(
      {required T failedValue, required int max}) {
    return ExceedingLength(failedValue: failedValue, max: max);
  }

  factory ValueFailure.listTooLong({required T failedValue, required int max}) {
    return ListTooLong(failedValue: failedValue, max: max);
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

class NoSpecialSymbol<T> extends ValueFailure<T> {
  NoSpecialSymbol({required super.failedValue});
}

class NoUpperCase<T> extends ValueFailure<T> {
  NoUpperCase({required super.failedValue});
}

class NoNumber<T> extends ValueFailure<T> {
  NoNumber({required super.failedValue});
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
