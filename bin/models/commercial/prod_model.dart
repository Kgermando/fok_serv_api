class ProductModel {
  late int? id;
  late String service;
  late String identifiant;
  late String unite; // Unité
  late String price;
  late String idProduct;
  late String signature; // celui qui fait le document
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;

  ProductModel({
    this.id,
    required this.service,
    required this.identifiant,
    required this.unite,
    required this.price,
    required this.idProduct,
    required this.signature,
    required this.created,
    required this.business,
    required this.sync,
    required this.async,
  });

  factory ProductModel.fromSQL(List<dynamic> row) {
    return ProductModel(
        id: row[0],
        service: row[1],
        identifiant: row[2],
        unite: row[3],
        price: row[4],
        idProduct: row[5],
        signature: row[6],
        created: row[7],
        business: row[8],
        sync: row[9],
        async: row[10]);
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      service: json['service'],
      identifiant: json['identifiant'],
      unite: json['unite'],
      price: json['price'],
      idProduct: json['idProduct'],
      signature: json['signature'],
      created: DateTime.parse(json['created']),
      business: json['business'],
      sync: json['sync'],
      async: json['async'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'service': service,
      'identifiant': identifiant,
      'unite': unite,
      'price': price,
      'idProduct': idProduct,
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async
    };
  }
}
