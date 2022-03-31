import 'package:postgres/postgres.dart';

import '../../models/rh/paiement_divers_model.dart';

class PaiementDiversRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PaiementDiversRepository(this.executor, this.tableName);

  Future<List<PaiementDiversModel>> getAllData() async {
    var data = <PaiementDiversModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PaiementDiversModel.fromSQL(row));
    }
    return data.toList();
  }


  Future<void> insertData(PaiementDiversModel paiementDiversModel) async {
    var matricule = paiementDiversModel.agent;
    var observation = paiementDiversModel.observation;
    var modePaiement = paiementDiversModel.modePaiement;
    var divers = paiementDiversModel.divers ;
    var created = paiementDiversModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval(paiement_divers_id_seq'), '$matricule',"
        "'$observation','$modePaiement','$divers', '$created');");
    });
  }

  Future<void> update(PaiementDiversModel paiementDiversModel) async {
    var id = paiementDiversModel.id;
    var agent = paiementDiversModel.agent;
    var observation = paiementDiversModel.observation;
    var modePaiement = paiementDiversModel.modePaiement;
    var divers = paiementDiversModel.divers;
    var created = paiementDiversModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"matricule\"='$agent', \"observation\"='$observation',"
        "\"modePaiement\"='$modePaiement',\"prime\"='$divers',"
        "\"created\"='$created' WHERE id=$id;");
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

  Future<PaiementDiversModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PaiementDiversModel(
      id: data[0][0],
      agent: data[0][1],
      observation: data[0][2],
      modePaiement: data[0][3],
      divers: data[0][4],
      created: data[0][5]
    );
  }
}