import 'card_model.dart';

class FindProductModel {
  String image, title;
  String color;
  List<CardModel> listProduct;

  FindProductModel({
    required this.color,
    required this.image,
    required this.title,
    required this.listProduct,
  });

  factory FindProductModel.fromJson(Map<String, dynamic> json) {
    return FindProductModel(
      color: json['color'],
      image: json['image'],
      title: json['title'],
      listProduct: List<CardModel>.from(json['listProduct'].map((e) => e)),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'color': color,
        'listProduct': List<CardModel>.from(listProduct.map((e) => e)),
      };
}
