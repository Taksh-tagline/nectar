import 'package:flutter/material.dart';
import 'package:nectar/features/widgets/tap_icon.dart';

class StarTile extends StatelessWidget {
  const StarTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          TapIcon(
            icon: 'assets/icons/details/star.png',
            onTap: () {},
            height: 14,
            width: 14,
          ),
          TapIcon(
            icon: 'assets/icons/details/star.png',
            onTap: () {},
            height: 14,
            width: 14,
          ),
          TapIcon(
            icon: 'assets/icons/details/star.png',
            onTap: () {},
            height: 14,
            width: 14,
          ),
          TapIcon(
            icon: 'assets/icons/details/star.png',
            onTap: () {},
            height: 14,
            width: 14,
          ),
          TapIcon(
            icon: 'assets/icons/details/star.png',
            onTap: () {},
            height: 14,
            width: 14,
          ),
        ],
      ),
    );
  }
}
