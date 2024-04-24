import 'package:flutter/material.dart';

import '../../const/color.dart';

class BottomSheetCustomTile extends StatelessWidget {
  const BottomSheetCustomTile({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leading,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: ColorConst.lightGreyColor),
        ),
        const Spacer(),
        trailing,
        const Icon(
          Icons.navigate_next,
          color: Color(0xff181725),
        ),
      ],
    );
  }
}
