import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  const HoverButton({
    Key? key,
    required this.child,
    this.shape = BoxShape.rectangle,
    this.clickable = true,
    this.hoverColor,
  }) : super(key: key);

  final Widget child;
  final bool clickable;
  final BoxShape shape;
  final Color? hoverColor;

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final clickable = widget.clickable;
    final hoverColor =
        widget.hoverColor?.withOpacity(0.12) ?? Theme.of(context).hoverColor;
    return MouseRegion(
        onEnter: (_) {
          if (!clickable) return;
          setState(() {
            _hovered = true;
          });
        },
        onExit: (_) {
          if (!clickable) return;
          setState(() {
            _hovered = false;
          });
        },
        cursor: clickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: Container(
          foregroundDecoration: BoxDecoration(
            color: _hovered ? hoverColor : null,
            shape: widget.shape,
          ),
          child: widget.child,
        ));
  }
}
