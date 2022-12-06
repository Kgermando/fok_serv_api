class ApprovisionReceptionModel {
  late int? id;
  late String provision;
  late String departement;
  late String quantity;
  late String unite;
  late String signatureLivraison;
  late DateTime created;
  late String accuseReception; // True ou False
  late String signatureReception;
  late DateTime createdReception;
  late String livraisonAnnuler;
  late int reference;

  ApprovisionReceptionModel(
      {this.id,
      required this.provision,
      required this.departement,
      required this.quantity,
      required this.unite,
      required this.signatureLivraison,
      required this.created,
      required this.accuseReception,
      required this.signatureReception,
      required this.createdReception,
      required this.livraisonAnnuler,
      required this.reference});

  factory ApprovisionReceptionModel.fromSQL(List<dynamic> row) {
    return ApprovisionReceptionModel(
        id: row[0],
        provision: row[1],
        departement: row[2],
        quantity: row[3],
        unite: row[4],
        signatureLivraison: row[5],
        created: row[6],
        accuseReception: row[7],
        signatureReception: row[8],
        createdReception: row[9],
        livraisonAnnuler: row[10],
        reference: row[11]);
  }

  factory ApprovisionReceptionModel.fromJson(Map<String, dynamic> json) {
    return ApprovisionReceptionModel(
      id: json['id'],
      provision: json['provision'],
      departement: json['departement'],
      quantity: json['quantity'],
      unite: json['unite'],
      signatureLivraison: json["signatureLivraison"],
      created: DateTime.parse(json['created']),
      accuseReception: json["accuseReception"],
      signatureReception: json["signatureReception"],
      createdReception: DateTime.parse(json['createdReception']),
      livraisonAnnuler: json["livraisonAnnuler"],
      reference: json["reference"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'provision': provision,
      'departement': departement,
      'quantity': quantity,
      'unite': unite,
      'signatureLivraison': signatureLivraison,
      'created': created.toIso8601String(),
      'accuseReception': accuseReception,
      'signatureReception': signatureReception,
      'createdReception': createdReception.toIso8601String(),
      'livraisonAnnuler': livraisonAnnuler,
      'reference': reference,
    };
  }
}
