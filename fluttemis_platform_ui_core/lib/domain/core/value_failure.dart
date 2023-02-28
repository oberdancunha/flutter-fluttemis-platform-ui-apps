abstract class ValueFailure<T> {
  late final T failedValue;
}

class ValueFailureStrandType<int> extends ValueFailure<int> {
  @override
  final int failedValue;

  ValueFailureStrandType({
    required this.failedValue,
  });
}
