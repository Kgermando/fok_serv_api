class DepartementBudgetModel { 
  late int? id;
  late String departement;
  late String periodeBudget; // Durée
  late String totalGlobalDispo;
  late String totalGlobalFinExt; // Reste à trouver
  late String totalGlobalPrevisionel;
  
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
  late String signatureDD;  // directeur de departement
  late String signatureJustificationDD;
   
  late String signature; // celui qui fait le document
  late DateTime created;

  DepartementBudgetModel(
      {this.id,
      required this.departement,
      required this.periodeBudget,
      required this.totalGlobalDispo,
      required this.totalGlobalFinExt,
      required this.totalGlobalPrevisionel, 

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
    }
  ); 

  factory DepartementBudgetModel.fromSQL(List<dynamic> row) {
    return DepartementBudgetModel(
        id: row[0],
        departement: row[1],
        periodeBudget: row[2],
        totalGlobalDispo: row[3],
        totalGlobalFinExt: row[4],
        totalGlobalPrevisionel: row[5],

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

  factory DepartementBudgetModel.fromJson(Map<String, dynamic> json) {
    return DepartementBudgetModel(
        id: json['id'],
        departement: json['departement'],
        periodeBudget: json['periodeBudget'],
        totalGlobalDispo: json['totalGlobalDispo'],
        totalGlobalFinExt: json['totalGlobalFinExt'],
        totalGlobalPrevisionel: json['totalGlobalPrevisionel'],

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
      'departement': departement,
      'periodeBudget': periodeBudget,
      'totalGlobalDispo': totalGlobalDispo,
      'totalGlobalFinExt': totalGlobalFinExt,
      'totalGlobalPrevisionel': totalGlobalPrevisionel,
      
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
