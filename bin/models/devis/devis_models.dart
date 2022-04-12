class DevisModel {
  late int? id;
  late String title;
  late String priority;
  late String departement;
  late List list;
  late bool approbation; // DG
  late bool observation; // Accuse reception
  late String signatureDG;
  late String signatureReception;
  late String signatureEmission;
  late DateTime created;

  DevisModel(
      {this.id,
      required this.title,
      required this.priority,
      required this.departement,
      required this.list,
      required this.approbation,
      required this.observation,
      required this.signatureDG,
      required this.signatureReception,
      required this.signatureEmission,
      required this.created});

  factory DevisModel.fromSQL(List<dynamic> row) {
    return DevisModel(
        id: row[0],
        title: row[1],
        priority: row[2],
        departement: row[3],
        list: row[4],
        approbation: row[5],
        observation: row[6],
        signatureDG: row[7],
        signatureReception: row[8],
        signatureEmission: row[9],
        created: row[10]
    );
  }

  factory DevisModel.fromJson(Map<String, dynamic> json) {
    return DevisModel(
        id: json['id'],
        title: json['title'],
        priority: json['priority'],
        departement: json['departement'],
        list: json['list'],
        approbation: json['approbation'],
        observation: json['observation'],
        signatureDG: json['signatureDG'],
        signatureReception: json['signatureReception'],
        signatureEmission: json['signatureEmission'],
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
      'approbation': approbation,
      'observation': observation,
      'signatureDG': signatureDG,
      'signatureReception': signatureReception,
      'signatureEmission': signatureEmission,
      'created': created.toIso8601String()
    };
  }
}
