import 'package:postgres/postgres.dart';

import '../../models/rh/paiement_salaire_model.dart';

class PaiementSalaireRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PaiementSalaireRepository(this.executor, this.tableName);

  Future<List<PaiementSalaireModel>> getAllData() async {
    var data = <PaiementSalaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PaiementSalaireModel.fromSQL(row));
    }
    return data.toList();
  }


  Future<void> insertData(PaiementSalaireModel paiementSalaireModel) async {
    var agent = paiementSalaireModel.agent;
    var observation = paiementSalaireModel.observation;
    var modePaiement = paiementSalaireModel.modePaiement;
    var created = paiementSalaireModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('paiement_salaires_id_seq'), '$agent',"
        "'$observation','$modePaiement', '$created');");
    });
  }

  Future<void> update(PaiementSalaireModel paiementSalaireModel) async {
    var id = paiementSalaireModel.id;
    var agent = paiementSalaireModel.agent;
    var observation = paiementSalaireModel.observation;
    var modePaiement = paiementSalaireModel.modePaiement;
    var created = paiementSalaireModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
      "UPDATE $tableName SET \"agent\"='$agent', \"observation\"='$observation',"
      "\"modePaiement\"='$modePaiement',"
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

  Future<PaiementSalaireModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PaiementSalaireModel(
      id: data[0][0],
      agent: data[0][1],
      observation: data[0][2],
      modePaiement: data[0][3],
      created: data[0][4]
    );
  }
}