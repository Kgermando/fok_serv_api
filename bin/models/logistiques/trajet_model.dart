class TrajetModel {
  late int? id;
  late String nomeroEntreprise;
  late String nomUtilisateur;
  late String trajetDe;
  late String trajetA;
  late String mission;
  late String kilometrageSorite;
  late String kilometrageRetour;
  late String signature; // celui qui fait le document
  late DateTime created;

  TrajetModel(
      {this.id,
      required this.nomeroEntreprise,
      required this.nomUtilisateur,
      required this.trajetDe,
      required this.trajetA,
      required this.mission,
      required this.kilometrageSorite,
      required this.kilometrageRetour, 
      required this.signature,
      required this.created
  });

  factory TrajetModel.fromSQL(List<dynamic> row) {
    return TrajetModel(
        id: row[0],
        nomeroEntreprise: row[1],
        nomUtilisateur: row[2],
        trajetDe: row[3],
        trajetA: row[4],
        mission: row[5],
        kilometrageSorite: row[6],
        kilometrageRetour: row[7], 
        signature: row[8],
        created: row[9]
        
    );
  }

  factory TrajetModel.fromJson(Map<String, dynamic> json) {
    return TrajetModel(
        id: json['id'],
        nomeroEntreprise: json['nomeroEntreprise'],
        nomUtilisateur: json['nomUtilisateur'],
        trajetDe: json['trajetDe'],
        trajetA: json['trajetA'],
        mission: json['mission'],
        kilometrageSorite: json['kilometrageSorite'],
        kilometrageRetour: json['kilometrageRetour'],
        signature: json['signature'],
        created: DateTime.parse(json['created'])
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomeroEntreprise': nomeroEntreprise,
      'nomUtilisateur': nomUtilisateur,
      'trajetDe': trajetDe,
      'trajetA': trajetA,
      'mission': mission,
      'kilometrageSorite': kilometrageSorite,
      'kilometrageRetour': kilometrageRetour,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
