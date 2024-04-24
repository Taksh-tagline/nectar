import 'package:flutter/material.dart';
import 'package:nectar/features/models/card_model.dart';

import '../../const/color.dart';
import '../../widgets/tap_icon.dart';

class ProductDetailsNutritionExpansionTile extends StatefulWidget {
  const ProductDetailsNutritionExpansionTile(
      {super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  State<ProductDetailsNutritionExpansionTile> createState() =>
      _ProductDetailsNutritionExpansionTileState();
}

class _ProductDetailsNutritionExpansionTileState
    extends State<ProductDetailsNutritionExpansionTile> {
  bool _isNutritionsuExpansionTile = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        child: ExpansionTile(
          title: const Text('Nutritions',
              style: TextStyle(
                fontSize: 16,
                color: ColorConst.titleTextColor,
                fontWeight: FontWeight.w600,
              )),
          trailing: SizedBox(
            width: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(2.0),
                  height: 20,
                  width: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xffEBEBEB),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      widget.cardModel.nutrition.calories,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 9,
                        color: ColorConst.lightGreyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                _isNutritionsuExpansionTile
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: TapIcon(
                          width: 15,
                          height: 15,
                          icon: 'assets/icons/details/down.png',
                          onTap: () {},
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: TapIcon(
                          width: 9,
                          height: 14,
                          icon: 'assets/icons/details/next.png',
                          onTap: () {},
                        ),
                      ),
              ],
            ),
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isNutritionsuExpansionTile = expanded;
            });
          },
          expandedAlignment: Alignment.centerLeft,
          children: [
            Text(
              'Calories: ${widget.cardModel.nutrition.calories}.\nVitamin C: ${widget.cardModel.nutrition.vitamin} (DV)\nFiber: ${widget.cardModel.nutrition.fibar}',
              style: const TextStyle(
                fontSize: 13,
                color: ColorConst.lightGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
