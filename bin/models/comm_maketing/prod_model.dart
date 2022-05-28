class ProductModel {
  late int? id;
  late String categorie;
  late String sousCategorie1;
  late String sousCategorie2;
  late String sousCategorie3;
  late String sousCategorie4;
  late String idProduct;
  late String signature; // celui qui fait le document
  late DateTime created;

  ProductModel({
    this.id,
    required this.categorie,
    required this.sousCategorie1,
    required this.sousCategorie2,
    required this.sousCategorie3,
    required this.sousCategorie4,
    required this.idProduct,
    required this.signature,
    required this.created
  });


  factory ProductModel.fromSQL(List<dynamic> row) {
    return ProductModel(
      id: row[0],
      categorie: row[1],
      sousCategorie1: row[2],
      sousCategorie2: row[3],
      sousCategorie3: row[4],
      sousCategorie4: row[5],
      idProduct: row[6],
      signature: row[7],
      created: row[8]
    );
  }

 
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      categorie: json['categorie'],
      sousCategorie1: json['sousCategorie1'],
      sousCategorie2: json['sousCategorie2'],
      sousCategorie3: json['sousCategorie3'],
      sousCategorie4: json['sousCategorie4'],
      idProduct: json['idProduct'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categorie': categorie,
      'sousCategorie1': sousCategorie1,
      'sousCategorie2': sousCategorie2,
      'sousCategorie3': sousCategorie3,
      'sousCategorie4': sousCategorie4,
      'idProduct': idProduct,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
