import 'package:flutter/material.dart';
import 'package:nectar/features/screens/product_details/star_tile.dart';

import '../../const/color.dart';
import '../../models/card_model.dart';
import '../../widgets/tap_icon.dart';

class ProductDetailsReviewExpansionTile extends StatefulWidget {
  const ProductDetailsReviewExpansionTile({super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  State<ProductDetailsReviewExpansionTile> createState() =>
      _ProductDetailsReviewExpansionTileState();
}

class _ProductDetailsReviewExpansionTileState
    extends State<ProductDetailsReviewExpansionTile> {
  bool _isReviewExpansionTile = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        child: ExpansionTile(
          title: const Text('Review',
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
                const StarTile(),
                const SizedBox(
                  width: 20,
                ),
                _isReviewExpansionTile
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
              _isReviewExpansionTile = expanded;
            });
          },
          children: const [
            Text(
              'I try this food. and the task was delicious, i have no world to express my felling. Services was Time to time. I give you suggestion just try single time. it is worth it.',
              style: TextStyle(
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
