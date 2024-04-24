import 'package:flutter/material.dart';

import '../../const/color.dart';

class FavouriteTile extends StatelessWidget {
  const FavouriteTile(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.price});

  final String image, title, subtitle, price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          // Padding(
          // padding: const EdgeInsets.only(
          //     left: 8.0, right: 20.0, top: 5.0, bottom: 5.0),
          // child:
          SizedBox(width: 50, child: Image.network(image)),
      // ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: ColorConst.titleTextColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy',
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 13,
          color: ColorConst.lightGreyColor,
          fontWeight: FontWeight.w600,
          fontFamily: 'Gilroy',
        ),
      ),
      trailing: SizedBox(
        // color: Colors.red,
        width: MediaQuery.of(context).size.width * 0.200,
        child: Row(
          children: [
            Text(
              '\$ $price',
              style: const TextStyle(
                fontSize: 16,
                color: ColorConst.titleTextColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gilroy',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.navigate_next,
                color: ColorConst.titleTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
