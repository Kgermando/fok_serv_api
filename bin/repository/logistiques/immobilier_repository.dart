import 'package:postgres/postgres.dart';

import '../../models/logistiques/immobilier_model.dart';

class ImmobilierRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ImmobilierRepository(this.executor, this.tableName);

    Future<List<ImmobilierModel>> getAllData() async {
    var data = <ImmobilierModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ImmobilierModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ImmobilierModel immobilierModel) async {
    var typeAllocation = immobilierModel.typeAllocation;
    var adresse = immobilierModel.adresse;
    var numeroCertificat = immobilierModel.numeroCertificat;
    var superficie = immobilierModel.superficie;
    var dateAcquisition = immobilierModel.dateAcquisition; 

    var signature = immobilierModel.signature;
    var created = immobilierModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('immobiliers_id_seq'), '$typeAllocation',"
        "'$adresse', '$numeroCertificat', '$superficie', '$dateAcquisition'," 
        "'$signature', '$created');");
    });
  }

  Future<void> update(ImmobilierModel immobilierModel) async {
    var id = immobilierModel.id;
    var typeAllocation = immobilierModel.typeAllocation;
    var adresse = immobilierModel.adresse;
    var numeroCertificat = immobilierModel.numeroCertificat;
    var superficie = immobilierModel.superficie;
    var dateAcquisition = immobilierModel.dateAcquisition; 

    var signature = immobilierModel.signature;
    var created = immobilierModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"typeAllocation\"='$typeAllocation', \"adresse\"='$adresse',"
        "\"numeroCertificat\"='$numeroCertificat', \"superficie\"='$superficie',"
        "\"dateAcquisition\"='$dateAcquisition'," 
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

  Future<ImmobilierModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ImmobilierModel(
      id: data[0][0],
      typeAllocation: data[0][1],
      adresse: data[0][2],
      numeroCertificat: data[0][3],
      superficie: data[0][4],
      dateAcquisition: data[0][5],
      signature: data[0][6],
      created: data[0][7]
        
    );
  }
}