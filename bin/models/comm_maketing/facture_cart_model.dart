class FactureCartModel {
 late int? id;
  late List cart;
  late String client;
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
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;

  FactureCartModel(
      {this.id,
      required this.cart,
      required this.client,
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
      required this.succursale,
      required this.signature,
      required this.created});
 
  factory FactureCartModel.fromSQL(List<dynamic> row) {
    return FactureCartModel(
      id: row[0],
        cart: row[1],
        client: row[2],
        approbationDG: row[3],
        signatureDG: row[4],
        signatureJustificationDG: row[5],
        approbationFin: row[6],
        signatureFin: row[7],
        signatureJustificationFin: row[8],
        approbationBudget: row[9],
        signatureBudget: row[10],
        signatureJustificationBudget: row[11],
        approbationDD: row[12],
        signatureDD: row[13],
        signatureJustificationDD: row[14],
        succursale: row[15],
        signature: row[16],
        created: row[17]
    );
  }

  factory FactureCartModel.fromJson(Map<String, dynamic> json) {
    return FactureCartModel(
     id: json['id'],
      cart: json['cart'],
      client: json['client'],
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
      succursale: json['succursale'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  // FactureCartModel.fromDatabase(RecordSnapshot<int, Map<String, dynamic>> snapshot)
  //   : id = snapshot.key,
  //     cart = snapshot.value['cart'] as List,
  //     client = snapshot.value['client'] as String,
  //     date = DateTime.parse(snapshot.value['date'] as String),
  //     telephone = snapshot.value['telephone'] as String,
  //     succursale = snapshot.value['succursale'] as String,
  //     nameBusiness = snapshot.value['nameBusiness'] as String;


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cart': cart,
      'client': client,
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
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
  

}
