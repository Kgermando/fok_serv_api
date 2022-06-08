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
      required this.created});

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
        created: row[9]);
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
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'pieceJustificative': pieceJustificative,
      'libelle': libelle,
      'montant': montant,
      'numeroOperation': numeroOperation,
      'statutPaie': statutPaie,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String()
    };
  }
}
