class AnguinModel {
  late int? id;
  late String nom; // nom de l'anguin
  late String modele;
  late String marque;
  late String numeroChassie;
  late String couleur;
  late String genre; // Form viture(voiture, camion, bus, mini-bus...)
  late String qtyMaxReservoir;
  late DateTime dateFabrication;
  late String nomeroPLaque;
  // numero que l'entreprise donne donne a ses anguins
  late String nomeroEntreprise; 
  late String kilometrageInitiale;
  late String provenance;
  late String typeCaburant;
  late String typeMoteur;
  
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


  AnguinModel(
      {this.id,
      required this.nom,
      required this.modele,
      required this.marque,
      required this.numeroChassie,
      required this.couleur,
      required this.genre,
      required this.qtyMaxReservoir,
      required this.dateFabrication,
      required this.nomeroPLaque,
      required this.nomeroEntreprise,
      required this.kilometrageInitiale,
      required this.provenance,
      required this.typeCaburant,
      required this.typeMoteur,
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

  factory AnguinModel.fromSQL(List<dynamic> row) {
    return AnguinModel(
        id: row[0],
        nom: row[1],
        modele: row[2],
        marque: row[3],
        numeroChassie: row[4],
        couleur: row[5],
        genre: row[6],
        qtyMaxReservoir: row[7],
        dateFabrication: row[8],
        nomeroPLaque: row[9],
        nomeroEntreprise: row[10],
        kilometrageInitiale: row[11],
        provenance: row[12],
        typeCaburant: row[13],
        typeMoteur: row[14],
        approbationDG: row[6],
        signatureDG: row[7],
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

  factory AnguinModel.fromJson(Map<String, dynamic> json) {
    return AnguinModel(
        id: json['id'],
        nom: json['nom'],
        modele: json['modele'],
        marque: json['marque'],
        numeroChassie: json['numeroChassie'],
        couleur: json['couleur'],
        genre: json['genre'],
        qtyMaxReservoir: json['qtyMaxReservoir'],
        dateFabrication: DateTime.parse(json['dateFabrication']),
        nomeroPLaque: json['nomeroPLaque'],
        nomeroEntreprise: json['nomeroEntreprise'],
        kilometrageInitiale: json['kilometrageInitiale'],
        provenance: json['provenance'],
        typeCaburant: json['typeCaburant'],
        typeMoteur: json['typeMoteur'],
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
      'numeroChassie': numeroChassie,
      'couleur': couleur,
      'genre': genre,
      'qtyMaxReservoir': qtyMaxReservoir,
      'dateFabrication': dateFabrication.toIso8601String(),
      'nomeroPLaque': nomeroPLaque,
      'nomeroEntreprise': nomeroEntreprise,
      'kilometrageInitiale': kilometrageInitiale,
      'provenance': provenance,
      'typeCaburant': typeCaburant,
      'typeMoteur': typeMoteur,
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
