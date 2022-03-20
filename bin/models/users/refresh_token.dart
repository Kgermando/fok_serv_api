class RefreshTokenModel {
  late int? id;
  late int owner;
  late String token;
  
  RefreshTokenModel({
    required this.id,
    required this.owner,
    required this.token,
  });

  RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    token = json['token'];
  }

  
}
