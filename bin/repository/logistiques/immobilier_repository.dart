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

  Future<void> insertData(ImmobilierModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, type_allocation, adresse,"
          "numero_certificat, superficie, date_acquisition, signature, created)"
          "VALUES (nextval('immobiliers_id_seq'), @1, @2, @3, @4, @5, @6, @7)",
          substitutionValues: {
            '1': data.typeAllocation,
            '2': data.adresse,
            '3': data.numeroCertificat,
            '4': data.superficie,
            '5': data.dateAcquisition,
            '6': data.signature,
            '7': data.created
          });
    });
  }

  Future<void> update(ImmobilierModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET type_allocation = @1, adresse = @2, numero_certificat = @3,"
          "superficie = @4, date_acquisition = @5,"
          "signature = @6, created = @7 WHERE id = @8",
          substitutionValues: {
            '1': data.typeAllocation,
            '2': data.adresse,
            '3': data.numeroCertificat,
            '4': data.superficie,
            '5': data.dateAcquisition,
            '6': data.signature,
            '7': data.created,
            '8': data.id
          });
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