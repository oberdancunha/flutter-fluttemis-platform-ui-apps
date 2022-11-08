import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

class GenbankModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const SizedBox(
        child: Center(
          child: Text('Vamos ler um arquivo dos genbanks....'),
        ),
      ),
    ),
  ];
}
