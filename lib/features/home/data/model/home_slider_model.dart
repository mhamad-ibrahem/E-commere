class HomeSliderModel {
  final int id;
  final String image;
  final String url;

  HomeSliderModel({
    required this.id,
    required this.image,
    required this.url,
  });

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) {
    return HomeSliderModel(
      id: json['id'],
      image: json['image'],
      url: json['url_link'],
    );
  }
}
