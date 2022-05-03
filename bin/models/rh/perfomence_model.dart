class PerformenceModel {
  late int? id;
  late String agent;
  late String departement;
  late String hospitalite;
  late String ponctualite;
  late String travaille;
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

  late String signature; // celui qui fait le document
  late DateTime created;

  PerformenceModel(
      {this.id,
      required this.agent,
      required this.departement,
      required this.hospitalite,
      required this.ponctualite,
      required this.travaille,
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
      required this.created
      
    });

  factory PerformenceModel.fromSQL(List<dynamic> row) {
    return PerformenceModel(
        id: row[0],
        agent: row[1],
        departement: row[2],
        hospitalite: row[3],
        ponctualite: row[4],
        travaille: row[5],
        approbationDG: row[6],
        signatureDG: row[7],
        signatureJustificationDG: row[8],
        approbationFin: row[9],
        signatureFin: row[10],
        signatureJustificationFin: row[11],
        approbationBudget: row[12],
        signatureBudget: row[13],
        signatureJustificationBudget: row[14],
        approbationDD: row[15],
        signatureDD: row[16],
        signatureJustificationDD: row[17],
        signature: row[18],
        created: row[19]
        
      );
  }

  factory PerformenceModel.fromJson(Map<String, dynamic> json) {
    return PerformenceModel(
      id: json['id'],
      agent: json['agent'],
      departement: json['departement'],
      hospitalite: json['hospitalite'],
      ponctualite: json['ponctualite'],
      travaille: json['travaille'],
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
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'departement': departement,
      'hospitalite': hospitalite,
      'ponctualite': ponctualite,
      'travaille': travaille,
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


class PerformenceNoteModel {
  late int? id;
  late String agent;
  late String departement;
  late String hospitalite;
  late String ponctualite;
  late String travaille;
  late String note; 
  late String signature;
  late DateTime created;

   PerformenceNoteModel(
      {this.id,
      required this.agent,
      required this.departement,
      required this.hospitalite,
      required this.ponctualite,
      required this.travaille,
      required this.note,
      required this.signature,
      required this.created});

  factory PerformenceNoteModel.fromSQL(List<dynamic> row) {
    return PerformenceNoteModel(
        id: row[0],
        agent: row[1],
        departement: row[2],
        hospitalite: row[3],
        ponctualite: row[4],
        travaille: row[5],
        note: row[6],
        signature: row[7],
        created: row[8]);
  }

  factory PerformenceNoteModel.fromJson(Map<String, dynamic> json) {
    return PerformenceNoteModel(
        id: json['id'],
        agent: json['agent'],
        departement: json['departement'],
        hospitalite: json['hospitalite'],
        ponctualite: json['ponctualite'],
        travaille: json['travaille'],
        note: json['note'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'departement': departement,
      'hospitalite': hospitalite,
      'ponctualite': ponctualite,
      'travaille': travaille,
      'note': note,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
