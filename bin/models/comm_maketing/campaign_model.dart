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
      required this.created});

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
        createdRef: row[8],
        created: row[10]);
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
        observation: json['resources'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']));
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
      'observation': observation,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String()
    };
  }
}
