class TrajetModel {
  late int? id;
  late String nomeroEntreprise;
  late String nomUtilisateur;
  late String trajetDe;
  late String trajetA;
  late String mission;
  late String kilometrageSorite;
  late String kilometrageRetour;
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

  TrajetModel(
      {this.id,
      required this.nomeroEntreprise,
      required this.nomUtilisateur,
      required this.trajetDe,
      required this.trajetA,
      required this.mission,
      required this.kilometrageSorite,
      required this.kilometrageRetour,
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

  factory TrajetModel.fromSQL(List<dynamic> row) {
    return TrajetModel(
        id: row[0],
        nomeroEntreprise: row[1],
        nomUtilisateur: row[2],
        trajetDe: row[3],
        trajetA: row[4],
        mission: row[5],
        kilometrageSorite: row[6],
        kilometrageRetour: row[7],
        approbationDG: row[8],
        signatureDG: row[9],
        signatureJustificationDG: row[10],
        approbationFin: row[11],
        signatureFin: row[12],
        signatureJustificationFin: row[13],
        approbationBudget: row[14],
        signatureBudget: row[15],
        signatureJustificationBudget: row[16],
        approbationDD: row[17],
        signatureDD: row[18],
        signatureJustificationDD: row[19],
        signature: row[20],
        created: row[21]
        
    );
  }

  factory TrajetModel.fromJson(Map<String, dynamic> json) {
    return TrajetModel(
        id: json['id'],
        nomeroEntreprise: json['nomeroEntreprise'],
        nomUtilisateur: json['nomUtilisateur'],
        trajetDe: json['trajetDe'],
        trajetA: json['trajetA'],
        mission: json['mission'],
        kilometrageSorite: json['kilometrageSorite'],
        kilometrageRetour: json['kilometrageRetour'],
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
      'nomeroEntreprise': nomeroEntreprise,
      'nomUtilisateur': nomUtilisateur,
      'trajetDe': trajetDe,
      'trajetA': trajetA,
      'mission': mission,
      'kilometrageSorite': kilometrageSorite,
      'kilometrageRetour': kilometrageRetour,
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
