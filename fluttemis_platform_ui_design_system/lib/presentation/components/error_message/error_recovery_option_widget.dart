import 'package:flutter/widgets.dart';

class ErrorRecoveryOptionWidget extends StatelessWidget {
  final Widget child;

  const ErrorRecoveryOptionWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 7,
        child: child,
      );
}
