class RefreshTokenModel {
  late int? id;
  late String owner;
  late String token;
  
  RefreshTokenModel({
    this.id,
    required this.owner,
    required this.token,
  });

    factory RefreshTokenModel.fromSQL(List<dynamic> row) {
    return RefreshTokenModel(
        id: row[0],
        owner: row[1],
        token: row[2]
    );
  }


  RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    token = json['token'];
  }
}
