import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final Color? color;

  const Circle({
    super.key,
    required this.height,
    required this.width,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? const Color(0xff6a62b7),
        borderRadius: BorderRadius.circular(300),
      ),
      child: child,
    );
  }
}
