import 'package:flutter/material.dart';

import '../../const/color.dart';

class IncrementDecrementBtn extends StatelessWidget {
  const IncrementDecrementBtn(
      {super.key, required this.icon, required this.iconColor});

  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.0),
          color: ColorConst.lightWhite,
          border: Border.all(
            color: ColorConst.cardTileBorderColor,
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
