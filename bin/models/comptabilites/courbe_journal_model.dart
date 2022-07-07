class CourbeJournalModel {
  final double created;
  final double sumDebit;
  final double sumCredit;
    // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  CourbeJournalModel({required this.created, 
    required this.sumDebit, required this.sumCredit,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory CourbeJournalModel.fromSQL(List<dynamic> row) {
    return CourbeJournalModel(
      created: row[0],
      sumDebit: row[1],
      sumCredit: row[3],
      approbationDG: row[4],
      motifDG: row[5],
      signatureDG: row[6],
      approbationDD: row[7],
      motifDD: row[8],
      signatureDD: row[9]
    );
  }

  factory CourbeJournalModel.fromJson(Map<String, dynamic> json) {
    return CourbeJournalModel(
      created: json['created'],
      sumDebit: json['sumDebit'],
      sumCredit: json['sumCredit'],

      approbationDG: json['approbationDG'],
      motifDG: json['motifDG'],
      signatureDG: json['signatureDG'],
      approbationDD: json['approbationDD'],
      motifDD: json['motifDD'],
      signatureDD: json['signatureDD']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created': created, 
      'sumDebit': sumDebit, 
      'sumCredit': sumCredit,
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG,
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
