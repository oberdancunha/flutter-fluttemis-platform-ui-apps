import 'package:flutter/widgets.dart';

class FilePickerPage extends StatelessWidget {
  final String fileTypeMessage;
  final List<String> allowedExtensions;
  final String route;

  const FilePickerPage({
    required this.fileTypeMessage,
    required this.allowedExtensions,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) => const SizedBox();
}
