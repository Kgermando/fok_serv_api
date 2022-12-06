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
        "signature, created_ref, created, is_submit,"
        "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
        "VALUES (nextval('departement_budgets_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11, @12, @13, @14)",
        substitutionValues: {
          '1': data.title,
          '2': data.departement,
          '3': data.periodeDebut,
          '4': data.periodeFin,
          '5': data.signature,
          '6': data.createdRef,
          '7': data.created,
          '8': data.isSubmit,
          '9': data.approbationDG,
          '10': data.motifDG,
          '11': data.signatureDG,
          '12': data.approbationDD,
          '13': data.motifDD,
          '14': data.signatureDD
          }
        );
    }); 
  }

  Future<void> update(DepartementBudgetModel data) async {
    await executor.query(
      """UPDATE $tableName
      SET title = @1, departement = @2, periode_debut = @3, 
      periode_fin = @4,
      signature = @5, created_ref = @6, created = @7, 
      is_submit = @8, approbation_dg = @9, motif_dg = @10,
      signature_dg = @11, approbation_dd = @12,
      motif_dd = @13, signature_dd = @14 WHERE id = @15""",
      substitutionValues: {
        '1': data.title,
        '2': data.departement,
        '3': data.periodeDebut,
        '4': data.periodeFin,
        '5': data.signature,
        '6': data.createdRef,
        '7': data.created,
        '8': data.isSubmit,
        '9': data.approbationDG,
        '10': data.motifDG,
        '11': data.signatureDG,
        '12': data.approbationDD,
        '13': data.motifDD,
        '14': data.signatureDD,
        '15': data.id
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
      isSubmit: data[0][8],
      approbationDG: data[0][9],
      motifDG: data[0][10],
      signatureDG: data[0][11],
      approbationDD: data[0][12],
      motifDD: data[0][13],
      signatureDD: data[0][14]
    );
  } 
}