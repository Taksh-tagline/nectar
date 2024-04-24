import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nectar/features/const/color.dart';
import 'package:nectar/features/const/images.dart';
import 'package:nectar/features/const/lists/card_list.dart';
import 'package:nectar/features/const/lists/cart_list_of_product.dart';
import 'package:nectar/features/const/lists/find_product_list.dart';
import 'package:nectar/features/const/string.dart';
import 'package:nectar/features/models/card_model.dart';
import 'package:nectar/features/models/hive/banner_hive_model.dart';
import 'package:nectar/features/models/hive/explore_hive_model.dart';
import 'package:nectar/features/models/hive/groceries_hive_model.dart';
import 'package:nectar/features/models/hive/non_veg_hive_model.dart';
import 'package:nectar/features/models/hive/sell_hive_model.dart';

import '../const/shared_preferences.dart';
import '../models/hive/card_hive_model.dart';
import '../widgets/methods/methods.dart';
import 'credentials/sign_in.dart';
import 'home/home_screen.dart';
import 'onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // CollectionReference offerCollection =
  //     FirebaseFirestore.instance.collection('offer');
  //
  // CollectionReference nonVegReference =
  //     FirebaseFirestore.instance.collection('nonVeg');
  //
  // CollectionReference sellReference =
  //     FirebaseFirestore.instance.collection('sell');
  //
  // CollectionReference groceriesReference =
  //     FirebaseFirestore.instance.collection('groceries');
  //
  // CollectionReference bannerReference =
  //     FirebaseFirestore.instance.collection('banner');

  // bool _isDataSendedToFirebase = false;
  //
  // Future<void> _sendOfferDataToFirebase() async {
  //   for (int i = 0; i < cardList.length; i++) {
  //     await offerCollection.add(CardModel(
  //       title: cardList[i].title,
  //       subtitle: cardList[i].subtitle,
  //       image: cardList[i].image,
  //       price: cardList[i].price,
  //       productDetails: cardList[i].productDetails,
  //       nutrition: cardList[i].nutrition,
  //       quantity: cardList[i].quantity,
  //       isFavourite: cardList[i].isFavourite,
  //       review: cardList[i].review,
  //       isAlreadyInBasket: cardList[i].isAlreadyInBasket,
  //       productId: '',
  //     ).toJson());
  //   }
  // }

  // Future<void> _sendImageToFirebaseStorage() async {
  //   final storageRef = FirebaseStorage.instance.ref();
  //
  //   final mountainsRef = storageRef.child('apple.png');
  //
  //   final appleImageRef = storageRef.child('images/apple.png');
  //   //
  //   // Directory appDocDir = await getApplicationDocumentsDirectory();
  //   //
  //   // print('Path: ===> ${rootBundle.toString()}');
  //
  //   var fileName = 'assets/icons/google.png';
  //   // var fileName = ImageConst.salted;
  //
  //   ByteData byteData = await rootBundle.load(fileName);
  //
  //   Uint8List rawData = byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
  //
  //   try {
  //     FirebaseStorage.instance.ref('$fileName').putData(rawData);
  //   } catch (e, s) {
  //     print(s);
  //   }
  // }
  //
  // Future<void> _sendSellDataToFirebase() async {
  //   for (int i = 0; i < cardList.length; i++) {
  //     await sellReference.add(CardModel(
  //       title: sellList[i].title,
  //       subtitle: sellList[i].subtitle,
  //       image: sellList[i].image,
  //       price: sellList[i].price,
  //       productDetails: sellList[i].productDetails,
  //       nutrition: sellList[i].nutrition,
  //       quantity: sellList[i].quantity,
  //       isFavourite: sellList[i].isFavourite,
  //       review: sellList[i].review,
  //       isAlreadyInBasket: sellList[i].isAlreadyInBasket,
  //       productId: '',
  //     ).toJson());
  //   }
  // }
  //
  // Future<void> _sendNonVegDataToFirebase() async {
  //   for (int i = 0; i < cardList.length; i++) {
  //     await nonVegReference.add(CardModel(
  //       title: nonVegList[i].title,
  //       subtitle: nonVegList[i].subtitle,
  //       image: nonVegList[i].image,
  //       price: nonVegList[i].price,
  //       productDetails: nonVegList[i].productDetails,
  //       nutrition: nonVegList[i].nutrition,
  //       quantity: nonVegList[i].quantity,
  //       isFavourite: nonVegList[i].isFavourite,
  //       review: nonVegList[i].review,
  //       isAlreadyInBasket: nonVegList[i].isAlreadyInBasket,
  //       productId: '',
  //     ).toJson());
  //   }
  // }
  //
  // Future<void> _sendBannerDataToFirebase() async {
  //   for (int i = 0; i < bannerList.length; i++) {
  //     await bannerReference.add(BannerModel(
  //       title: bannerList[i].title,
  //       subTitle: bannerList[i].subTitle,
  //       image: bannerList[i].image,
  //     ).toJson());
  //   }
  // }
  //
  // Future<void> _sendGroceriesDataToFirebase() async {
  //   for (int i = 0; i < groceriesList.length; i++) {
  //     await groceriesReference.add(GroceriesModel(
  //       image: groceriesList[i].image,
  //       title: groceriesList[i].title,
  //       color: groceriesList[i].color,
  //     ).toJson());
  //   }
  // }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      // _fetchGroceriesDataFromFirebase();
      // _fetchBannerDataFromFirebase();
      // _fetchNonVegDataFromFirebase();
      // _fetchSellDataFromFirebase();
      // _fetchOfferDataFromFirebase();
      // //
      // // vegetables
      // _fetchAllExplore(
      //         StringConst.vegetableCategory,
      //         StringConst.vegetableCategoryData,
      //         StringConst.vegetableCategoryId)
      //     .then((value) {
      //   print('Success to fetch vegetables and store inside hive');
      // });
      //
      // // oil
      // _fetchAllExplore(StringConst.oilCategory, StringConst.oilCategoryData,
      //         StringConst.oilCategoryId)
      //     .then((value) {
      //   print('Success to fetch oil and store inside hive');
      // });
      //
      // // meat
      // _fetchAllExplore(StringConst.meatCategory, StringConst.meatCategoryData,
      //         StringConst.meatCategoryId)
      //     .then((value) {
      //   print('Success to fetch meat and store inside hive');
      // });
      //
      // // bakery
      // _fetchAllExplore(StringConst.bakeryCategory,
      //         StringConst.bakeryCategoryData, StringConst.bakeryCategoryId)
      //     .then((value) {
      //   print('Success to fetch bakery and store inside hive');
      // });
      //
      // // dairy
      // _fetchAllExplore(StringConst.dairyCategory, StringConst.dairyCategoryData,
      //         StringConst.dairyCategoryId)
      //     .then((value) {
      //   print('Success to fetch dairy and store inside hive');
      // });
      //
      // // beverages
      // _fetchAllExplore(
      //         StringConst.beveragesCategory,
      //         StringConst.beveragesCategoryData,
      //         StringConst.beveragesCategoryId)
      //     .then((value) {
      //   print('Success to fetch beverages and store inside hive');
      // });
      //
      // // snacks
      // _fetchAllExplore(StringConst.snacksCategory,
      //         StringConst.snacksCategoryData, StringConst.snacksCategoryId)
      //     .then((value) {
      //   print('Success to fetch snacks and store inside hive');
      // });
      //
      // // soaps
      // _fetchAllExplore(StringConst.soapsCategory, StringConst.soapsCategoryData,
      //         StringConst.soapsCategoryId)
      //     .then((value) {
      //   print('Success to fetch soaps and store inside hive');
      // });
      //
      // // 0 -> vegetables
      // // 1 --> oil
      // // 2 --> meat
      // // 3 --> bakery
      // // 4 --> dairy
      // // 5 --> beverages
      // // 6 --> snacks
      // // 7 --> soaps

      await _fillAllTheList().then((value) async {
        bool? onBoardingStatus =
            await SharedPreferencesHelper.getOnBoardingStatus();
        print("=============> $onBoardingStatus");
        // await SharedPreferencesHelper.setUserLoggedInStatus(false);

        bool? loggedInStatus =
            await SharedPreferencesHelper.getUserLoggedInStatus();
        print("User Status =====>: $loggedInStatus");

        // manage the user is visit particular screen or not using shared preferences
        if (loggedInStatus == null) {
          onBoardingStatus == null
              ? nextScreenReplace(
                  context: context, nextScreen: const OnBoardingScreen())
              : nextScreenReplace(context: context, nextScreen: SignInScreen());
        } else {
          if (loggedInStatus == false) {
            onBoardingStatus == null
                ? nextScreenReplace(
                    context: context, nextScreen: const OnBoardingScreen())
                : nextScreenReplace(
                    context: context, nextScreen: SignInScreen());
          } else {
            nextScreenReplace(context: context, nextScreen: HomePage());
          }
        }
        print('List fill success');
      });
    });
  }

  Future<void> _fillAllTheList() async {
    // fill the offer List
    var offerBox = await Hive.openBox(StringConst.offerHive);
    for (int i = 0; i < offerBox.length; i++) {
      cardList.add(offerBox.getAt(i));
    }

    // fill the sell list
    var sellBox = await Hive.openBox(StringConst.sellHive);

    for (int i = 0; i < sellBox.length; i++) {
      sellList.add(sellBox.getAt(i));
    }

    // fill the nonVeg list
    var nonVegBox = await Hive.openBox(StringConst.nonVegHive);

    for (int i = 0; i < nonVegBox.length; i++) {
      nonVegList.add(nonVegBox.getAt(i));
    }

    // fill the banner list
    var bannerBox = await Hive.openBox(StringConst.bannerHive);

    for (int i = 0; i < bannerBox.length; i++) {
      bannerList.add(bannerBox.getAt(i));
    }

    // fill the groceries list
    var groceriesBox = await Hive.openBox(StringConst.groceriesHive);

    for (int i = 0; i < groceriesBox.length; i++) {
      groceriesList.add(groceriesBox.getAt(i));
    }

    // fill the Explore list
    var exploreBox = await Hive.openBox(StringConst.exploreHive);

    for (int i = 0; i < 8; i++) {
      // length now ---> 1
      print('Index ====> $i');
      findProductsList.add(exploreBox.getAt(i));
    }

    FirebaseFirestore.instance
        .collection(StringConst.userDataCollection)
        .doc(_auth.currentUser?.uid)
        .collection(StringConst.cartCollection)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        cartListOfProduct.add(CardModel(
          title: element.data()['title'],
          subtitle: element.data()['subtitle'],
          image: element.data()['image'],
          price: element.data()['price'],
          productDetails: element.data()['productDetails'],
          nutrition: Nutrition(
            calories: element.data()['nutrition']['calories'],
            vitamin: element.data()['nutrition']['vitamin'],
            fibar: element.data()['nutrition']['fibar'],
          ),
          quantity: element.data()['quantity'],
          isFavourite: element.data()['isFavourite'],
          review: element.data()['review'],
          isAlreadyInBasket: element.data()['isAlreadyInBasket'],
          productId: element.data()['productId'],
          category: element.data()['category'],
        ));
      });
    });

    // fill the filter list

    for (int i = 0; i < findProductsList.length; i++) {
      for (int j = 0; j < findProductsList[i].listProduct.length; j++) {
        filterList.add(CardExploreModel(
          title: findProductsList[i].listProduct[j].title,
          subtitle: findProductsList[i].listProduct[j].subtitle,
          image: findProductsList[i].listProduct[j].image,
          price: findProductsList[i].listProduct[j].price,
          productDetails: findProductsList[i].listProduct[j].productDetails,
          nutrition: NutritionHiveModel(
            calories: findProductsList[i].listProduct[j].nutrition.calories,
            vitamin: findProductsList[i].listProduct[j].nutrition.vitamin,
            fibar: findProductsList[i].listProduct[j].nutrition.fibar,
          ),
          quantity: findProductsList[i].listProduct[j].quantity,
          isFavourite: findProductsList[i].listProduct[j].isFavourite,
          review: findProductsList[i].listProduct[j].review,
          isAlreadyInBasket:
              findProductsList[i].listProduct[j].isAlreadyInBasket,
          productId: findProductsList[i].listProduct[j].productId,
          category: findProductsList[i].listProduct[j].category,
        ));
      }
    }
  }

  Future<void> _fetchOfferDataFromFirebase() async {
    var box = await Hive.openBox(StringConst.offerHive);

    print("Hello outside");
    FirebaseFirestore.instance
        .collection(StringConst.offerCollection)
        .get()
        .then((snapshot) async {
      print("Hello inside");

      for (var element in snapshot.docs) {
        CardHiveModel cardModel = CardHiveModel(
          title: element.data()['title'],
          subtitle: element.data()['subtitle'],
          image: element.data()['image'],
          price: element.data()['price'],
          productDetails: element.data()['productDetails'],
          nutrition: NutritionHiveModel(
            calories: element.data()['nutrition']['calories'],
            vitamin: element.data()['nutrition']['vitamin'],
            fibar: element.data()['nutrition']['fibar'],
          ),
          quantity: element.data()['quantity'],
          isFavourite: element.data()['isFavourite'],
          review: element.data()['review'],
          isAlreadyInBasket: element.data()['isAlreadyInBasket'],
          productId: element.data()['productId'],
          category: element.data()['category'],
        );

        await box.put(cardModel.productId, cardModel).then((value) {
          print('...........offer data added to offerHive........');
        });
      }
    });
  }

  Future<void> _fetchSellDataFromFirebase() async {
    var box = await Hive.openBox(StringConst.sellHive);

    print("Hello outside");
    FirebaseFirestore.instance
        .collection(StringConst.sellCollection)
        .get()
        .then((snapshot) async {
      print("Hello inside");

      for (var element in snapshot.docs) {
        SellHiveModel cardModel = SellHiveModel(
          title: element.data()['title'],
          subtitle: element.data()['subtitle'],
          image: element.data()['image'],
          price: element.data()['price'],
          productDetails: element.data()['productDetails'],
          nutrition: SellNutritionHiveModel(
            calories: element.data()['nutrition']['calories'],
            vitamin: element.data()['nutrition']['vitamin'],
            fibar: element.data()['nutrition']['fibar'],
          ),
          quantity: element.data()['quantity'],
          isFavourite: element.data()['isFavourite'],
          review: element.data()['review'],
          isAlreadyInBasket: element.data()['isAlreadyInBasket'],
          productId: element.data()['productId'],
          category: element.data()['category'],
        );

        await box.put(cardModel.productId, cardModel).then((value) {
          print('...........offer data added to offerHive........');
        });
      }
    });
  }

  Future<void> _fetchNonVegDataFromFirebase() async {
    var box = await Hive.openBox(StringConst.nonVegHive);

    print("Hello outside");
    FirebaseFirestore.instance
        .collection(StringConst.nonVegCollection)
        .get()
        .then((snapshot) async {
      print("Hello inside");

      for (var element in snapshot.docs) {
        NonVegHiveModel cardModel = NonVegHiveModel(
          title: element.data()['title'],
          subtitle: element.data()['subtitle'],
          image: element.data()['image'],
          price: element.data()['price'],
          productDetails: element.data()['productDetails'],
          nutrition: NonVegNutritionHiveModel(
            calories: element.data()['nutrition']['calories'],
            vitamin: element.data()['nutrition']['vitamin'],
            fibar: element.data()['nutrition']['fibar'],
          ),
          quantity: element.data()['quantity'],
          isFavourite: element.data()['isFavourite'],
          review: element.data()['review'],
          isAlreadyInBasket: element.data()['isAlreadyInBasket'],
          productId: element.data()['productId'],
          category: element.data()['category'],
        );

        await box.put(cardModel.productId, cardModel).then((value) {
          print('...........offer data added to offerHive........');
        });
      }
    }).then((value) {
      for (int i = 0; i < box.length; i++) {
        print(box.getAt(i).title);
      }
    });
  }

  Future<void> _fetchBannerDataFromFirebase() async {
    var box = await Hive.openBox(StringConst.bannerHive);

    print("Hello outside");
    FirebaseFirestore.instance
        .collection(StringConst.bannerCollection)
        .get()
        .then((snapshot) async {
      print("Hello inside");

      for (var element in snapshot.docs) {
        BannerHiveModel bannerModel = BannerHiveModel(
          title: element.data()['title'],
          subTitle: element.data()['subTitle'],
          image: element.data()['image'],
        );

        await box.put(element.id, bannerModel).then((value) {
          print('...........offer data added to offerHive........');
        });
      }
    }).then((value) {
      for (int i = 0; i < box.length; i++) {
        print(box.getAt(i).title);
      }
    });
  }

  Future<void> _fetchGroceriesDataFromFirebase() async {
    var box = await Hive.openBox(StringConst.groceriesHive);

    print("Hello outside");
    FirebaseFirestore.instance
        .collection(StringConst.groceriesCollection)
        .get()
        .then((snapshot) async {
      print("Hello inside");

      for (var element in snapshot.docs) {
        GroceriesHiveModel bannerModel = GroceriesHiveModel(
          title: element.data()['title'],
          image: element.data()['image'],
          color: element.data()['color'],
        );

        await box.put(element.id, bannerModel).then((value) {
          print('...........offer data added to offerHive........');
        });
      }
    }).then((value) {
      for (int i = 0; i < box.length; i++) {
        print(box.getAt(i).title);
      }
    });
  }

  Future<void> _fetchAllExplore(
      String category, String categoryData, String categoryDocId) async {
    var box = await Hive.openBox(StringConst.exploreHive);

    print("Hello outside");
    var oilCategory = await FirebaseFirestore.instance
        .collection(StringConst.exploreCollection)
        .doc('YmUJoVh3Xs2OmAwqG3Bb')
        .collection(category)
        .doc(categoryDocId) // change
        .get();

    List<CardExploreModel> tempList = [];

    await FirebaseFirestore.instance
        .collection(StringConst.exploreCollection)
        .doc('YmUJoVh3Xs2OmAwqG3Bb')
        .collection(category)
        .doc(categoryDocId)
        .collection(categoryData)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        tempList.add(CardExploreModel(
          title: element.data()['title'],
          subtitle: element.data()['subtitle'],
          image: element.data()['image'],
          price: element.data()['price'],
          productDetails: element.data()['productDetails'],
          nutrition: NutritionHiveModel(
            calories: element.data()['nutrition']['calories'],
            vitamin: element.data()['nutrition']['vitamin'],
            fibar: element.data()['nutrition']['fibar'],
          ),
          quantity: element.data()['quantity'],
          isFavourite: element.data()['isFavourite'],
          review: element.data()['review'],
          isAlreadyInBasket: element.data()['isAlreadyInBasket'],
          productId: element.data()['productId'],
          category: element.data()['category'],
        ));
      });
    });

    box
        .put(
            oilCategory.id,
            ExploreHiveModel(
              color: oilCategory.data()?['color'],
              image: oilCategory.data()?['image'],
              title: oilCategory.data()?['title'],
              listProduct: tempList,
            ))
        .then((value) => print('success'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      body: Center(
        child: Image.asset(ImageConst.appLogo),
      ),
    );
  }
}
