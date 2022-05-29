class PerformenceModel {
  late int? id;
  late String agent;
  late String departement;
  late String hospitalite;
  late String ponctualite;
  late String travaille;
  late String signature; // celui qui fait le document
  late DateTime created;

  PerformenceModel(
      {this.id,
      required this.agent,
      required this.departement,
      required this.hospitalite,
      required this.ponctualite,
      required this.travaille,
      required this.signature,
      required this.created
      
    });

  factory PerformenceModel.fromSQL(List<dynamic> row) {
    return PerformenceModel(
        id: row[0],
        agent: row[1],
        departement: row[2],
        hospitalite: row[3],
        ponctualite: row[4],
        travaille: row[5],
        signature: row[6],
        created: row[7]
        
      );
  }

  factory PerformenceModel.fromJson(Map<String, dynamic> json) {
    return PerformenceModel(
      id: json['id'],
      agent: json['agent'],
      departement: json['departement'],
      hospitalite: json['hospitalite'],
      ponctualite: json['ponctualite'],
      travaille: json['travaille'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'departement': departement,
      'hospitalite': hospitalite,
      'ponctualite': ponctualite,
      'travaille': travaille,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}


class PerformenceNoteModel {
  late int? id;
  late String agent;
  late String departement;
  late String hospitalite;
  late String ponctualite;
  late String travaille;
  late String note; 
  late String signature;
  late DateTime created;

   PerformenceNoteModel(
      {this.id,
      required this.agent,
      required this.departement,
      required this.hospitalite,
      required this.ponctualite,
      required this.travaille,
      required this.note,
      required this.signature,
      required this.created});

  factory PerformenceNoteModel.fromSQL(List<dynamic> row) {
    return PerformenceNoteModel(
        id: row[0],
        agent: row[1],
        departement: row[2],
        hospitalite: row[3],
        ponctualite: row[4],
        travaille: row[5],
        note: row[6],
        signature: row[7],
        created: row[8]);
  }

  factory PerformenceNoteModel.fromJson(Map<String, dynamic> json) {
    return PerformenceNoteModel(
        id: json['id'],
        agent: json['agent'],
        departement: json['departement'],
        hospitalite: json['hospitalite'],
        ponctualite: json['ponctualite'],
        travaille: json['travaille'],
        note: json['note'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'departement': departement,
      'hospitalite': hospitalite,
      'ponctualite': ponctualite,
      'travaille': travaille,
      'note': note,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
