class CampaignModel {
  late int? id;
  late String typeProduit;
  late String dateDebutEtFin;
  late String coutCampaign;
  late String lieuCible;
  late String promotion;
  late String objectifs;
  late String observation;
  late String signature;
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

  CampaignModel(
      {this.id,
      required this.typeProduit,
      required this.dateDebutEtFin,
      required this.coutCampaign,
      required this.lieuCible,
      required this.promotion,
      required this.objectifs,
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
  required this.ressource});

  factory CampaignModel.fromSQL(List<dynamic> row) {
    return CampaignModel(
        id: row[0],
        typeProduit: row[1],
        dateDebutEtFin: row[2],
        coutCampaign: row[3],
        lieuCible: row[4],
        promotion: row[5],
        objectifs: row[6],
        observation: row[7],
        signature: row[8],
        createdRef: row[9],
        created: row[10],
        approbationDG: row[11],
        motifDG: row[12],
        signatureDG: row[13],
        approbationBudget: row[14],
        motifBudget: row[15],
        signatureBudget: row[16],
        approbationFin: row[17],
        motifFin: row[18],
        signatureFin: row[19],
        approbationDD: row[20],
        motifDD: row[21],
        signatureDD: row[22],
        ligneBudgetaire: row[23],
        ressource: row[24]);
  }

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
        id: json['id'],
        typeProduit: json['typeProduit'],
        dateDebutEtFin: json['dateDebutEtFin'],
        coutCampaign: json['coutCampaign'],
        lieuCible: json['lieuCible'],
        promotion: json['promotion'],
        objectifs: json['objectifs'],
        observation: json["observation"],
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
        ressource: json['ressource']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'typeProduit': typeProduit,
      'dateDebutEtFin': dateDebutEtFin,
      'coutCampaign': coutCampaign,
      'lieuCible': lieuCible,
      'promotion': promotion,
      'objectifs': objectifs,
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
