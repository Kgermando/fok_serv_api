class JournalLivreModel {
  late int? id;
  late String intitule;
  late DateTime debut;
  late DateTime fin;

  late String signature;
  late DateTime created;
  late String approbationDG; // Approbations DG
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  JournalLivreModel(
      {this.id,
      required this.intitule,
      required this.debut,
      required this.fin,
      required this.signature,
      required this.created,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory JournalLivreModel.fromSQL(List<dynamic> row) {
    return JournalLivreModel(
        id: row[0],
        intitule: row[1],
        debut: row[2],
        fin: row[3],
        signature: row[4],
        created: row[5],
        approbationDG: row[6],
        motifDG: row[7],
        signatureDG: row[8],
        approbationDD: row[9],
        motifDD: row[10],
        signatureDD: row[11]);
  }

  factory JournalLivreModel.fromJson(Map<String, dynamic> json) {
    return JournalLivreModel(
        id: json['id'],
        intitule: json['intitule'],
        debut: DateTime.parse(json['debut']),
        fin: DateTime.parse(json['fin']),
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        approbationDG: json['approbationDG'],
        motifDG: json['motifDG'],
        signatureDG: json['signatureDG'],
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'intitule': intitule,
      'debut': debut.toIso8601String(),
      'fin': fin.toIso8601String(),
      'signature': signature,
      'created': created.toIso8601String(),
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG,
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
