import 'package:postgres/postgres.dart';

import '../../models/charts/pie_chart_model.dart';
import '../../models/devis/devis_models.dart';

class DevisRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DevisRepository(this.executor, this.tableName);


  Future<List<DevisModel>> getAllData() async {
    var data = <DevisModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(DevisModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<PieChartModel>> getDepartementChartPieMounth() async {
    try {
      var data = <PieChartModel>{};
    var querySQL =
          "SELECT departement, COUNT(departement) FROM $tableName WHERE \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY \"departement\";";
      // var querySQL =
      //     "SELECT departement, COUNT(departement) FROM $tableName GROUP BY \"departement\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartModel;
    }
  }

  Future<List<PieChartModel>> getDepartementChartPieYear() async {
    try {
      var data = <PieChartModel>{};
      var querySQL =
          "SELECT departement, COUNT(departement) FROM $tableName WHERE \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY \"departement\";";
      // var querySQL =
      //     "SELECT departement, COUNT(departement) FROM $tableName GROUP BY \"departement\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartModel;
    }
  }

  Future<void> insertData(DevisModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
          "INSERT INTO $tableName (id, title, priority,"
          "departement, list, ligne_budgtaire, resources, observation,"
          "signature, created)"
          "VALUES (nextval('devis_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8 , @9)",
          substitutionValues: {
            '1': data.title,
            '2': data.priority,
            '3': data.departement,
            '4': data.list,
            '5': data.ligneBudgtaire,
            '6': data.resources,
            '7': data.observation,
            '8': data.signature,
            '9': data.created
          });
    });
  }

  Future<void> update(DevisModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET title = @1, priority = @2, departement = @3,"
          "list = @4, ligne_budgtaire = @5, resources = @6, observation = @7,"
          "signature = @8, created = @9 WHERE id = @10",
          substitutionValues: {
            '1': data.title,
            '2': data.priority,
            '3': data.departement,
            '4': data.list,
            '5': data.ligneBudgtaire,
            '6': data.resources,
            '7': data.observation,
            '8': data.signature,
            '9': data.created,
            '10': data.id
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

  Future<DevisModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DevisModel(
      id: data[0][0],
      title: data[0][1],
      priority: data[0][2],
      departement: data[0][3],
      list: data[0][4],
      ligneBudgtaire: data[0][5],
      resources: data[0][6],
      observation: data[0][7],
      signature: data[0][8],
      created: data[0][9]
    );
  } 
}