import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar/features/widgets/components_cart/increment_decrement_btn.dart';

import '../../const/color.dart';

class CartTile extends StatefulWidget {
  const CartTile({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.quantity,
    required this.onTap,
  });

  final String image, title, subTitle, price, quantity;
  final VoidCallback onTap;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 65,
            child: Image.network(
              widget.image,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorConst.titleTextColor,
                            fontWeight: FontWeight.bold,
                          )),
                      IconButton(
                          onPressed: widget.onTap,
                          // onPressed: () {
                          //   print(cartListOfProduct);
                          //   print('tapped');
                          //   cartListOfProduct.removeAt(widget.index);
                          //   print(cartListOfProduct);
                          // },
                          icon: const Icon(
                            Icons.clear,
                            size: 19,
                          ))
                    ],
                  ),
                ),
                Text(widget.subTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColorConst.lightGreyColor,
                      fontWeight: FontWeight.w600,
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const IncrementDecrementBtn(
                        icon: CupertinoIcons.minus,
                        iconColor: ColorConst.lightGreyColor,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(widget.quantity),
                      const SizedBox(
                        width: 20,
                      ),
                      const IncrementDecrementBtn(
                        icon: CupertinoIcons.add,
                        iconColor: ColorConst.primaryColor,
                      ),
                      const Spacer(),
                      Text(
                        '\$ ${widget.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: ColorConst.titleTextColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
