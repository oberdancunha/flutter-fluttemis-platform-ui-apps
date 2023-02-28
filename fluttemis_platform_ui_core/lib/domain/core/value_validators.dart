import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../locus/feature_strand.dart';
import 'value_failure.dart';

Either<ValueFailure<int>, FeatureStrandType> getStrandType(int strand) {
  if (strand == 0) {
    return right(FeatureStrandType.upstream);
  } else if (strand == 1) {
    return right(FeatureStrandType.downstream);
  } else {
    return left(ValueFailureStrandType(failedValue: strand));
  }
}
