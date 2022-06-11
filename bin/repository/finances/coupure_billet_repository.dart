import 'package:postgres/postgres.dart';

import '../../models/finances/coupure_billet_model.dart';

class CoupureBilletRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CoupureBilletRepository(this.executor, this.tableName);

  Future<List<CoupureBilletModel>> getAllData() async {
    var data = <CoupureBilletModel>{};

    var querySQL = "SELECT * FROM $tableName;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CoupureBilletModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CoupureBilletModel data) async {
    await executor.transaction((ctx) async {
      ctx.execute(
        "INSERT INTO $tableName (id, reference, nombre_billet, coupure_billet)"
        "VALUES (nextval('coupure_billets_id_seq'), @1, @2, @3)",
        substitutionValues: {
          '1': data.reference,
          '2': data.nombreBillet,
          '3': data.coupureBillet
        });
    });
  }

  Future<void> update(CoupureBilletModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET reference = @1, nombre_billet = @2, coupure_billet = @3 WHERE id = @4",
        substitutionValues: {
          '1': data.reference,
          '2': data.nombreBillet,
          '3': data.coupureBillet,
          '4': data.id
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

  Future<CoupureBilletModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CoupureBilletModel(
      id: data[0][0],
      reference: data[0][1],
      nombreBillet: data[0][2],
      coupureBillet: data[0][3]
    );
  }
}
