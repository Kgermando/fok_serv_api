class Comptes {
  late String comptes;
  late String montant;

  Comptes({required this.comptes, required this.montant});

  factory Comptes.fromJson(Map<String, dynamic> json) {
    return Comptes(comptes: json['comptes'], montant: json['montant']);
  }
}
