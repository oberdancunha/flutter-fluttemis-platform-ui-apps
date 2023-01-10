import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform.dart';

Color getPlatformColor(int value) {
  final currentPlatform = getCurrentPlatform();
  switch (currentPlatform) {
    case CurrentPlatform.isMacOS:
      return MacosColor(value);
    case CurrentPlatform.isWindows:
      return fluent_ui.Color(value);
    case CurrentPlatform.isLinux:
      return material.Color(value);
  }
}
