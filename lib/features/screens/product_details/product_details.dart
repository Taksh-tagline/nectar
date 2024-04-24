import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/lists/cart_list_of_product.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/screens/product_details/product_details_expansion_tile.dart';
import 'package:nectar/features/screens/product_details/product_details_header.dart';
import 'package:nectar/features/screens/product_details/product_details_nutritions_expansion_tile.dart';
import 'package:nectar/features/screens/product_details/product_details_quantity_with_price.dart';
import 'package:nectar/features/screens/product_details/product_details_review_expansion_tile.dart';
import 'package:nectar/features/screens/product_details/product_details_title_with_favourite_btn.dart';
import 'package:nectar/features/widgets/custom_button.dart';

import '../../models/card_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails(
      {super.key,
      required this.cardModel,
      required this.index,
      required this.subIndex});

  final CardModel cardModel;
  final int index;
  final int subIndex;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _pageController = PageController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsHeader(
              pageController: _pageController,
              cardModel: widget.cardModel,
            ),
            const SizedBox(
              height: ColorConst.kDefaultPadding / 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ColorConst.kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsTitleWithFavouriteBtn(
                    cardModel: widget.cardModel,
                  ),
                  Text(
                    widget.cardModel.subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ColorConst.lightGreyColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: ColorConst.kDefaultPadding + 10,
                  ),
                  ProductDetailsQuantityWithPrice(
                    cardModel: widget.cardModel,
                    index: widget.index,
                    subIndex: widget.subIndex,
                  ),
                  const SizedBox(
                    height: ColorConst.kDefaultPadding,
                  ),
                  const Divider(
                    color: ColorConst.cardTileBorderColor,
                  ),
                  ProductDetailsExpansionTile(
                    cardModel: widget.cardModel,
                  ),
                  const Divider(
                    color: ColorConst.cardTileBorderColor,
                  ),
                  ProductDetailsNutritionExpansionTile(
                    cardModel: widget.cardModel,
                  ),
                  const Divider(
                    color: ColorConst.cardTileBorderColor,
                  ),
                  ProductDetailsReviewExpansionTile(
                    cardModel: widget.cardModel,
                  ),
                  const SizedBox(
                    height: ColorConst.kDefaultPadding / 2,
                  ),
                  CustomButton(
                    title: 'Add To Basket',
                    color: ColorConst.primaryColor,
                    onTap: () {
                      final currentUser = FirebaseAuth.instance;
                      cartListOfProduct.add(widget.cardModel);

                      FirebaseFirestore.instance
                          .collection(StringConst.userDataCollection)
                          .doc(_auth.currentUser!.uid)
                          .collection(StringConst.cartCollection)
                          .add(widget.cardModel.toJson())
                          .then((value) {
                        Fluttertoast.showToast(
                          msg: 'Item added to cart',
                        );
                      });
                    },
                  ),
                  const SizedBox(
                    height: ColorConst.kDefaultPadding / 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
