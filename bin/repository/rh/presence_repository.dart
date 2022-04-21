
import 'package:postgres/postgres.dart';

import '../../models/rh/presence_model.dart';

class PresenceRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PresenceRepository(this.executor, this.tableName);

  Future<List<PresenceModel>> getAllData() async {
    var data = <PresenceModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PresenceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PresenceModel presenceModel) async {
    var agent = presenceModel.agent;
    var arrive = presenceModel.arrive;
    var sortie = presenceModel.sortie;
    var presence = presenceModel.presence;
    var motif = presenceModel.motif;
    var approbationDG = presenceModel.approbationDG;
    var signatureDG = presenceModel.signatureDG;
    var signatureJustificationDG =
        presenceModel.signatureJustificationDG;

    var approbationFin = presenceModel.approbationFin;
    var signatureFin = presenceModel.signatureFin;
    var signatureJustificationFin =
        presenceModel.signatureJustificationFin;

    var approbationBudget = presenceModel.approbationBudget;
    var signatureBudget = presenceModel.signatureBudget;
    var signatureJustificationBudget =
        presenceModel.signatureJustificationBudget;

    var approbationDD = presenceModel.approbationDD;
    var signatureDD = presenceModel.signatureDD;
    var signatureJustificationDD =
        presenceModel.signatureJustificationDD;

    var signature = presenceModel.signature;
    var created = presenceModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('presences_id_seq'), '$agent',"
          "'$arrive','$sortie','$presence', '$motif',"
          "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
          "'$signature', '$created');");
    });
  }

  Future<void> update(PresenceModel presenceModel) async {
    var id = presenceModel.id;
    var agent = presenceModel.agent;
    var arrive = presenceModel.arrive;
    var sortie = presenceModel.sortie;
    var presence = presenceModel.presence;
    var motif = presenceModel.motif;
    var approbationDG = presenceModel.approbationDG;
    var signatureDG = presenceModel.signatureDG;
    var signatureJustificationDG = presenceModel.signatureJustificationDG;

    var approbationFin = presenceModel.approbationFin;
    var signatureFin = presenceModel.signatureFin;
    var signatureJustificationFin = presenceModel.signatureJustificationFin;

    var approbationBudget = presenceModel.approbationBudget;
    var signatureBudget = presenceModel.signatureBudget;
    var signatureJustificationBudget =
        presenceModel.signatureJustificationBudget;

    var approbationDD = presenceModel.approbationDD;
    var signatureDD = presenceModel.signatureDD;
    var signatureJustificationDD = presenceModel.signatureJustificationDD;

    var signature = presenceModel.signature;
    var created = presenceModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"matricule\"='$agent', \"arrive\"='$arrive',"
        "\"sortie\"='$sortie',\"presence\"='$presence', \"motif\"='$motif',"
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
    // await ConnexionDatabase().closeConnection(executor);
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

  Future<PresenceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PresenceModel(
      id: data[0][0],
      agent: data[0][1],
      arrive: data[0][2],
      sortie: data[0][3],
      presence: data[0][4],
      motif: data[0][5],
      approbationDG: data[0][6],
      signatureDG: data[0][7],
      signatureJustificationDG: data[0][8],
      approbationFin: data[0][9],
      signatureFin: data[0][10],
      signatureJustificationFin: data[0][11],
      approbationBudget: data[0][12],
      signatureBudget: data[0][13],
      signatureJustificationBudget: data[0][14],
      approbationDD: data[0][15],
      signatureDD: data[0][16],
      signatureJustificationDD: data[0][17],
      signature: data[0][18],
      created: data[0][19]
    );
  }
}