class HomeProductsModel {
  final int id;
  final String image;
  final String name;

  HomeProductsModel(
      {required this.id, required this.image, required this.name});

  factory HomeProductsModel.fromJson(Map<String, dynamic> json) {
    return HomeProductsModel(
        id: json['id'], image: json['image'], name: json['name']);
  }
}
