import 'dart:developer';

import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_source_input_type/data_source_input_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon/icon_type_enum.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon/platform_icon_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon_button/platform_icon_button_widget.dart';
import 'package:flutter/widgets.dart';

class LocusResumeHeaderWidget extends StatelessWidget {
  final KtList<Locus> locus;

  const LocusResumeHeaderWidget({
    required this.locus,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DataSourceInputWidget(),
          SizedBox(
            height: 25,
            width: 200,
            child: PlatformIconButtonWidget(
              icon: const PlatformIconWidget(
                iconType: IconType.table,
                size: 13,
              ),
              label: 'Abrir tabela de locus',
              fontSize: 11,
              onPressed: () => log('Oi'),
            ),
          ),
        ],
      );
}
