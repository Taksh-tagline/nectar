import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/images.dart';
import 'package:nectar/features/const/lists/cart_list_of_product.dart';
import 'package:nectar/features/screens/order/order_success_screen.dart';
import 'package:nectar/features/widgets/components_cart/cart_tile.dart';
import 'package:nectar/features/widgets/custom_button.dart';
import 'package:nectar/features/widgets/methods/methods.dart';
import 'package:nectar/features/widgets/tap_icon.dart';

import '../../widgets/components_cart/bottom_sheet_custom_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        elevation: 0,
        isDismissible: true,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 25,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'CheckOut',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: TapIcon(
                          icon: ImageConst.closeIcon,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Color(0xfff2e2e2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const BottomSheetCustomTile(
                        leading: 'Delivery',
                        trailing: Text(
                          'Select Method',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff181725),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: ColorConst.dividerColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BottomSheetCustomTile(
                        leading: 'Promo code',
                        trailing: TapIcon(
                          icon: 'assets/icons/mastercard.png',
                          onTap: () {},
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Color(0xfff2e2e2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const BottomSheetCustomTile(
                        leading: 'Promo code',
                        trailing: Text(
                          'Pick Discount',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff181725),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Color(0xfff2e2e2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const BottomSheetCustomTile(
                        leading: 'Total cost',
                        trailing: Text(
                          '\$ 13.77',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff181725),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Color(0xfff2e2e2),
                      ),
                      const Text(
                        'By placing an order you agree to our',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff7c7c7c)),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Terms',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xff181725)),
                          ),
                          Text(
                            'And',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xff7c7c7c)),
                          ),
                          Text(
                            'Conditions',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xff181725)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: 'Place Order',
                  color: ColorConst.primaryColor,
                  onTap: () {
                    nextScreen(
                        context: context,
                        nextScreen: const OrderSuccessScreen());
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.builder(
                itemCount: cartListOfProduct.length,
                itemBuilder: (context, index) {
                  var data = cartListOfProduct[index];
                  return CartTile(
                    image: data.image[0],
                    title: data.title,
                    subTitle: data.subtitle,
                    price: data.price,
                    quantity: data.quantity.toString(),
                    onTap: () {
                      setState(() {
                        cartListOfProduct.removeAt(index);
                        // FirebaseFirestore.instance.collection(StringConst.userDataCollection)
                        // .
                      });
                    },
                  );
                }),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    title: 'Checkout',
                    color: ColorConst.primaryColor,
                    onTap: () {
                      print('Tapped');
                      double total = 0;

                      _showBottomSheet();
                    })),
          ],
        ),
      ),
    );
  }
}
