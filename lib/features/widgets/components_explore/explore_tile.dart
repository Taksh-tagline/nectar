import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';

class ExploreTile extends StatelessWidget {
  const ExploreTile(
      {super.key,
      required this.image,
      required this.title,
      required this.color});

  final String image, title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      height: 190,
      width: 170,
      decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(
            color: color,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 90,
            child: Image.network(image),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: ColorConst.titleTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
