class DevisListObjetsModel {
  late int? id;
  late int reference;
  late String title;
  late String quantity;
  late String designation;
  late String montantUnitaire;
  late String montantGlobal;

  DevisListObjetsModel(
      {this.id,
      required this.reference,
      required this.title,
      required this.quantity,
      required this.designation,
      required this.montantUnitaire,
      required this.montantGlobal});
 
  factory DevisListObjetsModel.fromSQL(List<dynamic> row) {
    return DevisListObjetsModel(
        id: row[0],
        reference: row[1],
        title: row[2],
        quantity: row[3],
        designation: row[4],
        montantUnitaire: row[5],
        montantGlobal: row[6]);
  }

  factory DevisListObjetsModel.fromJson(Map<String, dynamic> json) {
    return DevisListObjetsModel(
        id: json['id'],
        reference: json['reference'],
        title: json['title'],
        quantity: json['quantity'],
        designation: json['designation'],
        montantUnitaire: json['montantUnitaire'],
        montantGlobal: json['montantGlobal']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'title': title,
      'quantity': quantity,
      'designation': designation,
      'montantUnitaire': montantUnitaire,
      'montantGlobal': montantGlobal
    };
  }
}
