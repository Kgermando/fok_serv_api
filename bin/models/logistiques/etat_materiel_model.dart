class EtatMaterielModel {
  late int? id;
  late String nom;
  late String modele;
  late String marque;
  late String typeObjet;  // anguin , mobilier ou immobilier,
  late String statut;
  late String signature; // celui qui fait le document
  late DateTime createdRef;
  late DateTime created; 
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  EtatMaterielModel(
      {this.id,
      required this.nom,
      required this.modele,
      required this.marque,
      required this.typeObjet,
      required this.statut,
      required this.signature,
      required this.createdRef,
      required this.created, 
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD
      
    });

  factory EtatMaterielModel.fromSQL(List<dynamic> row) {
    return EtatMaterielModel(
        id: row[0],
        nom: row[1],
        modele: row[2],
        marque: row[3],
        typeObjet: row[4],
        statut: row[5],
        signature: row[6],
        createdRef: row[7],
        created: row[8], 
        approbationDD: row[9],
        motifDD: row[10],
        signatureDD: row[11]
    );
  }

  factory EtatMaterielModel.fromJson(Map<String, dynamic> json) {
    return EtatMaterielModel(
        id: json['id'],
        nom: json['nom'],
        modele: json['modele'],
        marque: json['marque'],
        typeObjet: json['typeObjet'],
        statut: json['statut'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']), 
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
      'typeObjet': typeObjet,
      'statut': statut,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(), 
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
