import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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
  late bool _on;
  late final Map<Type, Action<Intent>> _actionMap;
  late final Map<ShortcutActivator, Intent> _shortcutMap;

  @override
  void initState() {
    super.initState();
    _focused = false;
    _hovering = false;
    _on = false;
    _actionMap = <Type, Action<Intent>>{
      ActivateIntent: CallbackAction<Intent>(
        onInvoke: (intent) => _toggleState(),
      ),
    };
    _shortcutMap = const <ShortcutActivator, Intent>{
      SingleActivator(LogicalKeyboardKey.keyX): ActivateIntent(),
    };
  }

  void _toggleState() {
    setState(() {
      _on = !_on;
    });
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
          actions: _actionMap,
          shortcuts: _shortcutMap,
          onShowFocusHighlight: _handleFocusHighlight,
          onShowHoverHighlight: _handleHoveHighlight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: color,
                child: widget.child,
              ),
              ColoredBox(
                color: _on ? widget.baseColor.withRed(100) : widget.baseColor.withAlpha(0),
              ),
            ],
          ),
        ),
      );
}
