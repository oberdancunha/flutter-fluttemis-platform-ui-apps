import 'package:fluttemis_platform_ui_core/domain/strand_type.dart';
import 'package:flutter/widgets.dart';

import '../core/platform_style.dart';

class PlatformBorderRadiusToDrawFeature extends PlatformStyle<BorderRadius> {
  final StrandType featureStrand;

  PlatformBorderRadiusToDrawFeature(this.featureStrand);

  @override
  BorderRadius getMacosStyle() => featureStrand == StrandType.upstream
      ? const BorderRadius.only(
          topLeft: Radius.circular(2),
          bottomLeft: Radius.circular(2),
        )
      : const BorderRadius.only(
          topRight: Radius.circular(2),
          bottomRight: Radius.circular(2),
        );

  @override
  BorderRadius getWindowsStyle() => BorderRadius.zero;

  @override
  BorderRadius getMaterialStyle() => BorderRadius.circular(5);
}
