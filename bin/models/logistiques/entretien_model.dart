class EntretienModel {
  late int? id;
  late String nom;
  late String modele;
  late String marque;
  late String etatObjet;
  late List objetRemplace;
  late String dureeTravaux;

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
        signature: row[7],
        created: row[8]
        
        
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
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
