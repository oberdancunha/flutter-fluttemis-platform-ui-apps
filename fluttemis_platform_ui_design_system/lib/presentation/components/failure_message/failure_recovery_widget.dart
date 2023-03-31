import 'package:flutter/widgets.dart';

class FailureRecoveryWidget extends StatelessWidget {
  final Widget child;

  const FailureRecoveryWidget({
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
