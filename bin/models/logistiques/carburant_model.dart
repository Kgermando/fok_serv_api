class CarburantModel {
  late int? id;
  late String operationEntreSortie;
  late String typeCaburant;
  late String fournisseur;
  late String nomeroFactureAchat;
  late String prixAchatParLitre;
  late String nomReceptioniste;
  late String numeroPlaque; // Plaque de la voiture que l'on a donné du carburant
  late DateTime dateHeureSortieAnguin; 
  late String qtyAchat;
  late String signature; // celui qui fait le document
  late DateTime createdRef;
  late DateTime created;

  // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  CarburantModel({
    this.id,
    required this.operationEntreSortie,
    required this.typeCaburant,
    required this.fournisseur,
    required this.nomeroFactureAchat,
    required this.prixAchatParLitre,
    required this.nomReceptioniste,
    required this.numeroPlaque,
    required this.dateHeureSortieAnguin,
    required this.qtyAchat,
    required this.signature,
    required this.createdRef,
    required this.created, 
    required this.approbationDD,
    required this.motifDD,
    required this.signatureDD
  });

  factory CarburantModel.fromSQL(List<dynamic> row) {
    return CarburantModel(
      id: row[0],
      operationEntreSortie: row[1],
      typeCaburant: row[2],
      fournisseur: row[3],
      nomeroFactureAchat: row[4],
      prixAchatParLitre: row[5],
      nomReceptioniste: row[6],
      numeroPlaque: row[7],
      dateHeureSortieAnguin: row[8],
      qtyAchat: row[9],
      signature: row[10],
      createdRef: row[11],
      created: row[12], 
      approbationDD: row[16],
      motifDD: row[17],
      signatureDD: row[18]
    );
  }

  factory CarburantModel.fromJson(Map<String, dynamic> json) {
    return CarburantModel(
      id: json['id'],
      operationEntreSortie: json['operationEntreSortie'],
      typeCaburant: json['typeCaburant'],
      fournisseur: json['fournisseur'],
      nomeroFactureAchat: json['nomeroFactureAchat'],
      prixAchatParLitre: json['prixAchatParLitre'],
      nomReceptioniste: json['nomReceptioniste'],
      numeroPlaque: json['numeroPlaque'],
      dateHeureSortieAnguin: DateTime.parse(json['dateHeureSortieAnguin']),
      qtyAchat: json['qtyAchat'],
      signature: json['signature'],
      createdRef: DateTime.parse(json['createdRef']),
      created: DateTime.parse(json['created']), 
      approbationDD: json['approbationDD'],
      motifDD: json['motifDD'],
      signatureDD: json['signatureDD']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'operationEntreSortie': operationEntreSortie,
      'typeCaburant': typeCaburant,
      'fournisseur': fournisseur,
      'nomeroFactureAchat': nomeroFactureAchat,
      'prixAchatParLitre': prixAchatParLitre,
      'nomReceptioniste': nomReceptioniste,
      'numeroPlaque': numeroPlaque,
      'dateHeureSortieAnguin': dateHeureSortieAnguin.toIso8601String(),
      'qtyAchat': qtyAchat,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(), 
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
