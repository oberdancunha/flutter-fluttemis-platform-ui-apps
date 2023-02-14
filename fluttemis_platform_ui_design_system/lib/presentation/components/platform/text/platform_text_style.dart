import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform.dart';
import 'text_type_enum.dart';

TextStyle getPlatformTextStyle(BuildContext context, TextType textType) {
  final currentPlatform = getCurrentPlatform();
  switch (currentPlatform) {
    case CurrentPlatform.isMacOS:
      return _getMacosTextStyle(context, textType);
    case CurrentPlatform.isWindows:
      return _getWindowsTextStyle(context, textType);
    case CurrentPlatform.isLinux:
      return _getMaterialTextStyle(context, textType);
  }
}

TextStyle _getMacosTextStyle(BuildContext context, TextType textType) {
  switch (textType) {
    case TextType.mainTitle:
      return MacosTheme.of(context).typography.title1;
    case TextType.title:
      return MacosTheme.of(context).typography.title1.copyWith(
            color: MacosTheme.of(context).primaryColor,
          );
    case TextType.subTitle:
      return MacosTheme.of(context).typography.title2;
    case TextType.error:
      return MacosTheme.of(context).typography.title3.copyWith(
            color: MacosColors.appleRed,
          );
    case TextType.caption:
      return MacosTheme.of(context).typography.caption1.copyWith(
            color: MacosColors.systemGrayColor,
          );
    case TextType.label:
      return MacosTheme.of(context).typography.caption1.copyWith(
            color: const MacosColor(0xFF323130),
          );
    case TextType.genomeName:
      return MacosTheme.of(context).typography.title2.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          );
  }
}

TextStyle _getWindowsTextStyle(BuildContext context, TextType textType) {
  switch (textType) {
    case TextType.mainTitle:
      return fluent_ui.FluentTheme.of(context).typography.title!;
    case TextType.title:
      return fluent_ui.FluentTheme.of(context).typography.title!.copyWith(
            color: fluent_ui.FluentTheme.of(context).accentColor,
          );
    case TextType.subTitle:
      return fluent_ui.FluentTheme.of(context).typography.subtitle!;
    case TextType.error:
      return fluent_ui.FluentTheme.of(context).typography.body!.copyWith(
            color: fluent_ui.Colors.red,
          );
    case TextType.caption:
      return fluent_ui.FluentTheme.of(context).typography.caption!.copyWith(
            color: fluent_ui.Colors.grey[90],
          );
    case TextType.label:
      return fluent_ui.FluentTheme.of(context).typography.caption!;
    case TextType.genomeName:
      return fluent_ui.FluentTheme.of(context).typography.subtitle!.copyWith(
            fontStyle: FontStyle.italic,
          );
  }
}

TextStyle _getMaterialTextStyle(BuildContext context, TextType textType) {
  switch (textType) {
    case TextType.mainTitle:
      return material.Theme.of(context).textTheme.titleLarge!;
    case TextType.title:
      return material.Theme.of(context).textTheme.titleLarge!.copyWith(
            color: material.Theme.of(context).primaryColor,
          );
    case TextType.subTitle:
      return material.Theme.of(context).textTheme.subtitle1!;
    case TextType.error:
      return material.Theme.of(context).textTheme.displaySmall!.copyWith(
            color: material.Theme.of(context).errorColor,
          );
    case TextType.caption:
      return material.Theme.of(context).textTheme.caption!.copyWith(
            color: material.Colors.grey.shade500,
          );
    case TextType.label:
      return material.Theme.of(context).textTheme.caption!;
    case TextType.genomeName:
      return material.Theme.of(context).textTheme.titleLarge!.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          );
  }
}
