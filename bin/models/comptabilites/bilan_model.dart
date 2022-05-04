class BilanModel {
  late int? id;
  late String titleBilan;
  late List comptesActif; // Liste des comptes
  late List comptesPactif; // Liste des comptes
  late bool statut;
  
  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;
 
  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;

  late String signature;
  late DateTime created;


  BilanModel({
    this.id, 
    required this.titleBilan, 
    required this.comptesActif, 
    required this.comptesPactif,
    required this.statut,
    required this.approbationDG,
    required this.signatureDG,
    required this.signatureJustificationDG,
    required this.approbationDD,
    required this.signatureDD,
    required this.signatureJustificationDD,
    required this.signature,
    required this.created
  });

  factory BilanModel.fromSQL(List<dynamic> row) {
    return BilanModel(
      id: row[0],
      titleBilan: row[1],
      comptesActif: row[2],
      comptesPactif: row[3],
      statut: row[4],
      approbationDG: row[5],
      signatureDG: row[6],
      signatureJustificationDG: row[7],
      approbationDD: row[8],
      signatureDD: row[9],
      signatureJustificationDD: row[10],
      signature: row[11],
      created: row[12]
    );
  }

  factory BilanModel.fromJson(Map<String, dynamic> json) {
    return BilanModel(
      id: json['id'],
      titleBilan: json['titleBilan'],
      comptesActif: json['comptesActif'],
      comptesPactif: json['comptesPactif'],
      statut: json['statut'],
      approbationDG: json['approbationDG'],
      signatureDG: json['signatureDG'],
      signatureJustificationDG: json['signatureJustificationDG'],
      approbationDD: json['approbationDD'],
      signatureDD: json['signatureDD'],
      signatureJustificationDD: json['signatureJustificationDD'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleBilan': titleBilan,
      'comptesActif': comptesActif,
      'moncomptesPactiftant': comptesPactif,
      'statut': statut,
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}