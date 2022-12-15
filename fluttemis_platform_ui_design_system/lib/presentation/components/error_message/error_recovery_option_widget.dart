import 'package:flutter/widgets.dart';

class ErrorRecoveryOptionWidget extends StatelessWidget {
  final Widget child;

  const ErrorRecoveryOptionWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 230,
        width: 230,
        child: child,
      );
}
