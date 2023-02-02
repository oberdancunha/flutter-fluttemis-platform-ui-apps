import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class LocusResumeTotalWidget extends StatelessWidget {
  final int total;

  const LocusResumeTotalWidget({
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 25,
        child: Row(
          children: [
            Image.asset(
              'assets/images/data/total_locus.png',
            ),
            PlatformTextWidget(
              total.toString(),
              textType: TextType.title,
              fontSize: 14,
            ),
            const PlatformTextWidget(
              ' locus',
              textType: TextType.label,
              fontSize: 12,
            ),
          ],
        ),
      );
}
