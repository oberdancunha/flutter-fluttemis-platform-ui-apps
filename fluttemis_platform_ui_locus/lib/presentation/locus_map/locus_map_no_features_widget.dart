import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class LocusMapNoFeaturesWidget extends StatelessWidget {
  const LocusMapNoFeaturesWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: PlatformTextWidget(
          FluttemisAppLocalizations.of(context)!.noDataToBeDisplayedOnTheMap,
          textType: TextType.title,
          fontSize: 15,
        ),
      );
}
