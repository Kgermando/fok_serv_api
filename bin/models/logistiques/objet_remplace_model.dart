class ObjetRemplaceModel {
  late int? id;
  late int reference;
  late String nom;
  late String cout;
  late String caracteristique;
  late String observation;  // Point de vue de fonctionnement de l'objet

  ObjetRemplaceModel(
      {this.id,
      required this.reference,
      required this.nom,
      required this.cout,
      required this.caracteristique,
      required this.observation
    });

  factory ObjetRemplaceModel.fromSQL(List<dynamic> row) {
    return ObjetRemplaceModel(
        id: row[0],
        reference: row[1],
        nom: row[2],
        cout: row[3],
        caracteristique: row[4],
        observation: row[5] 
    );
  }

  factory ObjetRemplaceModel.fromJson(Map<String, dynamic> json) {
    return ObjetRemplaceModel(
      id: json['id'],
      reference: json['reference'],
      nom: json['nom'],
      cout: json['cout'],
      caracteristique: json['caracteristique'],
      observation: json['observation']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'nom': nom,
      'cout': cout,
      'caracteristique': caracteristique,
      'observation': observation
    };
  }
}
