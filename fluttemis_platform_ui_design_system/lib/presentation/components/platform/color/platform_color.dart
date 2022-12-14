import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';

Color getPlatformColor(int value) {
  if (Platform.isIOS || Platform.isMacOS) {
    return MacosColor(value);
  } else if (Platform.isWindows) {
    return fluent_ui.Color(value);
  }

  return material.Color(value);
}
