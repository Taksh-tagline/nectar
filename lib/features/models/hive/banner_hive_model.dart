import 'package:hive_flutter/adapters.dart';

part 'banner_hive_model.g.dart';

@HiveType(typeId: 6)
class BannerHiveModel {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  String image;

  BannerHiveModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
