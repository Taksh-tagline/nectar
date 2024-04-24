import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/lists/cart_list_of_product.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/models/card_model.dart';
import 'package:nectar/features/models/hive/card_hive_model.dart';
import 'package:nectar/features/widgets/components_favourites/favourite_tile.dart';
import 'package:nectar/features/widgets/custom_button.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Future<void> _loadTheFavouriteData() async {
    final box = await Hive.openBox(StringConst.favouriteHive);

    favouriteListOfProduct.clear();
    for (int i = 0; i < box.length; i++) {
      print(box.getAt(i)['quantity'].runtimeType);
      print(box.getAt(i)['quantity']);

      favouriteListOfProduct.add(CardHiveModel(
        title: box.getAt(i)['title'],
        subtitle: box.getAt(i)['subtitle'],
        image: box.getAt(i)['image'],
        price: box.getAt(i)['price'],
        productDetails: box.getAt(i)['productDetails'],
        nutrition: NutritionHiveModel(
          calories: box.getAt(i)['calories'],
          vitamin: box.getAt(i)['vitamin'],
          fibar: box.getAt(i)['fibar'],
        ),
        quantity: box.getAt(i)['quantity'],
        isFavourite: box.getAt(i)['isFavourite'],
        review: box.getAt(i)['review'],
        isAlreadyInBasket: box.getAt(i)['isAlreadyInBasket'],
        productId: box.getAt(i)['productId'],
        category: box.getAt(i)['category'],
      ));
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _loadTheFavouriteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Favourite',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: ColorConst.titleTextColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const Divider(
                color: ColorConst.dividerColor,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 220,
                  child: ListView.separated(
                    itemCount: favouriteListOfProduct.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = favouriteListOfProduct[index];
                      return FavouriteTile(
                        image: data.image[0],
                        title: data.title,
                        subtitle: data.subtitle,
                        price: data.price,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: ColorConst.dividerColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Divider(
                color: ColorConst.dividerColor,
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: MediaQuery.of(context).size.width * 0.055,
            child: CustomButton(
              title: 'Add All to cart',
              color: ColorConst.primaryColor,
              onTap: () {
                for (int i = 0; i < favouriteListOfProduct.length; i++) {
                  var data = favouriteListOfProduct[i];
                  cartListOfProduct.add(CardModel(
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
                    productId: data.title,
                    category: data.title,
                  ));

                  FirebaseFirestore.instance
                      .collection(StringConst.userDataCollection)
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .collection(StringConst.cartCollection)
                      .doc(data.productId)
                      .set(CardModel(
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
                        productId: data.title,
                        category: data.title,
                      ).toJson())
                      .then((value) {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
