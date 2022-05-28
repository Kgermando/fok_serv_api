class MobilierModel {
  late int? id;
  late String nom;
  late String modele;
  late String marque;
  late String descriptionMobilier;
  late String nombre;
  late String signature; // celui qui fait le document
  late DateTime created;

  MobilierModel(
      {this.id,
      required this.nom,
      required this.modele,
      required this.marque,
      required this.descriptionMobilier,
      required this.nombre, 
      required this.signature,
      required this.created
      
      });

  factory MobilierModel.fromSQL(List<dynamic> row) {
    return MobilierModel(
      id: row[0],
      nom: row[1],
      modele: row[2],
      marque: row[3],
      descriptionMobilier: row[4],
      nombre: row[5], 
      signature: row[6],
      created: row[7]
    );
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
        created: DateTime.parse(json['created'])
        
        );
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
      'created': created.toIso8601String()
    };
  }
}
