import 'package:postgres/postgres.dart';

import '../../models/devis/devis_list_objets_model.dart';

class DevisListObjetRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DevisListObjetRepository(this.executor, this.tableName);

  Future<List<DevisListObjetsModel>> getAllData() async {
    var data = <DevisListObjetsModel>{};

    var querySQL = "SELECT * FROM $tableName;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(DevisListObjetsModel.fromSQL(row));
    }
    return data.toList();
  }
 
  Future<void> insertData(DevisListObjetsModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
          "INSERT INTO $tableName (id, reference_date, title,"
          "quantity, designation, montant_unitaire, montant_global)"
          "VALUES (nextval('devis_list_objets_id_seq'), @1, @2, @3, @4, @5, @6)",
          substitutionValues: {
            '1': data.referenceDate,
            '2': data.title,
            '3': data.quantity,
            '4': data.designation,
            '5': data.montantUnitaire,
            '6': data.montantGlobal
          });
    });
  }

  Future<void> update(DevisListObjetsModel data) async {
    await executor.query("""UPDATE $tableName
          SET reference_date = @1, title = @2, quantity = @3,
          designation = @4, montant_unitaire = @5,
          montant_global = @6 WHERE id = @7""", substitutionValues: {
      '1': data.referenceDate,
      '2': data.title,
      '3': data.quantity,
      '4': data.designation,
      '5': data.montantUnitaire,
      '6': data.montantGlobal,
      '7': data.id
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

  Future<DevisListObjetsModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DevisListObjetsModel(
        id: data[0][0],
        referenceDate: data[0][1],
        title: data[0][2],
        quantity: data[0][3],
        designation: data[0][4],
        montantUnitaire: data[0][5],
        montantGlobal: data[0][6]
    );
  }
}
