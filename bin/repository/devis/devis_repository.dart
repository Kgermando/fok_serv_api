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

  Future<void> insertData(DevisModel devisModel) async {
    var title = devisModel.title;
    var priority = devisModel.priority;
    var departement = devisModel.departement;
    var list = devisModel.list;
    var ligneBudgtaire = devisModel.ligneBudgtaire;
    var resources = devisModel.resources;
    var observation = devisModel.observation;

    var signature = devisModel.signature;
    var created = devisModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('devis_id_seq'), '$title',"
        "'$priority','$departement','$list', '$ligneBudgtaire', '$resources', '$observation',"
        "'$signature','$created');");
    });
  }

  Future<void> update(DevisModel devisModel) async {
    var id = devisModel.id;
    var title = devisModel.title;
    var priority = devisModel.priority;
    var departement = devisModel.departement;
    var list = devisModel.list;
    var ligneBudgtaire = devisModel.ligneBudgtaire;
    var resources = devisModel.resources;
    var observation = devisModel.observation;

    var signature = devisModel.signature;
    var created = devisModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"title\"='$title', "
          "\"priority\"='$priority',\"departement\"='$departement',"
          "\"list\"='$list', \"ligneBudgtaire\"='$ligneBudgtaire', \"resources\"='$resources',"
          "\"observation\"='$observation',"
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