import 'package:flutter/widgets.dart';

class TopMenuToolIconWidget extends StatelessWidget {
  final Widget child;

  const TopMenuToolIconWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 105,
        child: child,
      );
}