import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/succursale_model.dart';

class SuccursaleRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  SuccursaleRepository(this.executor, this.tableName);

  Future<List<SuccursaleModel>> getAllData() async {
    var data = <SuccursaleModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(SuccursaleModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(SuccursaleModel succursaleModel) async {
    var name = succursaleModel.name;
    var adresse = succursaleModel.adresse;
    var province = succursaleModel.province;
   
    var approbationDG = succursaleModel.approbationDG;
    var signatureDG = succursaleModel.signatureDG;
    var signatureJustificationDG =
        succursaleModel.signatureJustificationDG;

    var approbationDD = succursaleModel.approbationDD;
    var signatureDD = succursaleModel.signatureDD;
    var signatureJustificationDD =
        succursaleModel.signatureJustificationDD;

    var signature = succursaleModel.signature;
    var created = succursaleModel.created;



    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('succursales_id_seq'), '$name', '$adresse', '$province',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG',"
        "'$approbationDD', '$signatureDD', '$signatureJustificationDD',"
        "'$signature', '$created');");
    });
  }

  Future<void> update(SuccursaleModel succursaleModel) async {
    var id = succursaleModel.id;
    var name = succursaleModel.name;
    var adresse = succursaleModel.adresse;
    var province = succursaleModel.province;
    var approbationDG = succursaleModel.approbationDG;
    var signatureDG = succursaleModel.signatureDG;
    var signatureJustificationDG = succursaleModel.signatureJustificationDG;

    var approbationDD = succursaleModel.approbationDD;
    var signatureDD = succursaleModel.signatureDD;
    var signatureJustificationDD = succursaleModel.signatureJustificationDD;

    var signature = succursaleModel.signature;
    var created = succursaleModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"name\"='$name', "
        "\"adresse\"='$adresse', \"province\"='$province',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
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

  Future<SuccursaleModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return SuccursaleModel(
      id: data[0][0],
      name: data[0][1],
      adresse: data[0][2],
      province: data[0][3],
      approbationDG: data[0][4],
      signatureDG: data[0][5],
      signatureJustificationDG: data[0][6],
      approbationDD: data[0][7],
      signatureDD: data[0][8],
      signatureJustificationDD: data[0][9],
      signature: data[0][10],
      created: data[0][11]
    );
  } 
}