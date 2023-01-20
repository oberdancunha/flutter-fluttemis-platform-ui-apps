import 'package:flutter/material.dart';

class FocusWidget extends StatefulWidget {
  final Widget child;
  final Color baseColor;
  final Color focusColor;

  const FocusWidget({
    required this.child,
    required this.baseColor,
    required this.focusColor,
    super.key,
  });

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  late bool _focused;
  late bool _hovering;

  @override
  void initState() {
    super.initState();
    _focused = false;
    _hovering = false;
  }

  void _handleFocusHighlight(bool value) {
    setState(() {
      _focused = value;
    });
  }

  void _handleHoveHighlight(bool value) {
    setState(() {
      _hovering = value;
    });
  }

  Color get color {
    Color baseColor = widget.baseColor;
    if (_focused) {
      baseColor = Color.alphaBlend(baseColor.withOpacity(0.25), widget.focusColor);
    }
    if (_hovering) {
      baseColor = Color.alphaBlend(baseColor.withOpacity(0), widget.focusColor);
    }

    return baseColor;
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => FocusableActionDetector(
          onShowFocusHighlight: _handleFocusHighlight,
          onShowHoverHighlight: _handleHoveHighlight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  color: color,
                  border: (_focused || _hovering)
                      ? Border.all(
                          color: const Color(0XFF3B76D6),
                        )
                      : null,
                ),
                child: widget.child,
              ),
            ],
          ),
        ),
      );
}
