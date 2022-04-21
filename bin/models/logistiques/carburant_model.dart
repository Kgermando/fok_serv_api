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
  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationFin;
  late String signatureFin;
  late String signatureJustificationFin;

  late String approbationBudget;
  late String signatureBudget;
  late String signatureJustificationBudget;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;

  late String signature; // celui qui fait le document
  late DateTime created;

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
      required this.approbationDG,
      required this.signatureDG,
      required this.signatureJustificationDG,
      required this.approbationFin,
      required this.signatureFin,
      required this.signatureJustificationFin,
      required this.approbationBudget,
      required this.signatureBudget,
      required this.signatureJustificationBudget,
      required this.approbationDD,
      required this.signatureDD,
      required this.signatureJustificationDD,
      required this.signature,
      required this.created
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
        approbationDG: row[10],
        signatureDG: row[11],
        signatureJustificationDG: row[8],
        approbationFin: row[9],
        signatureFin: row[10],
        signatureJustificationFin: row[11],
        approbationBudget: row[12],
        signatureBudget: row[13],
        signatureJustificationBudget: row[14],
        approbationDD: row[15],
        signatureDD: row[16],
        signatureJustificationDD: row[17],
        signature: row[18],
        created: row[19]
        
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
        approbationDG: json['approbationDG'],
        signatureDG: json['signatureDG'],
        signatureJustificationDG: json['signatureJustificationDG'],
        approbationFin: json['approbationFin'],
        signatureFin: json['signatureFin'],
        signatureJustificationFin: json['signatureJustificationFin'],
        approbationBudget: json['approbationBudget'],
        signatureBudget: json['signatureBudget'],
        signatureJustificationBudget: json['signatureJustificationBudget'],
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
      'operationEntreSortie': operationEntreSortie,
      'typeCaburant': typeCaburant,
      'fournisseur': fournisseur,
      'nomeroFactureAchat': nomeroFactureAchat,
      'prixAchatParLitre': prixAchatParLitre,
      'nomReceptioniste': nomReceptioniste,
      'numeroPlaque': numeroPlaque,
      'dateHeureSortieAnguin': dateHeureSortieAnguin.toIso8601String(),
      'qtyAchat': qtyAchat,
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationFin': approbationFin,
      'signatureFin': signatureFin,
      'signatureJustificationFin': signatureJustificationFin,
      'approbationBudget': approbationBudget,
      'signatureBudget': signatureBudget,
      'signatureJustificationBudget': signatureJustificationBudget,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'signature': signature,
      'created': created.toIso8601String()

    };
  }
}
