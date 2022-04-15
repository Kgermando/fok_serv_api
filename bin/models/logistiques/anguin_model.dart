class AnguinModel {
  late int? id;
  late String nom; // nom de l'anguin
  late String modele;
  late String marque;
  late String numeroChassie;
  late String couleur;
  late String genre;
  late String qtyMaxReservoir;
  late DateTime dateFabrication;
  late String nomeroPLaque;
  late String nomeroEntreprise;
  late String kilometrageInitiale;
  late String provenance;
  late DateTime created;
  late String signature;

  AnguinModel({
    this.id,
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
    required this.created,
    required this.signature
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
        created: row[13],
        signature: row[14]
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
        created: DateTime.parse(json['created']),
        signature: json['signature']);
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
      'created': created.toIso8601String(),
      'signature': signature
    };
  }
}
