import 'package:hive/hive.dart';

part 'sell_hive_model.g.dart';

@HiveType(typeId: 2)
class SellHiveModel {
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
  SellNutritionHiveModel nutrition;

  @HiveField(8)
  int review;

  @HiveField(9)
  bool isAlreadyInBasket;

  @HiveField(10)
  String productId;

  @HiveField(11)
  String category;

  SellHiveModel({
    required this.title,
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
    required this.category,
  });
}

@HiveType(typeId: 3)
class SellNutritionHiveModel {
  @HiveField(0)
  String calories;

  @HiveField(1)
  String vitamin;

  @HiveField(2)
  String fibar;

  SellNutritionHiveModel({
    required this.calories,
    required this.vitamin,
    required this.fibar,
  });
}
