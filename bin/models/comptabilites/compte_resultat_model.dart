class CompteResulatsModel {
  late int? id;
  late String intitule;
  late List compteListDebit;
  late List compteListCredit;
  late bool statut;

  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;
  late String signature;
  late DateTime created;

  CompteResulatsModel(
      {this.id,
      required this.intitule,
      required this.compteListDebit,
      required this.compteListCredit,
      required this.statut,
      required this.approbationDG,
      required this.signatureDG,
      required this.signatureJustificationDG,
      required this.approbationDD,
      required this.signatureDD,
      required this.signatureJustificationDD,
      required this.signature,
      required this.created});

  factory CompteResulatsModel.fromSQL(List<dynamic> row) {
    return CompteResulatsModel(
        id: row[0],
        intitule: row[1],
        compteListDebit: row[2],
        compteListCredit: row[3],
        statut: row[4],
        approbationDG: row[5],
        signatureDG: row[6],
        signatureJustificationDG: row[7],
        approbationDD: row[8],
        signatureDD: row[9],
        signatureJustificationDD: row[10],
        signature: row[11],
        created: row[12]);
  }

  factory CompteResulatsModel.fromJson(Map<String, dynamic> json) {
    return CompteResulatsModel(
        id: json['id'],
        intitule: json['intitule'],
        compteListDebit: json['compteListDebit'],
        compteListCredit: json['compteListCredit'],
        statut: json['statut'],
        approbationDG: json['approbationDG'],
        signatureDG: json['signatureDG'],
        signatureJustificationDG: json['signatureJustificationDG'],
        approbationDD: json['approbationDD'],
        signatureDD: json['signatureDD'],
        signatureJustificationDD: json['signatureJustificationDD'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'intitule': intitule,
      'compteListDebit': compteListDebit,
      'compteListCredit': compteListCredit,
      'statut': statut,
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}

