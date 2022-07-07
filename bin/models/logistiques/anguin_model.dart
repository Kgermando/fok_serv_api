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
      required this.signature,
      required this.createdRef,
      required this.created,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD
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
        signature: row[15],
        createdRef: row[16],
        created: row[17],
        approbationDG: row[18],
        motifDG: row[19],
        signatureDG: row[20],
        approbationDD: row[21],
        motifDD: row[22],
        signatureDD: row[23]
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
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']),
        approbationDG: json['approbationDG'],
        motifDG: json['motifDG'],
        signatureDG: json['signatureDG'],
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD']
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
