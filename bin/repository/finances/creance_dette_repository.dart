import 'package:postgres/postgres.dart';

import '../../models/finances/creance_dette_model.dart';

class CreanceDetteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CreanceDetteRepository(this.executor, this.tableName);

  Future<List<CreanceDetteModel>> getAllData() async {
    var data = <CreanceDetteModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CreanceDetteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CreanceDetteModel data) async {
    var nomComplet = data.nomComplet;
    var pieceJustificative = data.pieceJustificative;
    var libelle = data.libelle;
    var creanceDette = data.creanceDette;
    var montant = data.montant;

    var signature = data.signature;
    var created = data.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('creance_dettes_id_seq'), '$nomComplet',"
          "'$pieceJustificative','$libelle','$montant', '$creanceDette',"
          "'$signature', '$created');");
    });
  }

  Future<void> update(CreanceDetteModel data) async {
    var id = data.id;
    var nomComplet = data.nomComplet;
    var pieceJustificative = data.pieceJustificative;
    var libelle = data.libelle;
    var montant = data.montant;
    var creanceDette = data.creanceDette;
    var signature = data.signature;
    var created = data.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"nomComplet\"='$nomComplet', "
          "\"pieceJustificative\"='$pieceJustificative', \"libelle\"='$libelle',"
          "\"montant\"='$montant', \"creanceDette\"='$creanceDette',"
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

  Future<CreanceDetteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CreanceDetteModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        libelle: data[0][3],
        montant: data[0][4],
        creanceDette: data[0][5],
        signature: data[0][6],
        created: data[0][7]);
  }
}
