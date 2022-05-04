class Comptes {
  late String comptes;
  late String motant;

  Comptes({required this.comptes, required this.motant});

  factory Comptes.fromJson(Map<String, dynamic> json) {
    return Comptes(comptes: json['comptes'], motant: json['motant']);
  }
}
