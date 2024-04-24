import 'package:flutter/material.dart';

class TapIcon extends StatelessWidget {
  const TapIcon(
      {super.key,
      required this.icon,
      this.color,
      required this.onTap,
      this.height,
      this.width});

  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
            height: height ?? 20.0,
            width: width ?? 20.0,
            child: Image.asset(
              icon,
              color: color,
            )));
  }
}
