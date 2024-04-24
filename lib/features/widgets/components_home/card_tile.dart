import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';

class CardTile extends StatefulWidget {
  const CardTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.onTap,
      required this.image});

  final String image, title, subTitle, price;
  final VoidCallback onTap;

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0, left: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        height: 250,
        width: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(
            color: ColorConst.cardTileBorderColor,
            strokeAlign: BorderSide.strokeAlignOutside,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 125,
              width: 175,
              child: Image.network(
                widget.image,
              ),
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                color: ColorConst.titleTextColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gilroy',
              ),
            ),
            Text(
              widget.subTitle,
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'Gilroy',
                color: ColorConst.lightGreyColor,
              ),
            ),
            const SizedBox(
              height: ColorConst.kDefaultPadding / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${widget.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: ColorConst.titleTextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 45.67,
                    width: 45.67,
                    decoration: BoxDecoration(
                      color: ColorConst.primaryColor,
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: ColorConst.lightWhite,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
