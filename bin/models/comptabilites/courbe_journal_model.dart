class CourbeJournalModel {
  final String created;
  final double sumDebit;
  final double sumCredit; 

  CourbeJournalModel({required this.created, 
    required this.sumDebit, required this.sumCredit});

  factory CourbeJournalModel.fromSQL(List<dynamic> row) {
    return CourbeJournalModel(
      created: row[0],
      sumDebit: row[1],
      sumCredit: row[3]
    );
  }

  factory CourbeJournalModel.fromJson(Map<String, dynamic> json) {
    return CourbeJournalModel(
      created: json['created'],
      sumDebit: json['sumDebit'],
      sumCredit: json['sumCredit']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created': created, 
      'sumDebit': sumDebit, 
      'sumCredit': sumCredit
    };
  }
}
