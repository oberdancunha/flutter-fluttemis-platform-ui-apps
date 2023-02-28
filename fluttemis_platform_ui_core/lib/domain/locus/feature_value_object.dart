import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../core/value_failure.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';
import 'feature_strand.dart';

class FeatureStrandTypeValueObject extends ValueObject<int, FeatureStrandType> {
  @override
  final Either<ValueFailure<int>, FeatureStrandType> value;

  factory FeatureStrandTypeValueObject(int strand) => FeatureStrandTypeValueObject._(
        getStrandType(strand),
      );

  const FeatureStrandTypeValueObject._(this.value);
}
