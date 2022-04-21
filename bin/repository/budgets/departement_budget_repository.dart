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
    var departement = departementBudgetModel.departement;
    var periodeBudget = departementBudgetModel.periodeBudget;
    var totalGlobalDispo = departementBudgetModel.totalGlobalDispo;
    var totalGlobalFinExt = departementBudgetModel.totalGlobalFinExt;
    var totalGlobalPrevisionel = departementBudgetModel.totalGlobalPrevisionel;

    var approbationDG = departementBudgetModel.approbationDG;
    var signatureDG = departementBudgetModel.signatureDG;
    var signatureJustificationDG = departementBudgetModel.signatureJustificationDG;

    var approbationFin = departementBudgetModel.approbationFin;
    var signatureFin = departementBudgetModel.signatureFin;
    var signatureJustificationFin = departementBudgetModel.signatureJustificationFin;

    var approbationBudget = departementBudgetModel.approbationBudget;
    var signatureBudget = departementBudgetModel.signatureBudget;
    var signatureJustificationBudget =
        departementBudgetModel.signatureJustificationBudget;

    var approbationDD = departementBudgetModel.approbationDD;
    var signatureDD = departementBudgetModel.signatureDD;
    var signatureJustificationDD =
        departementBudgetModel.signatureJustificationDD;

    var signature = departementBudgetModel.signature;
    var created = departementBudgetModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('departement_budgets_id_seq'), '$departement',"
        "'$periodeBudget','$totalGlobalDispo','$totalGlobalFinExt', '$totalGlobalPrevisionel',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(DepartementBudgetModel departementBudgetModel) async {
    var id = departementBudgetModel.id;
    var departement = departementBudgetModel.departement;
    var periodeBudget = departementBudgetModel.periodeBudget;
    var totalGlobalDispo = departementBudgetModel.totalGlobalDispo;
    var totalGlobalFinExt = departementBudgetModel.totalGlobalFinExt;
    var totalGlobalPrevisionel = departementBudgetModel.totalGlobalPrevisionel;
    
    var approbationDG = departementBudgetModel.approbationDG;
    var signatureDG = departementBudgetModel.signatureDG;
    var signatureJustificationDG =
        departementBudgetModel.signatureJustificationDG;

    var approbationFin = departementBudgetModel.approbationFin;
    var signatureFin = departementBudgetModel.signatureFin;
    var signatureJustificationFin =
        departementBudgetModel.signatureJustificationFin;

    var approbationBudget = departementBudgetModel.approbationBudget;
    var signatureBudget = departementBudgetModel.signatureBudget;
    var signatureJustificationBudget =
        departementBudgetModel.signatureJustificationBudget;

    var approbationDD = departementBudgetModel.approbationDD;
    var signatureDD = departementBudgetModel.signatureDD;
    var signatureJustificationDD =
        departementBudgetModel.signatureJustificationDD;

    var signature = departementBudgetModel.signature;
    var created = departementBudgetModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"departement\"='$departement', \"periodeBudget\"='$periodeBudget',"
        "\"totalGlobalDispo\"='$totalGlobalDispo',\"totalGlobalFinExt\"='$totalGlobalFinExt',"
        "\"totalGlobalPrevisionel\"='$totalGlobalPrevisionel',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
        "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
        "\"signatureJustificationFin\"='$signatureJustificationFin',"
        "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
        "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
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

  Future<DepartementBudgetModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DepartementBudgetModel(
      id: data[0][0],
      departement: data[0][1],
      periodeBudget: data[0][2],
      totalGlobalDispo: data[0][3],
      totalGlobalFinExt: data[0][4],
      totalGlobalPrevisionel: data[0][5],

      approbationDG: data[0][6],
      signatureDG: data[0][7],
      signatureJustificationDG: data[0][8],

      approbationFin: data[0][9],
      signatureFin: data[0][10],
      signatureJustificationFin: data[0][11],

      approbationBudget: data[0][12],
      signatureBudget: data[0][13],
      signatureJustificationBudget: data[0][14],

      approbationDD: data[0][15],
      signatureDD: data[0][16],
      signatureJustificationDD: data[0][17],

      signature: data[0][18],
      created: data[0][19]
    );
  } 
}