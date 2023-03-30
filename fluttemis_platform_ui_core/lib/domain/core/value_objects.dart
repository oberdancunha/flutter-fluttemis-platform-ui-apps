import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/foundation.dart';

import 'strand_type.dart';
import 'value_failure.dart';
import 'value_validators.dart';

@immutable
abstract class ValueObject<E, T> {
  const ValueObject();

  Either<ValueFailure<E>, T> get value;

  T getOrError() => value.fold(
        (failure) => throw Error(),
        id,
      );

  @override
  bool operator ==(covariant ValueObject other) {
    if (identical(this, other)) {
      return true;
    }

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class UniqueIdValueObject extends ValueObject<String, String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueIdValueObject() => UniqueIdValueObject._(
        right(const Uuid().v4()),
      );

  const UniqueIdValueObject._(this.value);
}

class StrandTypeValueObject extends ValueObject<int, StrandType> {
  @override
  final Either<ValueFailure<int>, StrandType> value;

  factory StrandTypeValueObject(int strand) => StrandTypeValueObject._(
        getStrandType(strand),
      );

  const StrandTypeValueObject._(this.value);
}
