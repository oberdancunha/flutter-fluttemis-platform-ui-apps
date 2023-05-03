import 'package:flutter/material.dart';

class TopMenuToolIconWidget extends StatelessWidget {
  final Widget child;

  const TopMenuToolIconWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: child,
      );
}
