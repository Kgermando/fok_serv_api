class CoupureBilletModel {
  late int? id;
  late String nombreBillet;
  late String coupureBillet;

  CoupureBilletModel({
    this.id,
    required this.nombreBillet,
    required this.coupureBillet,
  });

  factory CoupureBilletModel.fromJson(Map<String, dynamic> json) {
    return CoupureBilletModel(
        id: json['id'],
        nombreBillet: json['nombreBillet'],
        coupureBillet: json['coupureBillet']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombreBillet': nombreBillet,
      'coupureBillet': coupureBillet
    };
  }
}
