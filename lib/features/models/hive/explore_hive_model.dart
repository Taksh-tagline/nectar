import 'package:hive_flutter/adapters.dart';

import 'card_hive_model.dart';

part 'explore_hive_model.g.dart';

@HiveType(typeId: 8)
class ExploreHiveModel {
  @HiveField(0)
  String image;

  @HiveField(1)
  String title;

  @HiveField(2)
  String color;

  @HiveField(3)
  List<CardExploreModel> listProduct;

  ExploreHiveModel({
    required this.color,
    required this.image,
    required this.title,
    required this.listProduct,
  });
}

@HiveType(typeId: 9)
class CardExploreModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  String price;

  @HiveField(3)
  List<dynamic> image;

  @HiveField(4)
  bool isFavourite;

  @HiveField(5)
  int quantity;

  @HiveField(6)
  String productDetails;

  @HiveField(7)
  NutritionHiveModel nutrition;

  @HiveField(8)
  int review;

  @HiveField(9)
  bool isAlreadyInBasket;

  @HiveField(10)
  String productId;

  @HiveField(11)
  String category;

  CardExploreModel(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.price,
      required this.productDetails,
      required this.nutrition,
      required this.quantity,
      required this.isFavourite,
      required this.review,
      required this.isAlreadyInBasket,
      required this.productId,
      required this.category});
}
