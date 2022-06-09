class DevisListObjetsModel {
  late int? id;
  late DateTime referenceDate;
  late String title;
  late String quantity;
  late String designation;
  late String montantUnitaire;
  late String montantGlobal;

  DevisListObjetsModel(
      {this.id,
      required this.referenceDate,
      required this.title,
      required this.quantity,
      required this.designation,
      required this.montantUnitaire,
      required this.montantGlobal});
 
  factory DevisListObjetsModel.fromSQL(List<dynamic> row) {
    return DevisListObjetsModel(
        id: row[0],
        referenceDate: row[1],
        title: row[2],
        quantity: row[3],
        designation: row[4],
        montantUnitaire: row[5],
        montantGlobal: row[6]);
  }

  factory DevisListObjetsModel.fromJson(Map<String, dynamic> json) {
    return DevisListObjetsModel(
        id: json['id'],
        referenceDate: DateTime.parse(json['referenceDate']),
        title: json['title'],
        quantity: json['quantity'],
        designation: json['designation'],
        montantUnitaire: json['montantUnitaire'],
        montantGlobal: json['montantGlobal']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'referenceDate': referenceDate.toIso8601String(),
      'title': title,
      'quantity': quantity,
      'designation': designation,
      'montantUnitaire': montantUnitaire,
      'montantGlobal': montantGlobal
    };
  }
}
