class DepartementBudgetModel {
  late int? id;
  late String title;
  late String departement;
  late DateTime periodeDebut; // Durée
  late DateTime periodeFin; // Durée de fin

  late String signature; // celui qui fait le document
  late DateTime createdRef;
  late DateTime created;
  late String isSubmit;

  // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  DepartementBudgetModel(
      {this.id,
      required this.title,
      required this.departement,
      required this.periodeDebut,
      required this.periodeFin,
      required this.signature,
      required this.createdRef,
      required this.created,
      required this.isSubmit,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});


  factory DepartementBudgetModel.fromSQL(List<dynamic> row) {
    return DepartementBudgetModel(
        id: row[0],
        title: row[1],
        departement: row[2],
        periodeDebut: row[3],
        periodeFin: row[4],
        signature: row[5],
        createdRef: row[6],
        created: row[7],
        isSubmit: row[8],
        approbationDG: row[9],
        motifDG: row[10],
        signatureDG: row[11],
        approbationDD: row[12],
        motifDD: row[13],
        signatureDD: row[14]);
  }

  factory DepartementBudgetModel.fromJson(Map<String, dynamic> json) {
    return DepartementBudgetModel(
        id: json['id'],
        title: json['title'],
        departement: json['departement'],
        periodeDebut: DateTime.parse(json['periodeDebut']),
        periodeFin: DateTime.parse(json['periodeFin']),
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']),
        isSubmit: json['isSubmit'],
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
      'title': title,
      'departement': departement,
      'periodeDebut': periodeDebut.toIso8601String(),
      'periodeFin': periodeFin.toIso8601String(),
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(),
      'isSubmit': isSubmit.toString(),
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG,
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
