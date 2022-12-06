class EntrepriseInfoModel {
  late int? id;
  late String nomSocial;
  late String nomGerant;
  late String emailEntreprise;
  late String emailGerant;
  late String telephone1;
  late String telephone2;
  late String rccm;
  late String identificationNationale;
  late String numerosImpot;
  late String secteurActivite;
  late String adressePhysiqueEntreprise;
  late String signature;
  late DateTime created;

 EntrepriseInfoModel(
      {this.id,
      required this.nomSocial,
      required this.nomGerant,
      required this.emailEntreprise,
      required this.emailGerant,
      required this.telephone1,
      required this.telephone2,
      required this.rccm,
      required this.identificationNationale,
      required this.numerosImpot,
      required this.secteurActivite,
      required this.adressePhysiqueEntreprise,
      required this.signature,
      required this.created
    }
  );
  factory EntrepriseInfoModel.fromSQL(List<dynamic> row) {
    return EntrepriseInfoModel(
      id: row[0],
      nomSocial: row[1],
      nomGerant: row[2],
      emailEntreprise: row[3],
      emailGerant: row[4],
      telephone1: row[5],
      telephone2: row[6],
      rccm: row[7],
      identificationNationale: row[8],
      numerosImpot: row[9],
      secteurActivite: row[10],
      adressePhysiqueEntreprise: row[11],
      signature: row[12],
      created: row[13]
    );
  }
factory EntrepriseInfoModel.fromJson(Map<String, dynamic> json) {
    return EntrepriseInfoModel(
      id: json['id'],
      nomSocial: json['nomSocial'],
      nomGerant: json['nomGerant'],
      emailEntreprise: json['emailEntreprise'],
      emailGerant: json['emailGerant'],
      telephone1: json['telephone1'],
      telephone2: json['telephone2'],
      rccm: json['rccm'],
      identificationNationale: json['identificationNationale'],
      numerosImpot: json['numerosImpot'],
      secteurActivite: json['secteurActivite'],
      adressePhysiqueEntreprise: json["adressePhysiqueEntreprise"],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomSocial': nomSocial,
      'nomGerant': nomGerant,
      'emailEntreprise': emailEntreprise,
      'emailGerant': emailGerant,
      'telephone1': telephone1,
      'telephone2': telephone2,
      'rccm': rccm,
      'identificationNationale': identificationNationale,
      'numerosImpot': numerosImpot,
      'secteurActivite': secteurActivite,
      'adressePhysiqueEntreprise': adressePhysiqueEntreprise,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}

