import 'package:flutter/material.dart';

class RightPanel extends StatelessWidget {
  final double width;
  final Widget child;

  const RightPanel({
    Key? key,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, child: child);
  }
}
