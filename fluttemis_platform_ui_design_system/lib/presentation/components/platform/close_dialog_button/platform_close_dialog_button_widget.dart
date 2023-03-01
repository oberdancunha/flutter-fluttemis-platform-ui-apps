import '../core/platform_widget.dart';
import 'macos_close_dialog_button_widget.dart';
import 'material_close_dialog_button_widget.dart';
import 'windows_close_dialog_button_widget.dart';

class PlatformCloseDialogButtonWidget extends PlatformWidget<MacosCloseDialogButtonWidget,
    WindowsCloseDialogButtonWidget, MaterialCloseDialogButtonWidget> {
  const PlatformCloseDialogButtonWidget({super.key});

  @override
  MacosCloseDialogButtonWidget buildMacosWidget() => const MacosCloseDialogButtonWidget();

  @override
  WindowsCloseDialogButtonWidget buildWindowsWidget() => const WindowsCloseDialogButtonWidget();

  @override
  MaterialCloseDialogButtonWidget buildMaterialWidget() => const MaterialCloseDialogButtonWidget();
}
