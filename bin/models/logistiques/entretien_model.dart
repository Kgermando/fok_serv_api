class EntretienModel {
  late int? id;
  late String nom;
  late String modele;
  late String marque;
  late String etatObjet; // type de Maintenance
  late String dureeTravaux;
  late String signature; // celui qui fait le document
  late int createdRef;
  late DateTime created; 
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  EntretienModel(
      {this.id,
      required this.nom,
      required this.modele,
      required this.marque,
      required this.etatObjet,
      required this.dureeTravaux,
      required this.signature,
      required this.createdRef,
      required this.created, 
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory EntretienModel.fromSQL(List<dynamic> row) {
    return EntretienModel(
        id: row[0],
        nom: row[1],
        modele: row[2],
        marque: row[3],
        etatObjet: row[4],
        dureeTravaux: row[5],
        signature: row[6],
        createdRef: row[7],
        created: row[8], 
        approbationDD: row[9],
        motifDD: row[10],
        signatureDD: row[11]);
  }

  factory EntretienModel.fromJson(Map<String, dynamic> json) {
    return EntretienModel(
        id: json['id'],
        nom: json['nom'],
        modele: json['modele'],
        marque: json['marque'],
        etatObjet: json['etatObjet'],
        dureeTravaux: json['dureeTravaux'],
        signature: json['signature'],
        createdRef: json['createdRef'],
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
      'etatObjet': etatObjet,
      'dureeTravaux': dureeTravaux,
      'signature': signature,
      'createdRef': createdRef,
      'created': created.toIso8601String(), 
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
