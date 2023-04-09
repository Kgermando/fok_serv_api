class CreanceCartModel {
  late int? id;
  late String cart;
  late String client;
  late String nomClient;
  late String telephone;
  late DateTime delaiPaiement;
  late String addresse;
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;

  CreanceCartModel(
      {this.id,
      required this.cart,
      required this.client,
      required this.nomClient,
      required this.telephone,
      required this.addresse,
      required this.delaiPaiement,
      required this.succursale,
      required this.signature,
      required this.created,
      required this.business,
    required this.sync,
    required this.async,
  });

  factory CreanceCartModel.fromSQL(List<dynamic> row) {
    return CreanceCartModel(
        id: row[0],
        cart: row[1],
        client: row[2],
        nomClient: row[3],
        telephone: row[4],
        addresse: row[5],
        delaiPaiement: row[6],
        succursale: row[7],
        signature: row[8],
        created: row[9],
        business: row[10],
        sync: row[11],
        async: row[12]);
  }

  factory CreanceCartModel.fromJson(Map<String, dynamic> json) {
    return CreanceCartModel(
      id: json['id'],
      cart: json['cart'],
      client: json['client'],
      nomClient: json['nomClient'],
      telephone: json['telephone'],
      addresse: json['addresse'],
      delaiPaiement: DateTime.parse(json['delaiPaiement']),
      succursale: json['succursale'],
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
      'cart': cart,
      'client': client,
      'nomClient': nomClient,
      'telephone': telephone,
      'addresse': addresse,
      'delaiPaiement': delaiPaiement.toIso8601String(),
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }

   
}
