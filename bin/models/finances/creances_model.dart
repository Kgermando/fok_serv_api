class CreanceModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late String numeroOperation;
  late String statutPaie;

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

  CreanceModel(
      {this.id,
      required this.nomComplet,
      required this.pieceJustificative,
      required this.libelle,
      required this.montant,
      required this.numeroOperation,
      required this.statutPaie,
      required this.signature,
      required this.createdRef,
      required this.created,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG, 
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory CreanceModel.fromSQL(List<dynamic> row) {
    return CreanceModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montant: row[4],
        numeroOperation: row[5],
        statutPaie: row[6],
        signature: row[7],
        createdRef: row[8],
        created: row[9],
        approbationDG: row[10],
        motifDG: row[11],
        signatureDG: row[12], 
        approbationDD: row[13],
        motifDD: row[14],
        signatureDD: row[15]);
  }

  factory CreanceModel.fromJson(Map<String, dynamic> json) {
    return CreanceModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montant: json['montant'],
        numeroOperation: json['numeroOperation'],
        statutPaie: json['statutPaie'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']),
        approbationDG: json['approbationDG'],
        motifDG: json['motifDG'],
        signatureDG: json['signatureDG'], 
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'pieceJustificative': pieceJustificative,
      'libelle': libelle,
      'montant': montant,
      'numeroOperation': numeroOperation,
      'statutPaie': statutPaie.toString(),
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(),
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG, 
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
