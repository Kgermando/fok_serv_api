class DevisModel {
  late int? id;
  late String title;
  late String priority;
  late String departement;
  late List list; // Choses a énumerer
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

  late String signature; // celui qui fait le document
  late DateTime created;


  DevisModel(
      {this.id,
      required this.title,
      required this.priority,
      required this.departement,
      required this.list,
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
      required this.created
  });

  factory DevisModel.fromSQL(List<dynamic> row) {
    return DevisModel(
        id: row[0],
        title: row[1],
        priority: row[2],
        departement: row[3],
        list: row[4],
        ligneBudgtaire: row[5],
        resources: row[6],
        approbationDG: row[7],
        signatureDG: row[8],
        signatureJustificationDG: row[9],
        approbationFin: row[10],
        signatureFin: row[11],
        signatureJustificationFin: row[12],
        approbationBudget: row[13],
        signatureBudget: row[14],
        signatureJustificationBudget: row[15],
        approbationDD: row[16],
        signatureDD: row[17],
        signatureJustificationDD: row[18],
        signature: row[19],
        created: row[20]
    );
  }

  factory DevisModel.fromJson(Map<String, dynamic> json) {
    return DevisModel(
        id: json['id'],
        title: json['title'],
        priority: json['priority'],
        departement: json['departement'],
        list: json['list'],
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
        created: DateTime.parse(json['created'])
        
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'departement': departement,
      'list': list,
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
