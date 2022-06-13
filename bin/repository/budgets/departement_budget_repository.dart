import 'package:postgres/postgres.dart';

import '../../models/budgets/departement_budget_model.dart';

class DepartementBudgetRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DepartementBudgetRepository(this.executor, this.tableName);

 
  Future<List<DepartementBudgetModel>> getAllData() async {
    var data = <DepartementBudgetModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(DepartementBudgetModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(DepartementBudgetModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, title, departement, periode_debut, periode_fin,"
        "signature, created_ref, created, is_submit)"
        "VALUES (nextval('departement_budgets_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)",
        substitutionValues: {
          '1': data.title,
          '2': data.departement,
          '3': data.periodeDebut,
          '4': data.periodeFin,
          '5': data.signature,
          '6': data.createdRef,
          '7': data.created,
          '8': data.isSubmit
          }
        );
    });
  }




  Future<void> update(DepartementBudgetModel data) async {
    await executor.query(
        "UPDATE $tableName SET title = @title, departement = @departement, periode_debut = @periode_debut, periode_fin = @periode_fin, ignature = @signature, created_ref = @created_ref, created = @created, is_submit = @is_submit WHERE id = @id",
      substitutionValues: {
        'title': data.title,
        'departement': data.departement,
        'periode_debut': data.periodeDebut,
        'periode_fin': data.periodeFin,
        'signature': data.signature,
        'created_ref': data.createdRef,
        'created': data.created,
        'is_submit': data.isSubmit,
        'id': data.id
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

  Future<DepartementBudgetModel> getFromId(int id) async {

    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DepartementBudgetModel(
      id: data[0][0],
      title: data[0][1],
      departement: data[0][2],
      periodeDebut: data[0][3],
      periodeFin: data[0][4],
      signature: data[0][5],
      createdRef: data[0][6],
      created: data[0][7],
      isSubmit: data[0][8]
    );
  } 
}