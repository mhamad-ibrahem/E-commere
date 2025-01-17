class CustomBasicModel {
  CustomBasicModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.parentPrincedomId,
  });

  final int id;
  final String nameAr;
  final String nameEn;
  final int? parentPrincedomId;
  factory CustomBasicModel.fromJson(Map<String, dynamic> json) {
    return CustomBasicModel(
      id: json['id'],
      nameAr: json['arabicName']?? json['ar_title']??json['nameArabic'],
      nameEn: json['name']??json['en_title']??json['nameEnglish'],
      parentPrincedomId: json['parentPrincedomId'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['arabicName'] = nameAr;
    data['name'] = nameEn;
    data['parentPrincedomId'] = parentPrincedomId;
    return data;
  }
}
