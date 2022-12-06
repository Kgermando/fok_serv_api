class AbonnementClientModel {
  late int? id;
  late DateTime duree;
  late String typeContrat;
  late String sommeContrat;
  late String receptionniste;
  late String dateSignatureContrat;
  late String signataireContratEntreprise;
  late String signature;
  late DateTime created;


  AbonnementClientModel({this.id,
      required this.duree,
      required this.typeContrat,
      required this.sommeContrat,
      required this.receptionniste,
      required this.dateSignatureContrat,
      required this.signataireContratEntreprise,
      required this.signature,
      required this.created

    });


  factory AbonnementClientModel.fromSQL(List<dynamic> row) {
    return AbonnementClientModel(
     id: row[0],
      duree: row[1],
      typeContrat: row[2],
      sommeContrat: row[3],
      receptionniste: row[4],
      dateSignatureContrat: row[5],
      signataireContratEntreprise: row[6],
      signature: row[7],
      created: row[8]
    );
  }

    factory AbonnementClientModel.fromJson(Map<String, dynamic> json) {
    return AbonnementClientModel(
     id: json['id'],
      duree: DateTime.parse(json['duree']),
      typeContrat: json['typeContrat'],
      sommeContrat: json['sommeContrat'],
      receptionniste: json['receptionniste'],
      dateSignatureContrat: json['dateSignatureContrat'],
      signataireContratEntreprise: json['signataireContratEntreprise'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  } 
  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'duree': duree.toIso8601String(),
      'typeContrat': typeContrat,
      'sommeContrat': sommeContrat,
      'receptionniste': receptionniste,
      'dateSignatureContrat': dateSignatureContrat,
      'signataireContratEntreprise': signataireContratEntreprise,
      'signature': signature,
      'created': created.toIso8601String(),
  
    };
  }
}