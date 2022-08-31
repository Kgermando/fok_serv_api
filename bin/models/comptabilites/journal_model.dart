class JournalModel {
  late int? id;
  late int reference;
  late String numeroOperation;
  late String libele;
  late String compte;
  late String montantDebit; // Montant
  late String montantCredit; // TVA
  late String tva;
  late String type;
  late DateTime created;

  JournalModel(
      {this.id,
      required this.reference,
      required this.numeroOperation,
      required this.libele,
      required this.compte,
      required this.montantDebit,
      required this.montantCredit,
      required this.tva,
      required this.type,
      required this.created});

  factory JournalModel.fromSQL(List<dynamic> row) {
    return JournalModel(
        id: row[0],
        reference: row[1],
        numeroOperation: row[2],
        libele: row[3],
        compte: row[4],
        montantDebit: row[5],
        montantCredit: row[6],
        tva: row[7],
        type: row[8],
        created: row[9]);
  }

  factory JournalModel.fromJson(Map<String, dynamic> json) {
    return JournalModel(
      id: json['id'],
      reference: json['reference'],
      numeroOperation: json['numeroOperation'],
      libele: json['libele'],
      compte: json['compte'],
      montantDebit: json['montantDebit'],
      montantCredit: json['montantCredit'],
      tva: json['tva'],
      type: json['type'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'numeroOperation': numeroOperation,
      'libele': libele,
      'compte': compte,
      'montantDebit': montantDebit,
      'montantCredit': montantCredit,
      'tva': tva,
      'type': type,
      'created': created.toIso8601String(),
    };
  }
}
