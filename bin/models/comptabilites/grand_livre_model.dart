class GrandLivreModel {
  late String comptedebit;
  late String comptecredit;
  late DateTime dateStart;
  late DateTime dateEnd;

  GrandLivreModel(
      {required this.comptedebit,
      required this.comptecredit,
      required this.dateStart,
      required this.dateEnd});

  factory GrandLivreModel.fromJson(Map<String, dynamic> json) {
    return GrandLivreModel(
        comptedebit: json['comptedebit'],
        comptecredit: json['comptecredit'],
        dateStart: DateTime.parse(json['dateStart']),
        dateEnd: DateTime.parse(json['dateEnd']));
  }

  Map<String, dynamic> toJson() {
    return {
      'comptedebit': comptedebit,
      'comptecredit': comptecredit,
      'dateStart': dateStart.toIso8601String(),
      'dateEnd': dateEnd.toIso8601String()
    };
  }
}
