import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';

class GroceriesTile extends StatelessWidget {
  const GroceriesTile(
      {super.key,
      required this.image,
      required this.title,
      required this.color});

  final String image, title;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        height: 105,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          // color: color.withOpacity(0.25),
          color: Color(int.parse(color)).withOpacity(0.25),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 71,
                width: 71,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              width: ColorConst.kDefaultPadding / 2,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: ColorConst.groceriesTileTextColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
