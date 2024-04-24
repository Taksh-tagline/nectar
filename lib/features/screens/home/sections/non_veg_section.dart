import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nectar/features/const/lists/card_list.dart';

import '../../../models/card_model.dart';
import '../../../widgets/components_home/card_tile.dart';
import '../../../widgets/methods/methods.dart';
import '../../product_details/product_details.dart';

class NonVegSection extends StatefulWidget {
  const NonVegSection({super.key});

  @override
  State<NonVegSection> createState() => _NonVegSectionState();
}

class _NonVegSectionState extends State<NonVegSection> {
  final Stream<QuerySnapshot> _nonVegReference =
      FirebaseFirestore.instance.collection('nonVeg').snapshots();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nonVegList.length,
        itemBuilder: (context, index) {
          var data = nonVegList[index];

          return GestureDetector(
            onTap: () {
              print('Tapped $index');
              nextScreen(
                  context: context,
                  nextScreen: ProductDetails(
                    cardModel: CardModel(
                        title: data.title,
                        subtitle: data.subtitle,
                        image: data.image,
                        price: data.price,
                        productDetails: data.productDetails,
                        nutrition: Nutrition(
                          calories: data.nutrition.calories,
                          vitamin: data.nutrition.vitamin,
                          fibar: data.nutrition.fibar,
                        ),
                        quantity: data.quantity,
                        isFavourite: data.isFavourite,
                        review: data.review,
                        isAlreadyInBasket: data.isAlreadyInBasket,
                        productId: data.productId,
                        category: ''),
                    index: index,
                    subIndex: index,
                  ));
            },
            child: CardTile(
              title: data.title,
              subTitle: data.subtitle,
              price: data.price,
              onTap: () {},
              image: data.image[0],
            ),
          );
        },
      ),
    );
  }
}
