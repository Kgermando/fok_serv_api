import 'package:postgres/postgres.dart';

import '../../models/logistiques/approvisionnement_model.dart';
 

class ApprovisionnementRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ApprovisionnementRepository(this.executor, this.tableName);

  Future<List<ApprovisionnementModel>> getAllData() async {
    var data = <ApprovisionnementModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ApprovisionnementModel.fromSQL(row));
    }
    return data.toList();
  }
 
  Future<void> insertData(ApprovisionnementModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, provision, quantity_total, quantity, unite,"
        "signature, created, fournisseur)"
        "VALUES (nextval('approvisionnements_id_seq'), @1, @2, @3, @4, @5, @6, @7)",
        substitutionValues: {
          '1': data.provision,
          '2': data.quantityTotal,
          '3': data.quantity,
          '4': data.unite,
          '5': data.signature,
          '6': data.created,
          '7': data.fournisseur
        });
    });
  }


  
  Future<void> update(ApprovisionnementModel data) async {
    await executor.execute("""UPDATE $tableName
        SET provision = @1, quantity_total = @2, quantity = @3, unite = @4, signature = @5,
        created = @6, fournisseur = @7 WHERE id = @8""",

        substitutionValues: {
          '1': data.provision,
          '2': data.quantityTotal,
          '3': data.quantity,
          '4': data.unite,
          '5': data.signature,
          '6': data.created,
          '7': data.fournisseur,
          '8': data.id
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

  Future<ApprovisionnementModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ApprovisionnementModel(
      id: data[0][0],
      provision: data[0][1],
      quantityTotal: data[0][2],
      quantity: data[0][3],
      unite: data[0][4],
      signature: data[0][5],
      created: data[0][6],
      fournisseur: data[0][7],
    );
  }
}