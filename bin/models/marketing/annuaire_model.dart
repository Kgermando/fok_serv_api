

class AnnuaireModel {
  late int? id;
  late String categorie;
  late String nomPostnomPrenom;
  late String email;
  late String mobile1;
  late String mobile2;
  late String secteurActivite;
  late String nomEntreprise;
  late String grade;
  late String adresseEntreprise;
  late String succursale;
  late String signature;
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;


  AnnuaireModel(
      {this.id,
      required this.categorie,
      required this.nomPostnomPrenom,
      required this.email,
      required this.mobile1,
      required this.mobile2,
      required this.secteurActivite,
      required this.nomEntreprise,
      required this.grade,
      required this.adresseEntreprise,
      required this.succursale,
      required this.signature,
      required this.created,
      required this.business,
    required this.sync,
    required this.async,
  });

  factory AnnuaireModel.fromSQL(List<dynamic> row) {
    return AnnuaireModel(
        id: row[0],
        categorie: row[1],
        nomPostnomPrenom: row[2],
        email: row[3],
        mobile1: row[4],
        mobile2: row[5],
        secteurActivite: row[6],
        nomEntreprise: row[7],
        grade: row[8],
        adresseEntreprise: row[9],
        succursale: row[10],
        signature: row[11],
        created: row[12],
        business: row[13],
        sync: row[14],
        async: row[15]);
  }

  factory AnnuaireModel.fromJson(Map<String, dynamic> json) {
    return AnnuaireModel(
        id: json['id'],
        categorie: json['categorie'],
        nomPostnomPrenom: json['nomPostnomPrenom'],
        email: json['email'],
        mobile1: json['mobile1'],
        mobile2: json['mobile2'],
        secteurActivite: json['secteurActivite'],
        nomEntreprise: json['nomEntreprise'],
        grade: json['grade'],
        adresseEntreprise: json['adresseEntreprise'],
        succursale: json['succursale'],
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        business: json['business'],
      sync: json['sync'],
      async: json['async'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categorie': categorie,
      'nomPostnomPrenom': nomPostnomPrenom,
      'email': email,
      'mobile1': mobile1,
      'mobile2': mobile2,
      'secteurActivite': secteurActivite,
      'nomEntreprise': nomEntreprise,
      'grade': grade,
      'adresseEntreprise': adresseEntreprise,
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }


}
