import 'package:postgres/postgres.dart';

import '../../models/comptabilites/bilan_model.dart';

class BilanRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BilanRepository(this.executor, this.tableName);

  Future<List<BilanModel>> getAllData() async {
    var data = <BilanModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BilanModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BilanModel bilanModel) async {
    var titleBilan = bilanModel.titleBilan;
    var comptesActif = bilanModel.comptesActif;
    var comptesPactif = bilanModel.comptesPactif;
    var statut = bilanModel.statut;

    var signature = bilanModel.signature;
    var created = bilanModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('bilans_id_seq'), '$titleBilan',"
        "'$comptesActif','$comptesPactif','$statut',"
        "'$signature','$created');");
    });
  }

  Future<void> update(BilanModel bilanModel) async {
    var id = bilanModel.id;
    var titleBilan = bilanModel.titleBilan;
    var comptesActif = bilanModel.comptesActif;
    var comptesPactif = bilanModel.comptesPactif;
    var statut = bilanModel.statut;

    var signature = bilanModel.signature;
    var created = bilanModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "UPDATE $tableName SET \"titleBilan\"='$titleBilan',"
          "\"comptesActif\"='$comptesActif', \"comptesPactif\"='$comptesPactif',"
          "\"statut\"='$statut',"
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

  Future<BilanModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BilanModel(
      id: data[0][0],
      titleBilan: data[0][1],
      comptesActif: data[0][2],
      comptesPactif: data[0][3],
      statut: data[0][4],
      signature: data[0][5],
      created: data[0][6]   
    );
  }
  
}