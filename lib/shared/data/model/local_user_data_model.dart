class LocalUserData {
  String? token;
  final int id;

  LocalUserData({required this.token, required this.id});
  //from json
  factory LocalUserData.fromJson(Map<String, dynamic> json) {
    return LocalUserData(
      token: json['token'],
      id: json['id'],
    );
  }
  //copy with
  LocalUserData copyWith({
    String? token,
    int? id,
  }) {
    return LocalUserData(
      token: token ?? this.token,
      id: id ?? this.id,
    );
  }

//to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}
