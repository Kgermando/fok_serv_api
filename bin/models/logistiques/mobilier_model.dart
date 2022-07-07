class MobilierModel {
  late int? id;
  late String nom;
  late String modele;
  late String marque;
  late String descriptionMobilier;
  late String nombre;
  late String signature; // celui qui fait le document
  late DateTime createdRef;
  late DateTime created; 
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;


  MobilierModel(
      {this.id,
      required this.nom,
      required this.modele,
      required this.marque,
      required this.descriptionMobilier,
      required this.nombre,
      required this.signature,
      required this.createdRef,
      required this.created, 
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory MobilierModel.fromSQL(List<dynamic> row) {
    return MobilierModel(
        id: row[0],
        nom: row[1],
        modele: row[2],
        marque: row[3],
        descriptionMobilier: row[4],
        nombre: row[5],
        signature: row[6],
        createdRef: row[7],
        created: row[8], 
        approbationDD: row[9],
        motifDD: row[10],
        signatureDD: row[11]);
  }

  factory MobilierModel.fromJson(Map<String, dynamic> json) {
    return MobilierModel(
        id: json['id'],
        nom: json['nom'],
        modele: json['modele'],
        marque: json['marque'],
        descriptionMobilier: json['descriptionMobilier'],
        nombre: json['nombre'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']), 
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'modele': modele,
      'marque': marque,
      'descriptionMobilier': descriptionMobilier,
      'nombre': nombre,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(), 
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
