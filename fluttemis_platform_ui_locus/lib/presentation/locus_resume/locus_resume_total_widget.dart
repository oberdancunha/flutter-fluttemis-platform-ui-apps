import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/label_text_style.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/title_text_style.dart';
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
            const SizedBox(width: 7),
            PlatformTextWidget(
              total.toString(),
              textStyle: TitleTextStyle(),
              fontSize: 14,
            ),
            PlatformTextWidget(
              ' locus',
              textStyle: LabelTextStyle(),
              fontSize: 12,
            ),
          ],
        ),
      );
}
