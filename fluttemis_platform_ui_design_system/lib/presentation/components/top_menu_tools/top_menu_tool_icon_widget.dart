import 'package:flutter/widgets.dart';

class TopMenuToolIconWidget extends StatelessWidget {
  final Widget child;

  const TopMenuToolIconWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.08,
        child: child,
      );
}
