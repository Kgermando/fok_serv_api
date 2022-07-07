class CoupureBilletModel {
  late int? id;
  late int reference;
  late String nombreBillet;
  late String coupureBillet;

  CoupureBilletModel({
    this.id,
    required this.reference,
    required this.nombreBillet,
    required this.coupureBillet,
  });

  factory CoupureBilletModel.fromSQL(List<dynamic> row) {
    return CoupureBilletModel(
        id: row[0],
        reference: row[1],
        nombreBillet: row[2],
        coupureBillet: row[3]);
  }

  factory CoupureBilletModel.fromJson(Map<String, dynamic> json) {
    return CoupureBilletModel(
        id: json['id'],
        reference: json['reference'],
        nombreBillet: json['nombreBillet'],
        coupureBillet: json['coupureBillet']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'nombreBillet': nombreBillet,
      'coupureBillet': coupureBillet
    };
  }
}
