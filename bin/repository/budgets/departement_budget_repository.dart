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
        "signature, created)"
        "VALUES (nextval('departement_budgets_id_seq'), @1, @2, @3, @4, @5, @6)",
        substitutionValues: {
          '1': data.title,
          '2': data.departement,
          '3': data.periodeDebut,
          '4': data.periodeFin,
          '5': data.signature,
          '6': data.created
          }
        );
    });
  }

  Future<void> update(DepartementBudgetModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET title = @1, departement = @2, periode_debut = @3, periode_fin = @4,"
        "signature = @5, created = @6 WHERE id = @7",
        substitutionValues: {
          '1': data.title,
          '2': data.departement,
          '3': data.periodeDebut,
          '4': data.periodeFin,
          '5': data.signature,
          '6': data.created,
          '7': data.id
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
      created: data[0][6]
    );
  } 
}