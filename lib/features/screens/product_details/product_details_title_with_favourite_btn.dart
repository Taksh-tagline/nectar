import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/models/card_model.dart';

import '../../const/color.dart';
import '../../widgets/tap_icon.dart';

class ProductDetailsTitleWithFavouriteBtn extends StatefulWidget {
  const ProductDetailsTitleWithFavouriteBtn({
    super.key,
    required this.cardModel,
  });

  final CardModel cardModel;

  @override
  State<ProductDetailsTitleWithFavouriteBtn> createState() =>
      _ProductDetailsTitleWithFavouriteBtnState();
}

class _ProductDetailsTitleWithFavouriteBtnState
    extends State<ProductDetailsTitleWithFavouriteBtn> {
  bool _isFavourite = false;
  bool _isProductAlreadyPresent = false;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Timer? timer;
  bool debouncer = false;

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _checkAlreadyPresent();
  }

  void _checkAlreadyPresent() async {
    final data = await _firestore
        .collection(StringConst.userDataCollection)
        .doc(_auth.currentUser!.uid)
        .collection(StringConst.favouritesCollection)
        .get();

    data.docs.forEach((element) {
      if (element.data()['productId'] == widget.cardModel.productId) {
        setState(() {
          _isProductAlreadyPresent = true;
          _isFavourite = true;
        });
      }
    });
  }

  void toggleFavourite(
      {required String productId, required String productCategory}) async {
    // FirebaseFirestore.instance.collection(StringConst.exploreCollection)
    //     .doc(StringConst.exploreCategoryId)
    //     .collection(productCategory)
    //     .doc()
    //     .collection(giveSubCollectionName(productCategory))
    //     .doc(giveCollectionDocumentId(productCategory))
    //     .

    // String uid = FirebaseAuth.instance.currentUser!.uid;
    // FirebaseFirestore.instance
    //     .collection(StringConst.userData)
    //     .doc(uid)
    //     .collection(StringConst.favouritesCollection)
    //     .add(
    //       FavouriteItemModel(
    //         productId: productId,
    //         category: productCategory,
    //       ).toJson(),
    //     );

    // setState(() {
    //   _isFavourite = !_isFavourite;
    //   print(_isFavourite);
    //
    // });

    Map<String, String> favouriteProductDetails = {
      'productId': productId,
      'category': productCategory,
    };

    setState(() {
      _isFavourite = !_isFavourite; // true
      print(_isFavourite);

      if (timer != null && timer!.isActive) {
        timer?.cancel();
      }

      timer = Timer(const Duration(milliseconds: 500), () {
        // wait 500 millisecond
        // perform the certain action
        setState(() {
          if (_isFavourite) {
            print('add');
            if (!_isProductAlreadyPresent) {
              addTheFavouriteItem(favouriteProductDetails);
            }
          } else {
            print('delete');

            if (_isProductAlreadyPresent) {
              deleteTheFavouriteItem(productId);
            }
          }
        });
      });
    });
  }

  void addTheFavouriteItem(Map<String, String> favouriteProductDetails) async {
    _firestore
        .collection(StringConst.userDataCollection)
        .doc(_auth.currentUser!.uid)
        .collection(StringConst.favouritesCollection)
        .add(favouriteProductDetails);

    final box = await Hive.openBox(StringConst.favouriteHive);

    box.put(
      favouriteProductDetails['productId'],
      {
        'title': widget.cardModel.title,
        'subtitle': widget.cardModel.subtitle,
        'image': widget.cardModel.image,
        'price': widget.cardModel.price,
        'productDetails': widget.cardModel.productDetails,
        'calories': widget.cardModel.nutrition.calories,
        'vitamin': widget.cardModel.nutrition.vitamin,
        'fibar': widget.cardModel.nutrition.fibar,
        'quantity': widget.cardModel.quantity,
        'isFavourite': widget.cardModel.isFavourite,
        'review': widget.cardModel.review,
        'isAlreadyInBasket': widget.cardModel.isAlreadyInBasket,
        'productId': widget.cardModel.productId,
        'category': widget.cardModel.category,
      },
    );

    // favouriteListOfProduct.add(widget.cardModel);
    // print(favouriteListOfProduct);
  }

  Future<void> deleteTheFavouriteItem(String productId) async {
    final data = _firestore
        .collection(StringConst.userDataCollection)
        .doc()
        .collection(StringConst.favouritesCollection);

    final query = await data.where('productId', isEqualTo: productId).get();

    for (final doc in query.docs) {
      await doc.reference.delete();
    }

    final box = await Hive.openBox(StringConst.favouriteHive);

    for (int i = 0; i < box.length; i++) {
      if (productId == box.getAt(i)) {
        box.delete(productId);
      }
    }

    // for (int i = 0; i < favouriteListOfProduct.length; i++) {
    //   if (productId == favouriteListOfProduct[i].productId) {
    //     favouriteListOfProduct.removeAt(i);
    //     print(favouriteListOfProduct);
    //   }
    // }
  }

  String giveSubCollectionName(String productCategory) {
    switch (productCategory) {
      case StringConst.vegetableCategory:
        return '${StringConst.vegetableCategory}Data';
      case StringConst.oilCategory:
        return '${StringConst.oilCategory}Data';
      case StringConst.meatCategory:
        return '${StringConst.meatCategory}Data';
      case StringConst.bakeryCategory:
        return '${StringConst.bakeryCategory}Data';
      case StringConst.dairyCategory:
        return '${StringConst.dairyCategory}Data';
      case StringConst.beveragesCategory:
        return '${StringConst.beveragesCategory}Data';
      case StringConst.snacksCategory:
        return '${StringConst.snacksCategory}Data';
      case StringConst.soapsCategory:
        return '${StringConst.soapsCategory}Data';
      default:
        return '';
    }
  }

  String giveCollectionDocumentId(String productCategory) {
    switch (productCategory) {
      case StringConst.vegetableCategory:
        return 'yDOQfx4tdzC8yNQOlHRe';
      case StringConst.oilCategory:
        return 'vmxBnyDHXOoBXE2s5m2I';
      case StringConst.meatCategory:
        return 'sxuZ5dhB5UAnRNKEyXpV';
      case StringConst.bakeryCategory:
        return 'R8rKkFhDvKMaR1a2wcQ6';
      case StringConst.dairyCategory:
        return 'CGnVsMaYyK7GOT6yElVg';
      case StringConst.beveragesCategory:
        return 'JRMqfTn0IFs7wpsf6PHs';
      case StringConst.snacksCategory:
        return 'WbXZMzdAbYy3BXuHzLEj';
      case StringConst.soapsCategory:
        return 'ZPffJhqin0ogGpoO2IRv';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.cardModel.title,
          style: const TextStyle(
            fontSize: 24,
            color: ColorConst.titleTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        TapIcon(
          icon: _isFavourite == true
              ? 'assets/icons/details/favourite-filled.png'
              : 'assets/icons/details/favourite.png',
          height: 24,
          width: 24,
          onTap: () {
            toggleFavourite(
              productId: widget.cardModel.productId,
              productCategory: widget.cardModel.category,
            );
          },
        ),
      ],
    );
  }
}
