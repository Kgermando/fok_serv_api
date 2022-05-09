import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/courbe_vente_gain_model.dart';
import '../../../models/comm_maketing/vente_cart_model.dart';
import '../../../models/comm_maketing/vente_chart_model.dart';

class VenteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  VenteRepository(this.executor, this.tableName);


  Future<List<VenteCartModel>> getAllData() async {
    var data = <VenteCartModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(VenteCartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<VenteChartModel>> getAllDataChart() async {
    var data = <VenteChartModel>{};
    var querySQL =
        "SELECT 'idProductCart', COUNT(*) AS count, SUM(\"priceTotalCart\"::FLOAT * 1) FROM $tableName GROUP BY \"idProductCart\" ORDER BY count DESC LIMIT 10;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(VenteChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeVenteModel>> getAllDataChartMounth() async {
    var data = <CourbeVenteModel>{};

    var querySQL =
        "SELECT EXTRACT(MONTH FROM \"created\" ::TIMESTAMP), SUM(\"priceTotalCart\"::FLOAT) FROM $tableName WHERE \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeVenteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeVenteModel>> getAllDataChartYear() async {
    var data = <CourbeVenteModel>{};
    var querySQL =
        "SELECT EXTRACT(YEAR FROM \"created\" ::TIMESTAMP), SUM(\"priceTotalCart\"::FLOAT) FROM $tableName WHERE \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeVenteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(VenteCartModel achatModel) async {
    var idProductCart = achatModel.idProductCart;
    var quantityCart = achatModel.quantityCart;
    var priceTotalCart = achatModel.priceTotalCart;
    var unite = achatModel.unite;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;
    var succursale = achatModel.succursale;
    var signature = achatModel.signature;
    var created = achatModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('ventes_id_seq'), '$idProductCart',"
        "'$quantityCart','$priceTotalCart', '$unite', '$tva', '$remise', '$qtyRemise',"
        "'$succursale', '$signature','$created');");
    });
  }

  Future<void> update(VenteCartModel achatModel) async {
    var id = achatModel.id;
    var idProductCart = achatModel.idProductCart;
    var quantityCart = achatModel.quantityCart;
    var priceTotalCart = achatModel.priceTotalCart;
    var unite = achatModel.unite;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;
    var succursale = achatModel.succursale;
    var signature = achatModel.signature;
    var created = achatModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPcreated $tableName SET \"idProductCart\"='$idProductCart', \"quantityCart\"='$quantityCart',"
        "\"priceTotalCart\"='$priceTotalCart', \"unite\"='$unite',"
        "\"succursale\"='$succursale', \"tva\"='$tva', \"remise\"='$remise', \"qtyRemise\"='$qtyRemise',"
        "\"succursale\"='$succursale',"
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

  Future<VenteCartModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return VenteCartModel(
      id: data[0][0],
      idProductCart: data[0][1],
      quantityCart: data[0][2],
      priceTotalCart: data[0][3],
      unite: data[0][4],
      tva: data[0][5],
      remise: data[0][6],
      qtyRemise: data[0][7],
      succursale: data[0][8],
      signature: data[0][9],
      created: data[0][10]
    );
  } 
}