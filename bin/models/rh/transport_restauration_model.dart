class TransportRestaurationModel {
  late int? id;
  late String title;
  late String observation;
  late String signature; // celui qui fait le document
  late DateTime createdRef;
  late DateTime created;

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

  TransportRestaurationModel(
      {this.id,
      required this.title,
      required this.observation,
      required this.signature,
      required this.createdRef,
      required this.created,
      
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
      required this.ressource
    }
  );

  factory TransportRestaurationModel.fromSQL(List<dynamic> row) {
    return TransportRestaurationModel(
        id: row[0],
        title: row[1],
        observation: row[2],
        signature: row[3],
        createdRef: row[4],
        created: row[5],

        approbationDG: row[6],
        motifDG: row[7],
        signatureDG: row[8],
        approbationBudget: row[9],
        motifBudget: row[10],
        signatureBudget: row[11],
        approbationFin: row[12],
        motifFin: row[13],
        signatureFin: row[14],
        approbationDD: row[15],
        motifDD: row[16],
        signatureDD: row[17],
        ligneBudgetaire: row[18],
        ressource: row[19]
    );
  }

  factory TransportRestaurationModel.fromJson(Map<String, dynamic> json) {
    return TransportRestaurationModel(
        id: json['id'],
        title: json['title'],
        observation: json['observation'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']),

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
        ressource: json['ressource']
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'observation': observation.toString(),
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(),
      
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

class TransRestAgentsModel {
  late int? id;
  late DateTime reference;
  late String nom;
  late String prenom;
  late String matricule;
  late String montant;

  TransRestAgentsModel(
      {this.id,
      required this.reference,
      required this.nom,
      required this.prenom,
      required this.matricule,
      required this.montant});

  factory TransRestAgentsModel.fromSQL(List<dynamic> row) {
    return TransRestAgentsModel(
        id: row[0],
        reference: row[1],
        nom: row[2],
        prenom: row[3],
        matricule: row[4],
        montant: row[5]);
  }

  factory TransRestAgentsModel.fromJson(Map<String, dynamic> json) {
    return TransRestAgentsModel(
      id: json['id'],
      reference: DateTime.parse(json['reference']),
      nom: json['nom'],
      prenom: json['prenom'],
      matricule: json['matricule'],
      montant: json['montant'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference.toIso8601String(),
      'nom': nom,
      'prenom': prenom,
      'matricule': matricule,
      'montant': montant
    };
  }
}
