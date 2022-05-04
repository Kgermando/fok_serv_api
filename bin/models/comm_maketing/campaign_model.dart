class CampaignModel {
  late int? id;
  late String typeProduit;
  late String dateDebutEtFin;
  late List agentAffectes;
  late String coutCampaign;
  late String lieuCible;
  late String promotion;
  late String objetctifs;
  late String ligneBudgtaire;
  late String resources;

  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationFin;
  late String signatureFin;
  late String signatureJustificationFin;

  late String approbationBudget;
  late String signatureBudget;
  late String signatureJustificationBudget;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;
  late String signature;
  late DateTime created;

  CampaignModel(
      {this.id,
      required this.typeProduit,
      required this.dateDebutEtFin,
      required this.agentAffectes,
      required this.coutCampaign,
      required this.lieuCible,
      required this.promotion,
      required this.objetctifs,
      required this.ligneBudgtaire,
      required this.resources,
      required this.approbationDG,
      required this.signatureDG,
      required this.signatureJustificationDG,
      required this.approbationFin,
      required this.signatureFin,
      required this.signatureJustificationFin,
      required this.approbationBudget,
      required this.signatureBudget,
      required this.signatureJustificationBudget,
      required this.approbationDD,
      required this.signatureDD,
      required this.signatureJustificationDD,
      required this.signature,
      required this.created});

  factory CampaignModel.fromSQL(List<dynamic> row) {
    return CampaignModel(
        id: row[0],
        typeProduit: row[1],
        dateDebutEtFin: row[2],
        agentAffectes: row[3],
        coutCampaign: row[4],
        lieuCible: row[5],
        promotion: row[6],
        objetctifs: row[7],
        ligneBudgtaire: row[8],
        resources: row[9],
        approbationDG: row[10],
        signatureDG: row[11],
        signatureJustificationDG: row[12],
        approbationFin: row[13],
        signatureFin: row[14],
        signatureJustificationFin: row[15],
        approbationBudget: row[16],
        signatureBudget: row[17],
        signatureJustificationBudget: row[18],
        approbationDD: row[19],
        signatureDD: row[20],
        signatureJustificationDD: row[21],
        signature: row[22],
        created: row[23]);
  }

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
        id: json['id'],
        typeProduit: json['typeProduit'],
        dateDebutEtFin: json['dateDebutEtFin'],
        agentAffectes: json['agentAffectes'],
        coutCampaign: json['coutCampaign'],
        lieuCible: json['lieuCible'],
        promotion: json['promotion'],
        objetctifs: json['objetctifs'],
        ligneBudgtaire: json['ligneBudgtaire'],
        resources: json['resources'],
        approbationDG: json['approbationDG'],
        signatureDG: json['signatureDG'],
        signatureJustificationDG: json['signatureJustificationDG'],
        approbationFin: json['approbationFin'],
        signatureFin: json['signatureFin'],
        signatureJustificationFin: json['signatureJustificationFin'],
        approbationBudget: json['approbationBudget'],
        signatureBudget: json['signatureBudget'],
        signatureJustificationBudget: json['signatureJustificationBudget'],
        approbationDD: json['approbationDD'],
        signatureDD: json['signatureDD'],
        signatureJustificationDD: json['signatureJustificationDD'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'typeProduit': typeProduit,
      'dateDebutEtFin': dateDebutEtFin,
      'agentAffectes': agentAffectes,
      'coutCampaign': coutCampaign,
      'lieuCible': lieuCible,
      'promotion': promotion,
      'objetctifs': objetctifs,
      'ligneBudgtaire': ligneBudgtaire,
      'resources': resources,
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationFin': approbationFin,
      'signatureFin': signatureFin,
      'signatureJustificationFin': signatureJustificationFin,
      'approbationBudget': approbationBudget,
      'signatureBudget': signatureBudget,
      'signatureJustificationBudget': signatureJustificationBudget,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
