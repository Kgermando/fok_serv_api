class CarburantModel {
  late int? id;
  late String qtyEntreSortie;
  late String typeCaburant;
  late String fournisseur;
  late String nomeroFactureAchat;
  late String prixAchatParLitre;
  late String nomReceptioniste;
  late String numeroPlaque; // Plaque de la voiture que l'on a donné du carburant
  late DateTime dateHeureSortieAnguin; 
  late DateTime created;
  late String signature;

  CarburantModel({
    this.id,
    required this.qtyEntreSortie,
    required this.typeCaburant,
    required this.fournisseur,
    required this.nomeroFactureAchat,
    required this.prixAchatParLitre,
    required this.nomReceptioniste,
    required this.numeroPlaque,
    required this.dateHeureSortieAnguin,
    required this.created,
    required this.signature
  });

  factory CarburantModel.fromSQL(List<dynamic> row) {
    return CarburantModel(
        id: row[0],
        qtyEntreSortie: row[1],
        typeCaburant: row[2],
        fournisseur: row[3],
        nomeroFactureAchat: row[4],
        prixAchatParLitre: row[5],
        nomReceptioniste: row[6],
        numeroPlaque: row[7],
        dateHeureSortieAnguin: row[8],
        created: row[9],
        signature: row[10]);
  }

  factory CarburantModel.fromJson(Map<String, dynamic> json) {
    return CarburantModel(
        id: json['id'],
        qtyEntreSortie: json['qtyEntreSortie'],
        typeCaburant: json['typeCaburant'],
        fournisseur: json['fournisseur'],
        nomeroFactureAchat: json['nomeroFactureAchat'],
        prixAchatParLitre: json['prixAchatParLitre'],
        nomReceptioniste: json['nomReceptioniste'],
        numeroPlaque: json['numeroPlaque'],
        dateHeureSortieAnguin: DateTime.parse(json['dateHeureSortieAnguin']),
        created: DateTime.parse(json['created']),
        signature: json['signature']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qtyEntreSortie': qtyEntreSortie,
      'typeCaburant': typeCaburant,
      'fournisseur': fournisseur,
      'nomeroFactureAchat': nomeroFactureAchat,
      'prixAchatParLitre': prixAchatParLitre,
      'nomReceptioniste': nomReceptioniste,
      'numeroPlaque': numeroPlaque,
      'dateHeureSortieAnguin': dateHeureSortieAnguin.toIso8601String(),
      'created': created.toIso8601String(),
      'signature': signature
    };
  }
}
