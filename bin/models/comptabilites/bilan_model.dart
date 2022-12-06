class BilanModel {
  late int? id;
  late String titleBilan;
  late String signature;
  late DateTime created;
  late String isSubmit; 
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  BilanModel(
    {this.id,
      required this.titleBilan,
      required this.signature,
      required this.created,
      required this.isSubmit, 
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory BilanModel.fromSQL(List<dynamic> row) {
    return BilanModel(
        id: row[0],
        titleBilan: row[1],
        signature: row[2],
        created: row[3],
        isSubmit: row[4],
        approbationDD: row[5],
        motifDD: row[6],
        signatureDD: row[7] );
  }

  factory BilanModel.fromJson(Map<String, dynamic> json) {
    return BilanModel(
        id: json['id'],
        titleBilan: json['titleBilan'],
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        isSubmit: json['isSubmit'], 
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleBilan': titleBilan,
      'signature': signature,
      'created': created.toIso8601String(),
      'isSubmit': isSubmit, 
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
