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
  late String observation;
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
      required this.observation,
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
        observation: row[10],
        signature: row[11],
        created: row[12]);
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
        observation: json['resources'],
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
      'observation': observation,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
