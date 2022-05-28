class EtatMaterielModel {
  late int? id;
  late String nom;
  late String modele;
  late String marque;
  late String typeObjet;  // anguin , mobilier ou immobilier,
  late String statut;
  late String signature; // celui qui fait le document
  late DateTime created;

  EtatMaterielModel(
      {this.id,
      required this.nom,
      required this.modele,
      required this.marque,
      required this.typeObjet,
      required this.statut,
      required this.signature,
      required this.created
      
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
        created: row[7]
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
        created: DateTime.parse(json['created'])
        
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
      'created': created.toIso8601String()
    };
  }
}
