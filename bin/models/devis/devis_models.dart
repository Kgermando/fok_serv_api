class DevisModel {
  late int? id;
  late String title;
  late String priority;
  late String departement;
  late String observation;
  late String signature; // celui qui fait le document
  late DateTime createdRef; // Date de reference
  late DateTime created;
  late String isSubmit; // soumettre chez le chef

     // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations Budget
  late String approbationBudget;
  late String motifBudget;
  late String signatureBudget;
  // Approbations Finance
  late String approbationFin;
  late String motifFin;
  late String signatureFin;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

   // Ligne budgetaire pour reduction des montants
  late String ligneBudgetaire;
  late String ressource;
 

  DevisModel(
      {this.id,
      required this.title,
      required this.priority,
      required this.departement,
      required this.observation,
      required this.signature,
      required this.createdRef,
      required this.created,
      required this.isSubmit,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationBudget,
      required this.motifBudget,
      required this.signatureBudget,
      required this.approbationFin,
      required this.motifFin,
      required this.signatureFin,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD,
      required this.ligneBudgetaire,
      required this.ressource});

  factory DevisModel.fromSQL(List<dynamic> row) {
    return DevisModel(
        id: row[0],
        title: row[1],
        priority: row[2],
        departement: row[3],
        observation: row[4],
        signature: row[5],
        createdRef: row[6],
        created: row[7],
        isSubmit: row[8],
        approbationDG: row[9],
        motifDG: row[10],
        signatureDG: row[11],
        approbationBudget: row[12],
        motifBudget: row[13],
        signatureBudget: row[14],
        approbationFin: row[15],
        motifFin: row[16],
        signatureFin: row[17],
        approbationDD: row[18],
        motifDD: row[19],
        signatureDD: row[20],
        ligneBudgetaire: row[21],
        ressource: row[22]);
  }

  factory DevisModel.fromJson(Map<String, dynamic> json) {
    return DevisModel(
        id: json['id'],
        title: json['title'],
        priority: json['priority'],
        departement: json['departement'],
        observation: json['observation'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']),
        isSubmit: json['isSubmit'],
        approbationDG: json['approbationDG'],
        motifDG: json['motifDG'],
        signatureDG: json['signatureDG'],
        approbationBudget: json['approbationBudget'],
        motifBudget: json['motifBudget'],
        signatureBudget: json['signatureBudget'],
        approbationFin: json['approbationFin'],
        motifFin: json['motifFin'],
        signatureFin: json['signatureFin'],
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD'],
        ligneBudgetaire: json['ligneBudgetaire'],
        ressource: json['ressource']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'departement': departement,
      'observation': observation.toString(),
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(),
      'isSubmit': isSubmit.toString(),
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG,
      'approbationBudget': approbationBudget,
      'motifBudget': motifBudget,
      'signatureBudget': signatureBudget,
      'approbationFin': approbationFin,
      'motifFin': motifFin,
      'signatureFin': signatureFin,
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD,
      'ligneBudgetaire': ligneBudgetaire,
      'ressource': ressource
    };
  }
}
