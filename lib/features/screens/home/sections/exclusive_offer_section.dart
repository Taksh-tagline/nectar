import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nectar/features/const/lists/card_list.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/models/card_model.dart';

import '../../../widgets/components_home/card_tile.dart';
import '../../../widgets/methods/methods.dart';
import '../../product_details/product_details.dart';

class ExclusiveOfferSection extends StatefulWidget {
  const ExclusiveOfferSection({super.key});

  @override
  State<ExclusiveOfferSection> createState() => _ExclusiveOfferSectionState();
}

class _ExclusiveOfferSectionState extends State<ExclusiveOfferSection> {
  final Stream<QuerySnapshot> _offerReference =
      FirebaseFirestore.instance.collection('offer').snapshots();

  late Box offerBox;
  @override
  void initState() {
    super.initState();
    print("hello");
    offerBox = Hive.box(StringConst.offerHive);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardList.length,
        itemBuilder: (context, index) {
          var data = cardList[index];

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
                      category: '',
                    ),
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
