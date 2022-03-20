import 'package:postgres/postgres.dart';

import '../../models/finances/creances_model.dart';

class CreancesRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CreancesRepository(this.executor, this.tableName);

  Future<List<CreanceModel>> getAllData() async {
    var data = <CreanceModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CreanceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CreanceModel creanceModel) async {
    var nomComplet = creanceModel.nomComplet;
    var pieceJustificative = creanceModel.pieceJustificative;
    var libelle = creanceModel.libelle;
    var montant = creanceModel.montant;
    var numeroOperation = creanceModel.numeroOperation;
    var created = creanceModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('creances_id_seq'), '$nomComplet',"
          "'$pieceJustificative','$libelle','$montant',"
          "'$numeroOperation', '$created');");
    });
  }

  Future<void> update(CreanceModel creanceModel) async {

    var id = creanceModel.id;
    var nomComplet = creanceModel.nomComplet;
    var pieceJustificative = creanceModel.pieceJustificative;
    var libelle = creanceModel.libelle;
    var montant = creanceModel.montant;
    var numeroOperation = creanceModel.numeroOperation;
    var created = creanceModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nomComplet\"='$nomComplet', "
        "\"pieceJustificative\"='$pieceJustificative',\"libelle\"='$libelle',"
        "\"montant\"='$montant', \"numeroOperation\"='$numeroOperation',"
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

  Future<CreanceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CreanceModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        libelle: data[0][3],
        montant: data[0][4],
        numeroOperation: data[0][5],
        created: data[0][6]);
  }

}