import 'package:postgres/postgres.dart';

import '../../models/rh/paiement_model.dart';

class PaiementRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PaiementRepository(this.executor, this.tableName);

  Future<List<PaiementModel>> getAllData() async {
    var data = <PaiementModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PaiementModel.fromSQL(row));
    }
    return data.toList();
  }


  Future<void> insertData(PaiementModel paiementModel) async {
    var matricule = paiementModel.matricule;
    var observation = paiementModel.observation;
    var modePaiement = paiementModel.modePaiement;
    var prime = paiementModel.prime;
    var created = paiementModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('paiements_id_seq'), '$matricule',"
        "'$observation','$modePaiement','$prime', '$created');");
    });
  }

  Future<void> update(PaiementModel paiementModel) async {
    var id = paiementModel.id;
    var matricule = paiementModel.matricule;
    var observation = paiementModel.observation;
    var modePaiement = paiementModel.modePaiement;
    var prime = paiementModel.prime;
    var created = paiementModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"matricule\"='$matricule', \"observation\"='$observation',"
        "\"modePaiement\"='$modePaiement',\"prime\"='$prime',"
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

  Future<PaiementModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PaiementModel(
      id: data[0][0],
      matricule: data[0][1],
      observation: data[0][2],
      modePaiement: data[0][3],
      prime: data[0][4],
      created: data[0][5]
    );
  }
}