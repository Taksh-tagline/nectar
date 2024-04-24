import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../models/card_model.dart';
import '../../widgets/tap_icon.dart';

class ProductDetailsExpansionTile extends StatefulWidget {
  const ProductDetailsExpansionTile({super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  State<ProductDetailsExpansionTile> createState() =>
      _ProductDetailsExpansionTileState();
}

class _ProductDetailsExpansionTileState
    extends State<ProductDetailsExpansionTile> {
  bool _isProductDetailExpansionTile = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        child: ExpansionTile(
          title: const Text('Product Detail',
              style: TextStyle(
                fontSize: 16,
                color: ColorConst.titleTextColor,
                fontWeight: FontWeight.w600,
              )),
          trailing: _isProductDetailExpansionTile
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
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isProductDetailExpansionTile = expanded;
            });
          },
          children: [
            Text(
              widget.cardModel.productDetails,
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
