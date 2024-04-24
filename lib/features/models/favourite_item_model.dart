class FavouriteItemModel {
  String productId;
  String category;

  FavouriteItemModel({required this.productId, required this.category});

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'category': category,
      };
}
