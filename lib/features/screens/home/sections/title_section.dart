import 'package:flutter/material.dart';

import '../../../const/color.dart';

class TitleSection extends StatelessWidget {
  const TitleSection(
      {super.key, required this.leadingTitle, required this.trailingTitle});

  final String leadingTitle, trailingTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingTitle,
          style: const TextStyle(
            fontSize: 24,
            color: ColorConst.titleTextColor,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gilroy',
          ),
        ),
        Text(
          trailingTitle,
          style: const TextStyle(
            fontSize: 16,
            color: ColorConst.primaryColor,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gilroy',
          ),
        ),
      ],
    );
  }
}
