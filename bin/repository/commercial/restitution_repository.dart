import 'package:postgres/postgres.dart';

import '../../models/commercial/restitution_model.dart';

class RestitutionRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  RestitutionRepository(this.executor, this.tableName);

  Future<List<RestitutionModel>> getAllData(String business) async {
    var data = <RestitutionModel>{};

    var querySQL =
        "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(RestitutionModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(RestitutionModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, id_product, quantity,"
          "unite, first_name, last_name, accuse_reception,"
          "accuse_reception_first_name, accuse_reception_last_name, role,"
          "succursale, signature, created, business, sync, async)"
          "VALUES (nextval('restitutions_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13, @14, @15)",
          substitutionValues: {
            '1': data.idProduct,
            '2': data.quantity,
            '3': data.unite,
            '4': data.firstName,
            '5': data.lastName,
            '6': data.accuseReception,
            '7': data.accuseReceptionFirstName,
            '8': data.accuseReceptionLastName,
            '9': data.role,
            '10': data.succursale,
            '11': data.signature,
            '12': data.created,
            '13': data.business,
            '14': data.sync,
            '15': data.async,
          });
    });
  }

  Future<void> update(RestitutionModel data) async {
    await executor.query("""UPDATE $tableName
          SET id_product = @1, quantity = @2, unite = @3,
          first_name = @4, last_name = @5, accuse_reception = @6,
          accuse_reception_first_name = @7, accuse_reception_last_name = @8,
          role = @9, succursale = @10,
          signature = @11, created = @12, business = @13, 
          sync = @14, async = @15 WHERE id = @15""", substitutionValues: {
      '1': data.idProduct,
      '2': data.quantity,
      '3': data.unite,
      '4': data.firstName,
      '5': data.lastName,
      '6': data.accuseReception,
      '7': data.accuseReceptionFirstName,
      '8': data.accuseReceptionLastName,
      '9': data.role,
      '10': data.succursale,
      '11': data.signature,
      '12': data.created,
      '13': data.business,
      '14': data.sync,
      '15': data.async,
      '16': data.id
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

  Future<RestitutionModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return RestitutionModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantity: data[0][2],
      unite: data[0][3],
      firstName: data[0][4],
      lastName: data[0][5],
      accuseReception: data[0][6],
      accuseReceptionFirstName: data[0][7],
      accuseReceptionLastName: data[0][8],
      role: data[0][9],
      succursale: data[0][10],
      signature: data[0][11],
      created: data[0][12],
      business: data[0][13],
      sync: data[0][14],
      async: data[0][15],
    );
  }
}
