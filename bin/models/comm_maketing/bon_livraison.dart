class BonLivraisonModel {
  late int? id;
  late String idProduct;
  late String quantityAchat;
  late String priceAchatUnit; 
  late String prixVenteUnit;
  late String unite;
  late DateTime created;
  late String firstName;
  late String lastName;
  late String telephone;
  late String succursale;
  late String nameBusiness;
  late String tva;
  late String remise;
  late String qtyRemise;
  late bool accuseReception;
  late String accuseReceptionFirstName;
  late String accuseReceptionLastName;

  BonLivraisonModel({
    this.id,
    required this.idProduct,
    required this.quantityAchat,
    required this.priceAchatUnit,
    required this.prixVenteUnit,
    required this.unite,
    required this.created,
    required this.firstName,
    required this.lastName,
    required this.telephone,
    required this.succursale,
    required this.nameBusiness,
    required this.tva,
    required this.remise,
    required this.qtyRemise,
    required this.accuseReception,
    required this.accuseReceptionFirstName,
    required this.accuseReceptionLastName
  });

  factory BonLivraisonModel.fromSQL(List<dynamic> row) {
    return BonLivraisonModel(
      id: row[0],
      idProduct: row[1],
      quantityAchat: row[2],
      priceAchatUnit: row[3],
      prixVenteUnit: row[4],
      unite: row[5],
      created: row[6],
      firstName: row[7],
      lastName: row[8],
      telephone: row[9],
      succursale: row[10],
      nameBusiness: row[11],
      tva: row[12],
      remise: row[13],
      qtyRemise: row[14],
      accuseReception: row[15],
      accuseReceptionFirstName: row[16],
      accuseReceptionLastName: row[17]
    );
  }

  factory BonLivraisonModel.fromJson(Map<String, dynamic> json) {
    return BonLivraisonModel(
        id: json['id'],
        idProduct: json['idProduct'],
        quantityAchat: json['quantityAchat'],
        priceAchatUnit: json['priceAchatUnit'],
        prixVenteUnit: json['prixVenteUnit'],
        unite: json['unite'],
        created: DateTime.parse(json['created']),
        firstName: json["firstName"],
        lastName: json["lastName"],
        telephone: json["telephone"],
        succursale: json["succursale"],
        nameBusiness: json["nameBusiness"],
        tva: json["tva"],
        remise: json["remise"],
        qtyRemise: json["qtyRemise"],
        accuseReception: json["accuseReception"],
        accuseReceptionFirstName: json["accuseReceptionFirstName"],
        accuseReceptionLastName: json["accuseReceptionLastName"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idProduct': idProduct,
      'quantityAchat': quantityAchat,
      'priceAchatUnit': priceAchatUnit,
      'prixVenteUnit': prixVenteUnit,
      'unite': unite,
      'created': created.toIso8601String(),
      "firstName": firstName,
      "lastName": lastName,
      "telephone": telephone,
      "succursale": succursale,
      "nameBusiness": nameBusiness,
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise,
      "accuseReception": accuseReception,
      "accuseReceptionFirstName": accuseReceptionFirstName,
      "accuseReceptionLastName": accuseReceptionLastName
    };
  }
}