import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

mixin ClipboardWatcherMixin<T extends StatefulWidget> on State<T> implements ClipboardListener {
  final clipboardCopy = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    clipboardWatcher
      ..addListener(this)
      ..start();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onClipboardChanged();
    });
  }

  @override
  void dispose() {
    clipboardWatcher
      ..removeListener(this)
      ..stop();
    clipboardCopy.dispose();
    super.dispose();
  }

  @override
  Future<void> onClipboardChanged() async {
    clipboardCopy.value = (await Clipboard.getData(Clipboard.kTextPlain))?.text ?? '';
  }
}
