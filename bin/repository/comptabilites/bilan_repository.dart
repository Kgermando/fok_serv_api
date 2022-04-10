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
    var comptes = bilanModel.comptes;
    var intitule = bilanModel.intitule;
    var montant = bilanModel.montant;
    var typeBilan = bilanModel.typeBilan;
    var created = bilanModel.created;
    var signature = bilanModel.signature;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('bilans_id_seq'), '$titleBilan',"
          "'$comptes','$intitule','$montant','$typeBilan','$created','$signature');");
    });
  }

  Future<void> update(BilanModel bilanModel) async {
    var id = bilanModel.id;
    var titleBilan = bilanModel.titleBilan;
    var comptes = bilanModel.comptes;
    var intitule = bilanModel.intitule;
    var montant = bilanModel.montant;
    var typeBilan = bilanModel.typeBilan;
    var created = bilanModel.created;
    var signature = bilanModel.signature;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"titleBilan\"='$titleBilan', "
          "\"comptes\"='$comptes',\"intitule\"='$intitule',"
          "\"montant\"='$montant',\"typeBilan\"='$typeBilan',"
          "\"created\"='$created',\"signature\"='$signature' WHERE id=$id;");
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
        comptes: data[0][2],
        intitule: data[0][3],
        montant: data[0][4],
        typeBilan: data[0][5],
        created: data[0][6],
        signature: data[0][7]);
  } 
  
}