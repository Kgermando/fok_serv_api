class ApprobationModel {
  late int? id;
  late int reference; // Id du ficher à approuver
  late String title; // equivaux a un champs unique
  late String departement;
  late String fontctionOccupee;

  late String ligneBudgtaire;
  late String resources;

  late String approbation; // button radio OUi et NON if non text field
  late String justification; // Motif

  late String signature; // celui qui fait le document
  late DateTime created;

  ApprobationModel(
      {this.id,
      required this.reference,
      required this.title,
      required this.departement,
      required this.fontctionOccupee,
      required this.ligneBudgtaire,
      required this.resources,
      required this.approbation,
      required this.justification,
      required this.signature,
      required this.created});

  factory ApprobationModel.fromSQL(List<dynamic> row) {
    return ApprobationModel(
        id: row[0],
        reference: row[1],
        title: row[2],
        departement: row[3],
        fontctionOccupee: row[4],
        ligneBudgtaire: row[5],
        resources: row[6],
        approbation: row[7],
        justification: row[8],
        signature: row[9],
        created: row[10]);
  }

  factory ApprobationModel.fromJson(Map<String, dynamic> json) {
    return ApprobationModel(
        id: json['id'],
        reference: json['reference'],
        title: json['title'],
        departement: json['departement'],
        fontctionOccupee: json['fontctionOccupee'],
        ligneBudgtaire: json['ligneBudgtaire'],
        resources: json['resources'],
        approbation: json['approbation'],
        justification: json['justification'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'title': title,
      'departement': departement,
      'fontctionOccupee': fontctionOccupee,
      'ligneBudgtaire': ligneBudgtaire,
      'resources': resources,
      'approbation': approbation,
      'justification': justification,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
