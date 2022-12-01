import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

class LottieLoadingWidget extends StatefulWidget {
  final String lottieJsonFile;

  const LottieLoadingWidget({
    required this.lottieJsonFile,
    super.key,
  });

  @override
  State<LottieLoadingWidget> createState() => _LottieLoadingWidgetState();
}

class _LottieLoadingWidgetState extends State<LottieLoadingWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Lottie.asset(
        widget.lottieJsonFile,
        alignment: Alignment.center,
        controller: _animationController,
        frameRate: FrameRate.composition,
        onLoaded: (composition) => _animationController
          ..duration = composition.duration
          ..forward(),
      );
}
