class CardModel {
  String title, subtitle, price;
  List<dynamic> image;
  bool isFavourite;
  int quantity;
  String productDetails;
  Nutrition nutrition;
  int review;
  bool isAlreadyInBasket;
  String productId;
  String category;

  CardModel({
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

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      title: json['title'],
      subtitle: json['subtitle'],
      image: List<String>.from(json['image'].map((e) => e)),
      price: json['price'],
      productDetails: json['productDetails'],
      nutrition: Nutrition.fromJson(json['nutrition']),
      quantity: json['quantity'],
      isFavourite: json['isFavourite'],
      review: json['review'],
      isAlreadyInBasket: json['isAlreadyInBasket'],
      productId: json['productId'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'image': List<String>.from(image.map((e) => e)),
        'price': price,
        'productDetails': productDetails,
        'nutrition': nutrition.toJson(),
        'quantity': quantity,
        'isFavourite': isFavourite,
        'review': review,
        'isAlreadyInBasket': isAlreadyInBasket,
        'productId': productId,
        'category': category,
      };
}

class Nutrition {
  String calories, vitamin, fibar;

  Nutrition({
    required this.calories,
    required this.vitamin,
    required this.fibar,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      calories: json['calories'],
      vitamin: json['vitamin'],
      fibar: json['fibar'],
    );
  }

  Map<String, dynamic> toJson() => {
        'calories': calories,
        'vitamin': vitamin,
        'fibar': fibar,
      };
}
