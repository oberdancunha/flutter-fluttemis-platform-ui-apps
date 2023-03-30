import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

abstract class Failure extends Equatable {
  bool get tryAgain => false;
}
