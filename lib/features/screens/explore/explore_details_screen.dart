import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar/features/const/lists/find_product_list.dart';
import 'package:nectar/features/models/card_model.dart';
import 'package:nectar/features/screens/product_details/product_details.dart';
import 'package:nectar/features/widgets/components_home/card_tile.dart';
import 'package:nectar/features/widgets/methods/methods.dart';
import 'package:nectar/features/widgets/tap_icon.dart';

import '../../const/color.dart';

class ExploreDetailsScreen extends StatefulWidget {
  const ExploreDetailsScreen({super.key, required this.index});

  final int index;

  @override
  State<ExploreDetailsScreen> createState() => _ExploreDetailsScreenState();
}

class _ExploreDetailsScreenState extends State<ExploreDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 30,
            color: ColorConst.titleTextColor,
          ),
        ),
        title: Text(
          findProductsList[widget.index].title,
          style: const TextStyle(
            fontSize: 20,
            color: ColorConst.titleTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TapIcon(
                height: 15,
                width: 15,
                icon: 'assets/icons/filter.png',
                onTap: () {
                  print('Filter tapped');
                }),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10),
        child: GridView.builder(
            itemCount: findProductsList[widget.index].listProduct.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 0,
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    print('Tapped');
                    nextScreen(
                      context: context,
                      nextScreen: ProductDetails(
                        cardModel: CardModel(
                          title: findProductsList[widget.index]
                              .listProduct[index]
                              .title,
                          subtitle: findProductsList[widget.index]
                              .listProduct[index]
                              .subtitle,
                          image: findProductsList[widget.index]
                              .listProduct[index]
                              .image,
                          price: findProductsList[widget.index]
                              .listProduct[index]
                              .price,
                          productDetails: findProductsList[widget.index]
                              .listProduct[index]
                              .productDetails,
                          nutrition: Nutrition(
                            calories: findProductsList[widget.index]
                                .listProduct[index]
                                .nutrition
                                .calories,
                            vitamin: findProductsList[widget.index]
                                .listProduct[index]
                                .nutrition
                                .vitamin,
                            fibar: findProductsList[widget.index]
                                .listProduct[index]
                                .nutrition
                                .fibar,
                          ),
                          quantity: findProductsList[widget.index]
                              .listProduct[index]
                              .quantity,
                          isFavourite: findProductsList[widget.index]
                              .listProduct[index]
                              .isFavourite,
                          review: findProductsList[widget.index]
                              .listProduct[index]
                              .review,
                          isAlreadyInBasket: findProductsList[widget.index]
                              .listProduct[index]
                              .isAlreadyInBasket,
                          productId: findProductsList[widget.index]
                              .listProduct[index]
                              .productId,
                          category: findProductsList[widget.index]
                              .listProduct[index]
                              .category,
                        ),
                        index: widget.index,
                        subIndex: index,
                      ),
                    );
                  },
                  child: CardTile(
                    title:
                        findProductsList[widget.index].listProduct[index].title,
                    subTitle: findProductsList[widget.index]
                        .listProduct[index]
                        .subtitle,
                    price:
                        findProductsList[widget.index].listProduct[index].price,
                    onTap: () {},
                    image: findProductsList[widget.index]
                        .listProduct[index]
                        .image[0],
                  ));
            }),
      ),
    );
  }
}
