import 'package:postgres/postgres.dart';

import '../../models/devis/devis_models.dart';

class DevisRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DevisRepository(this.executor, this.tableName);


  Future<List<DevisModel>> getAllData() async {
    var data = <DevisModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(DevisModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(DevisModel devisModel) async {
    var title = devisModel.title;
    var priority = devisModel.priority;
    var departement = devisModel.departement;
    var list = devisModel.list;
    var approbation = devisModel.approbation;
    var observation = devisModel.observation;
    var signatureDG = devisModel.signatureDG;
    var signatureReception = devisModel.signatureReception;
    var signatureEmission = devisModel.signatureEmission;
    var created = devisModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('devis_id_seq'), '$title',"
        "'$priority','$departement','$list','$approbation',"
        "'$observation','$signatureDG','$signatureReception','$signatureEmission', '$created');");
    });
  }

  Future<void> update(DevisModel devisModel) async {
    var id = devisModel.id;
    var title = devisModel.title;
    var priority = devisModel.priority;
    var departement = devisModel.departement;
    var list = devisModel.list;
    var approbation = devisModel.approbation;
    var observation = devisModel.observation;
    var signatureDG = devisModel.signatureDG;
    var signatureReception = devisModel.signatureReception;
    var signatureEmission = devisModel.signatureEmission;
    var created = devisModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"title\"='$title', "
          "\"priority\"='$priority',\"departement\"='$departement',"
          "\"list\"='$list',\"approbation\"='$approbation',"
          "\"observation\"='$observation', \"signatureDG\"='$signatureDG',"
          "\"signatureReception\"='$signatureReception', \"signatureEmission\"='$signatureEmission',"
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

  Future<DevisModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DevisModel(
      id: data[0][0],
      title: data[0][1],
      priority: data[0][2],
      departement: data[0][3],
      list: data[0][4],
      approbation: data[0][5],
      observation: data[0][6],
      signatureDG: data[0][7],
      signatureReception: data[0][8],
      signatureEmission: data[0][9],
      created: data[0][10]
    );
  } 
}