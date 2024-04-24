import 'package:hive/hive.dart';

part 'card_hive_model.g.dart';

@HiveType(typeId: 0)
class CardHiveModel {
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

  CardHiveModel({
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

@HiveType(typeId: 1)
class NutritionHiveModel {
  @HiveField(0)
  String calories;

  @HiveField(1)
  String vitamin;

  @HiveField(2)
  String fibar;

  NutritionHiveModel({
    required this.calories,
    required this.vitamin,
    required this.fibar,
  });
}
