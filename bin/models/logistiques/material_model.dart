class MaterielModel {
  late int? id;
  late String typeMateriel; // typeMateriel de mateiriel roulant ou autres
  late String marque;
  late String modele;
  late String numeroRef; // Numero Chassie
  late String couleur;
  late String genre; // textField typeMaterielHead voiture(voiture, camion, bus, mini-bus...)

  late String qtyMaxReservoir; // Pour autres materiel laisser vide
  late DateTime dateFabrication;
  late String numeroPLaque; // Pour autres materiel laisser vide

  late String identifiant; // Identifiant interne entreprise
  late String kilometrageInitiale; // Pour autres materiel laisser vide
  late String fournisseur; // provenance
  late String alimentation;  // Essence, Gasoil, Pétrole, Gaz, AC, DC, Autres

  late String signature; // celui qui fait le document
  late DateTime created;

  // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  
  MaterielModel(
      {this.id,
      required this.typeMateriel,
      required this.marque,
      required this.modele,
      required this.numeroRef,
      required this.couleur,
      required this.genre,
      required this.qtyMaxReservoir,
      required this.dateFabrication,
      required this.numeroPLaque,
      required this.identifiant,
      required this.kilometrageInitiale,
      required this.fournisseur,
      required this.alimentation, 
      required this.signature,
      required this.created,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory MaterielModel.fromSQL(List<dynamic> row) {
    return MaterielModel(
        id: row[0],
        typeMateriel: row[1],
        marque: row[2],
        modele: row[3],
        numeroRef: row[4],
        couleur: row[5],
        genre: row[6],
        qtyMaxReservoir: row[7],
        dateFabrication: row[8],
        numeroPLaque: row[9],
        identifiant: row[10],
        kilometrageInitiale: row[11],
        fournisseur: row[12],
        alimentation: row[13],
        signature: row[14],
        created: row[15],
        approbationDG: row[16],
        motifDG: row[17],
        signatureDG: row[18],
        approbationDD: row[19],
        motifDD: row[20],
        signatureDD: row[21]
    );
  }

  factory MaterielModel.fromJson(Map<String, dynamic> json) {
    return MaterielModel(
        id: json['id'],
        typeMateriel: json['typeMateriel'],
        marque: json['marque'],
        modele: json['modele'],
        numeroRef: json['numeroRef'],
        couleur: json['couleur'],
        genre: json['genre'],
        qtyMaxReservoir: json['qtyMaxReservoir'],
        dateFabrication: DateTime.parse(json['dateFabrication']),
        numeroPLaque: json['numeroPLaque'],
        identifiant: json['identifiant'],
        kilometrageInitiale: json['kilometrageInitiale'],
        fournisseur: json['fournisseur'],
        alimentation: json['alimentation'],
        signature: json['signature'],
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
      'typeMateriel': typeMateriel,
      'marque': marque,
      'modele': modele,
      'numeroRef': numeroRef,
      'couleur': couleur,
      'genre': genre,
      'qtyMaxReservoir': qtyMaxReservoir,
      'dateFabrication': dateFabrication.toIso8601String(),
      'numeroPLaque': numeroPLaque,
      'identifiant': identifiant,
      'kilometrageInitiale': kilometrageInitiale,
      'fournisseur': fournisseur,
      'alimentation': alimentation,
      'signature': signature,
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
