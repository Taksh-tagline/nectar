import 'package:flutter/material.dart';
import 'package:nectar/features/const/lists/cart_list_of_product.dart';
import 'package:nectar/features/const/lists/find_product_list.dart';
import 'package:nectar/features/models/card_model.dart';

import '../../const/color.dart';
import '../../widgets/tap_icon.dart';

class ProductDetailsQuantityWithPrice extends StatefulWidget {
  const ProductDetailsQuantityWithPrice({
    super.key,
    required this.cardModel,
    required this.index,
    required this.subIndex,
  });

  final CardModel cardModel;
  final int index;
  final int subIndex;

  @override
  State<ProductDetailsQuantityWithPrice> createState() =>
      _ProductDetailsQuantityWithPriceState();
}

class _ProductDetailsQuantityWithPriceState
    extends State<ProductDetailsQuantityWithPrice> {
  bool _isLoading = false;
  double? a;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    a = double.parse(widget.cardModel.price) / widget.cardModel.quantity;
    // singleProductPrice =
    // double.parse(widget.cardModel.price) / widget.cardModel.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Image.asset(ImageConst.shop),
            TapIcon(
              icon: 'assets/icons/details/minus.png',
              onTap: () {
                setState(() {
                  if (widget.cardModel.quantity > 1) {
                    print(widget.cardModel.quantity--);

                    int quantity = findProductsList[widget.index]
                        .listProduct[widget.subIndex]
                        .quantity = findProductsList[widget.index]
                            .listProduct[widget.subIndex]
                            .quantity -
                        1;

                    String productId = findProductsList[widget.index]
                        .listProduct[widget.subIndex]
                        .productId;

                    print(widget.cardModel.price = (a! * quantity).toString());

                    for (int i = 0; i < cartListOfProduct.length; i++) {
                      if (cartListOfProduct[i].productId == productId) {
                        cartListOfProduct[i].quantity = quantity - 1;
                      }
                    }
                  }
                });
                print('Tapped minus');
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                border: Border.all(color: ColorConst.lightGreyColor),
              ),
              child: Center(
                  child: Text(
                widget.cardModel.quantity.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: ColorConst.titleTextColor,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ),
            const SizedBox(
              width: 10,
            ),
            TapIcon(
              icon: 'assets/icons/details/add.png',
              onTap: () {
                setState(() {
                  print(widget.cardModel.quantity++);
                  int quantity = findProductsList[widget.index]
                      .listProduct[widget.subIndex]
                      .quantity = findProductsList[widget.index]
                          .listProduct[widget.subIndex]
                          .quantity +
                      1;

                  String productId = findProductsList[widget.index]
                      .listProduct[widget.subIndex]
                      .productId;

                  print(widget.cardModel.price = (a! * quantity).toString());

                  for (int i = 0; i < cartListOfProduct.length; i++) {
                    if (cartListOfProduct[i].productId == productId) {
                      cartListOfProduct[i].quantity = quantity;
                    }
                  }
                });
                print('Tapped add');
              },
            ),
          ],
        ),
        Column(
          children: [
            Text(
              // '\$ ${double.parse(widget.cardModel.price) / widget.cardModel.quantity}',
              '$a',
              style: const TextStyle(
                fontSize: 22,
                color: ColorConst.titleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Total \$ ${widget.cardModel.price}',
              style: const TextStyle(
                fontSize: 14,
                color: ColorConst.lightGreyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
