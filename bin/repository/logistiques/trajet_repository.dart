import 'package:postgres/postgres.dart';

import '../../models/logistiques/trajet_model.dart';

class TrajetRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  TrajetRepository(this.executor, this.tableName);

  Future<List<TrajetModel>> getAllData() async {
    var data = <TrajetModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(TrajetModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(TrajetModel trajetModel) async {
    var nomeroEntreprise = trajetModel.nomeroEntreprise;
    var nomUtilisateur = trajetModel.nomUtilisateur;
    var trajetDe = trajetModel.trajetDe;
    var trajetA = trajetModel.trajetA;
    var mission = trajetModel.mission;
    var genkilometrageSoritere = trajetModel.kilometrageSorite;
    var kilometrageRetour = trajetModel.kilometrageRetour;

    var approbationDG = trajetModel.approbationDG;
    var signatureDG = trajetModel.signatureDG;
    var signatureJustificationDG = trajetModel.signatureJustificationDG;

    var approbationFin = trajetModel.approbationFin;
    var signatureFin = trajetModel.signatureFin;
    var signatureJustificationFin = trajetModel.signatureJustificationFin;

    var approbationBudget = trajetModel.approbationBudget;
    var signatureBudget = trajetModel.signatureBudget;
    var signatureJustificationBudget = trajetModel.signatureJustificationBudget;

    var approbationDD = trajetModel.approbationDD;
    var signatureDD = trajetModel.signatureDD;
    var signatureJustificationDD = trajetModel.signatureJustificationDD;

    var signature = trajetModel.signature;
    var created = trajetModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('trajets_id_seq'), '$nomeroEntreprise',"
        "'$nomUtilisateur', '$trajetDe', '$trajetA', '$mission', '$genkilometrageSoritere', '$kilometrageRetour',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature', '$created');");
    });
  }

  Future<void> update(TrajetModel trajetModel) async {
    var id = trajetModel.id;
    var nomeroEntreprise = trajetModel.nomeroEntreprise;
    var nomUtilisateur = trajetModel.nomUtilisateur;
    var trajetDe = trajetModel.trajetDe;
    var trajetA = trajetModel.trajetA;
    var mission = trajetModel.mission;
    var genkilometrageSoritere = trajetModel.kilometrageSorite;
    var kilometrageRetour = trajetModel.kilometrageRetour;

    var approbationDG = trajetModel.approbationDG;
    var signatureDG = trajetModel.signatureDG;
    var signatureJustificationDG = trajetModel.signatureJustificationDG;

    var approbationFin = trajetModel.approbationFin;
    var signatureFin = trajetModel.signatureFin;
    var signatureJustificationFin = trajetModel.signatureJustificationFin;

    var approbationBudget = trajetModel.approbationBudget;
    var signatureBudget = trajetModel.signatureBudget;
    var signatureJustificationBudget = trajetModel.signatureJustificationBudget;

    var approbationDD = trajetModel.approbationDD;
    var signatureDD = trajetModel.signatureDD;
    var signatureJustificationDD = trajetModel.signatureJustificationDD;

    var signature = trajetModel.signature;
    var created = trajetModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nomeroEntreprise\"='$nomeroEntreprise', \"nomUtilisateur\"='$nomUtilisateur',"
        "\"trajetDe\"='$trajetDe', \"trajetA\"='$trajetA', \"mission\"='$mission',"
        "\"genkilometrageSoritere\"='$genkilometrageSoritere', \"kilometrageRetour\"='$kilometrageRetour',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
        "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
        "\"signatureJustificationFin\"='$signatureJustificationFin',"
        "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
        "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
        "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
        "\"signatureJustificationDD\"='$signatureJustificationDD',"
        "\"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
    });
  }

  deleteData(int id) async {
    try {
      await executor.transaction((conn) async {
        // ignore: unused_local_variable
        var result = await conn.execute('DELETE FROM $tableName WHERE id=$id;');
      });
    } catch (e) {
      'erreur $e';
    }
  }

  Future<TrajetModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return TrajetModel(
        id: data[0][0],
        nomeroEntreprise: data[0][1],
        nomUtilisateur: data[0][2],
        trajetDe: data[0][3],
        trajetA: data[0][4],
        mission: data[0][5],
        kilometrageSorite: data[0][6],
        kilometrageRetour: data[0][7],
        approbationDG: data[0][8],
        signatureDG: data[0][9],
        signatureJustificationDG: data[0][10],
        approbationFin: data[0][11],
        signatureFin: data[0][12],
        signatureJustificationFin: data[0][13],
        approbationBudget: data[0][14],
        signatureBudget: data[0][15],
        signatureJustificationBudget: data[0][16],
        approbationDD: data[0][17],
        signatureDD: data[0][18],
        signatureJustificationDD: data[0][19],
        signature: data[0][20],
        created: data[0][21]
    );
  }
}