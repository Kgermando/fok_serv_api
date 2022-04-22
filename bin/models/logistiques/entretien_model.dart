class EntretienModel {
  late int? id;
  late String nom;
  late String modele;
  late String marque;
  late String etatObjet;
  late List objetRemplace;
  late String dureeTravaux;
  
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

  EntretienModel(
      {this.id,
      required this.nom,
      required this.modele,
      required this.marque,
      required this.etatObjet,
      required this.objetRemplace,
      required this.dureeTravaux,
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

  factory EntretienModel.fromSQL(List<dynamic> row) {
    return EntretienModel(
        id: row[0],
        nom: row[1],
        modele: row[2],
        marque: row[3],
        etatObjet: row[4],
        objetRemplace: row[5],
        dureeTravaux: row[6],
        approbationDG: row[7],
        signatureDG: row[8],
        signatureJustificationDG: row[9],
        approbationFin: row[10],
        signatureFin: row[11],
        signatureJustificationFin: row[12],
        approbationBudget: row[13],
        signatureBudget: row[14],
        signatureJustificationBudget: row[15],
        approbationDD: row[16],
        signatureDD: row[17],
        signatureJustificationDD: row[18],
        signature: row[19],
        created: row[20]
        
        
    );
  }

  factory EntretienModel.fromJson(Map<String, dynamic> json) {
    return EntretienModel(
        id: json['id'],
        nom: json['nom'],
        modele: json['modele'],
        marque: json['marque'],
        etatObjet: json['etatObjet'],
        objetRemplace: json['objetRemplace'],
        dureeTravaux: json['dureeTravaux'],
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
      'nom': nom,
      'modele': modele,
      'marque': marque,
      'etatObjet': etatObjet,
      'objetRemplace': objetRemplace,
      'dureeTravaux': dureeTravaux,
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
