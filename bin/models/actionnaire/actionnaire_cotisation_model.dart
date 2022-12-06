class ActionnaireCotisationModel {
  late int? id;
  late int reference;
  late String nom;
  late String postNom;
  late String prenom;
  late String matricule;
  late String montant;
  late String note; // Une remarque soit pour un Paiement moitié
  late String moyenPaiement; // Paypal, card credit, mobile money(Mpesa)
  late String numeroTransaction; // Pour verifier la transaction
  late String signature;
  late DateTime created;

  ActionnaireCotisationModel(
      {this.id,
      required this.reference,
      required this.nom,
      required this.postNom,
      required this.prenom,
      required this.matricule,
      required this.montant,
      required this.note,
      required this.moyenPaiement,
      required this.numeroTransaction,
      required this.signature,
      required this.created});

  factory ActionnaireCotisationModel.fromSQL(List<dynamic> row) {
    return ActionnaireCotisationModel(
        id: row[0],
        reference: row[1],
        nom: row[2],
        postNom: row[3],
        prenom: row[4],
        matricule: row[5],
        montant: row[6],
        note: row[7],
        moyenPaiement: row[8],
        numeroTransaction: row[9],
        signature: row[10],
        created: row[11]);
  }

  factory ActionnaireCotisationModel.fromJson(Map<String, dynamic> json) {
    return ActionnaireCotisationModel(
        id: json['id'],
        reference: json['reference'],
        nom: json["nom"],
        postNom: json["postNom"],
        prenom: json["prenom"],
        matricule: json["matricule"],
        montant: json['montant'],
        note: json['note'],
        moyenPaiement: json['moyenPaiement'],
        numeroTransaction: json['numeroTransaction'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'nom': nom,
      'postNom': postNom,
      'prenom': prenom,
      'matricule': matricule,
      'montant': montant,
      'note': note,
      'moyenPaiement': moyenPaiement,
      'numeroTransaction': numeroTransaction,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
