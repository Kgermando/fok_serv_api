class TacheModel {
  late int? id;
  late String nom;
  late String numeroTache;
  late String agent;
  late String jalon; // reperes pour le projet
  late String tache; // Tache à faire par l'agent
  late String signatureResp; // signature responsable
  late DateTime created; // date creation par le boss
  late String read;
  late String departement;
  late int reference;

  TacheModel(
      {this.id,
      required this.nom,
      required this.numeroTache,
      required this.agent,
      required this.jalon,
      required this.tache,
      required this.signatureResp,
      required this.created,
      required this.read,
      required this.departement,
      required this.reference});

  factory TacheModel.fromSQL(List<dynamic> row) {
    return TacheModel(
    id: row[0],
    nom: row[1],
    numeroTache: row[2],
    agent: row[3],
    jalon: row[4],
    tache: row[5],
    signatureResp: row[6],
    created: row[7],
    read: row[8],
    departement: row[9],
    reference: row[10]);
  }

  factory TacheModel.fromJson(Map<String, dynamic> json) {
    return TacheModel(
        id: json['id'],
        nom: json['nom'],
        numeroTache: json['numeroTache'],
        agent: json['agent'],
        jalon: json['jalon'],
        tache: json['tache'],
        signatureResp: json['signatureResp'],
        created: DateTime.parse(json['created']),
        read: json['read'],
        departement: json['departement'],
        reference: json['reference']
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'numeroTache': numeroTache,
      'agent': agent,
      'jalon': jalon,
      'tache': tache,
      'signatureResp': signatureResp,
      'created': created.toIso8601String(),
      'read': read,
      'departement': departement,
      'reference': reference,
    };
  }
}
