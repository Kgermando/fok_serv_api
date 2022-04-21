import 'agent_model.dart';

class PresenceModel {
  late int? id;
  late AgentModel agent;
  late DateTime arrive;
  late DateTime sortie;
  late bool presence;
  late String motif;
  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationFin;
  late String signatureFin;
  late String signatureJustificationFin;

  late String approbationBudget;
  late String signatureBudget;
  late String signatureJustificationBudget;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;

  late String signature; // celui qui fait le document
  late DateTime created;


  PresenceModel(
    {
      this.id,
      required this.agent,
      required this.arrive,
      required this.sortie,
      required this.presence,
      required this.motif,
      required this.approbationDG,
      required this.signatureDG,
      required this.signatureJustificationDG,
      required this.approbationFin,
      required this.signatureFin,
      required this.signatureJustificationFin,
      required this.approbationBudget,
      required this.signatureBudget,
      required this.signatureJustificationBudget,
      required this.approbationDD,
      required this.signatureDD,
      required this.signatureJustificationDD,
      required this.signature,
      required this.created
    }
  );

  factory PresenceModel.fromSQL(List<dynamic> row) {
    return PresenceModel(
      id: row[0], 
      agent: row[1], 
      arrive: row[2], 
      sortie: row[3], 
      presence: row[4], 
      motif: row[5],
      approbationDG: row[6],
      signatureDG: row[7],
      signatureJustificationDG: row[8],
      approbationFin: row[9],
      signatureFin: row[10],
      signatureJustificationFin: row[11],
      approbationBudget: row[12],
      signatureBudget: row[13],
      signatureJustificationBudget: row[14],
      approbationDD: row[15],
      signatureDD: row[16],
      signatureJustificationDD: row[17],
      signature: row[18],
      created: row[19]
    );
  }

  factory PresenceModel.fromJson(Map<String, dynamic> json) {
    return PresenceModel(
      id: json['id'],
      agent: json['agent'],
      arrive: DateTime.parse(json['arrive']),
      sortie: DateTime.parse(json['sortie']),
      presence: json['presence'],
      motif: json['motif'],
      approbationDG: json['approbationDG'],
      signatureDG: json['signatureDG'],
      signatureJustificationDG: json['signatureJustificationDG'],
      approbationFin: json['approbationFin'],
      signatureFin: json['signatureFin'],
      signatureJustificationFin: json['signatureJustificationFin'],
      approbationBudget: json['approbationBudget'],
      signatureBudget: json['signatureBudget'],
      signatureJustificationBudget: json['signatureJustificationBudget'],
      approbationDD: json['approbationDD'],
      signatureDD: json['signatureDD'],
      signatureJustificationDD: json['signatureJustificationDD'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'arrive': arrive.toIso8601String(),
      'sortie': sortie.toIso8601String(),
      'presence': presence,
      'motif': motif,
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationFin': approbationFin,
      'signatureFin': signatureFin,
      'signatureJustificationFin': signatureJustificationFin,
      'approbationBudget': approbationBudget,
      'signatureBudget': signatureBudget,
      'signatureJustificationBudget': signatureJustificationBudget,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
  
}
