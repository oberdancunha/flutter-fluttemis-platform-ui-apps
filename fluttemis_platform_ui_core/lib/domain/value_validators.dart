import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import 'strand_type.dart';
import 'value_failure.dart';

Either<ValueFailure<int>, StrandType> getStrandType(int strand) {
  if (strand == 0) {
    return right(StrandType.upstream);
  } else if (strand == 1) {
    return right(StrandType.downstream);
  } else {
    return left(ValueFailureStrandType(failedValue: strand));
  }
}
