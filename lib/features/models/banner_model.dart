class BannerModel {
  String title, subTitle, image;

  BannerModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
        title: json['title'], subTitle: json['subTitle'], image: json['image']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'subTitle': subTitle,
        'image': image,
      };
}
