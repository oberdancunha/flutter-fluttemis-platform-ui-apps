import 'package:flutter/widgets.dart';

class MainFilePickerBody extends StatelessWidget {
  final double height;
  final double width;
  final String openFileMessage;
  final Widget platformIconButton;
  final TextStyle platformMessageTheme;

  const MainFilePickerBody({
    required this.height,
    required this.width,
    required this.platformIconButton,
    required this.openFileMessage,
    required this.platformMessageTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
              ),
            ),
            child: platformIconButton,
          ),
          const SizedBox(height: 20),
          Text(
            openFileMessage,
            style: platformMessageTheme,
          ),
        ],
      );
}
