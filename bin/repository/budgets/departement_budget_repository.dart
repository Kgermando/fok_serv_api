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

  Future<void> insertData(DepartementBudgetModel departementBudgetModel) async {
    var title = departementBudgetModel.title;
    var departement = departementBudgetModel.departement;
    var periodeDebut = departementBudgetModel.periodeDebut;
    var periodeFin = departementBudgetModel.periodeFin;

    var signature = departementBudgetModel.signature;
    var created = departementBudgetModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('departement_budgets_id_seq'), '$title',"
        "'$departement', '$periodeDebut', '$periodeFin',"
        "'$signature', '$created');");
    });
  }

  Future<void> update(DepartementBudgetModel departementBudgetModel) async {
    var id = departementBudgetModel.id;
    var title = departementBudgetModel.title;
    var departement = departementBudgetModel.departement;
    var periodeDebut = departementBudgetModel.periodeDebut;
    var periodeFin = departementBudgetModel.periodeFin;

    var signature = departementBudgetModel.signature;
    var created = departementBudgetModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"title\"='$title',"
        "\"departement\"='$departement', \"periodeDebut\"='$periodeDebut',"
        "\"periodeFin\"='$periodeFin',"
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