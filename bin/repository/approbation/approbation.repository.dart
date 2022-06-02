import 'package:postgres/postgres.dart';

import '../../models/approbation/approbation_model.dart';

class ApprobationRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ApprobationRepository(this.executor, this.tableName);


  Future<List<ApprobationModel>> getAllData() async {
    var data = <ApprobationModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ApprobationModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ApprobationModel data) async {
   await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, reference, title, departement, fontction_occupee,"
          "ligne_budgtaire, resources, approbation, justification, signature, created)"
              "VALUES (nextval('approbations_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10)",
          substitutionValues: {
            '1': data.reference,
            '2': data.title,
            '3': data.departement,
            '4': data.fontctionOccupee,
            '5': data.ligneBudgtaire,
            '6': data.resources,
            '7': data.approbation,
            '8': data.justification,
            '9': data.signature,
            '10': data.created
          }); 
    });
  }

  Future<void> update(ApprobationModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
          "SET reference = @1, title = @2, departement = @3, fontction_occupee = @4,"
          "ligne_budgtaire = @5, resources = @6, approbation = @7, justification = @8,"
          "signature = @9, created = @10 WHERE id = @11",
          substitutionValues: {
            '1': data.reference,
            '2': data.title,
            '3': data.departement,
            '4': data.fontctionOccupee,
            '5': data.ligneBudgtaire,
            '6': data.resources,
            '7': data.approbation,
            '8': data.justification,
            '9': data.signature,
            '10': data.created,
            '11': data.id
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

  Future<ApprobationModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ApprobationModel(
      id: data[0][0],
      reference: data[0][1],
      title: data[0][2],
      departement: data[0][3],
      fontctionOccupee: data[0][4],
      ligneBudgtaire: data[0][5],
      resources: data[0][6],
      approbation: data[0][7],
      justification: data[0][8],
      signature: data[0][9],
      created: data[0][10]
    );
  } 
}