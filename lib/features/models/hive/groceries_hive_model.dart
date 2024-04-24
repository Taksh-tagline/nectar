import 'package:hive/hive.dart';

part 'groceries_hive_model.g.dart';

@HiveType(typeId: 7)
class GroceriesHiveModel {
  @HiveField(0)
  String image;

  @HiveField(1)
  String title;

  @HiveField(2)
  String color;

  GroceriesHiveModel(
      {required this.image, required this.title, required this.color});
}
