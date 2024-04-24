class GroceriesModel {
  String image, title;
  String color;

  GroceriesModel(
      {required this.image, required this.title, required this.color});

  factory GroceriesModel.fromJson(Map<String, dynamic> json) {
    return GroceriesModel(
      color: json['color'],
      image: json['image'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'color': color,
      };
}
