// ignore_for_file: public_member_api_docs, always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'error.dart';
import 'value_failure.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  // Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
  //   return value.fold(left, (r) => right(unit));
  // }

  Either<ValueFailure<T>, Unit> get failureOrUnit {
    return value.fold(left, (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
