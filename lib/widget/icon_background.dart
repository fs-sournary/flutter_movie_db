import 'package:flutter/material.dart';

class IconBackground extends StatelessWidget {
  const IconBackground({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.4, vertical: 8.5),
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: child,
    );
  }
}
