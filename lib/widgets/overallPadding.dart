import 'package:flutter/material.dart';

class OverallPadding extends StatelessWidget {
  final Widget child;
  final double? bottom;
  final double? top;
  final double? left;
  final double? right;

  const OverallPadding({
    Key? key,
    required this.child,
    this.bottom,
    this.top,
    this.left,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        left: left ?? width / 40,
        right: right ?? width / 40,
        top: top ?? height / 40,
        bottom: bottom ?? height / 40,
      ),
      child: child,
    );
  }
}
