import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../const/images.dart';
import '../tap_icon.dart';

class AccountCustomTile extends StatefulWidget {
  const AccountCustomTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  State<AccountCustomTile> createState() => _AccountCustomTileState();
}

class _AccountCustomTileState extends State<AccountCustomTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: TapIcon(
                icon: widget.icon,
                onTap: () {},
                height: 20,
                width: 18,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                color: ColorConst.titleTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: TapIcon(
                icon: ImageConst.nextIcon,
                onTap: () {},
                height: 14,
                width: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
