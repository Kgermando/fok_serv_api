import 'package:postgres/postgres.dart';

import '../../models/commercial/courbe_vente_gain_model.dart';
import '../../models/commercial/vente_cart_model.dart';
import '../../models/commercial/vente_chart_model.dart';

class VenteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  VenteRepository(this.executor, this.tableName);

  Future<List<VenteCartModel>> getAllData(String business) async {
    var data = <VenteCartModel>{};

    var querySQL =
        "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(VenteCartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<VenteChartModel>> getAllDataChart(String business) async {
    var data = <VenteChartModel>{};
    var querySQL = """SELECT "id_product_cart", COUNT(*) 
      FROM $tableName 
      GROUP BY "id_product_cart" 
      ORDER BY COUNT DESC LIMIT 10;""";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(VenteChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeVenteModel>> getAllDataChartDay(String business) async {
    var data = <CourbeVenteModel>{};

    var querySQL = """SELECT EXTRACT(HOUR FROM "created" ::TIMESTAMP), 
          SUM("price_total_cart"::FLOAT) 
          FROM $tableName WHERE "business"='$business' AND
          DATE("created") >= CURRENT_DATE AND 
          DATE("created") < CURRENT_DATE + INTERVAL '1 DAY' 
          GROUP BY EXTRACT(HOUR FROM "created" ::TIMESTAMP) 
          ORDER BY EXTRACT(HOUR FROM "created" ::TIMESTAMP) ASC;
      """;
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeVenteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeVenteModel>> getAllDataChartMounth(String business) async {
    var data = <CourbeVenteModel>{};

    // Filtre est égal à l'année et le mois actuel
    var querySQL = """SELECT EXTRACT(DAY FROM "created" ::TIMESTAMP),
        SUM(price_total_cart::FLOAT) 
        FROM $tableName WHERE "business"='$business' AND
        EXTRACT(MONTH FROM "created" ::TIMESTAMP) = EXTRACT(MONTH FROM CURRENT_DATE ::TIMESTAMP) AND
        EXTRACT(YEAR FROM "created" ::TIMESTAMP) = EXTRACT(YEAR FROM CURRENT_DATE ::TIMESTAMP)
        GROUP BY EXTRACT(DAY FROM "created" ::TIMESTAMP) 
        ORDER BY EXTRACT(DAY FROM "created" ::TIMESTAMP) ASC;
      """;
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeVenteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeVenteModel>> getAllDataChartYear(String business) async {
    var data = <CourbeVenteModel>{};
    // Filtre est egal à l'année actuel
    var querySQL = """SELECT EXTRACT(MONTH FROM "created" ::TIMESTAMP), 
        SUM(price_total_cart::FLOAT) 
      FROM $tableName WHERE "business"='$business' AND
      EXTRACT(YEAR FROM "created" ::TIMESTAMP) = EXTRACT(YEAR FROM CURRENT_DATE ::TIMESTAMP)
      GROUP BY EXTRACT(MONTH FROM "created" ::TIMESTAMP) 
      ORDER BY EXTRACT(MONTH FROM "created" ::TIMESTAMP) ASC;
    """;
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeVenteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(VenteCartModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, id_product_cart, quantity_cart,"
          "price_total_cart, unite, tva, remise, qty_remise,"
          "succursale, signature, created, created_at, business, sync, async)"
          "VALUES (nextval('ventes_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13, @14)",
          substitutionValues: {
            '1': data.idProductCart,
            '2': data.quantityCart,
            '3': data.priceTotalCart,
            '4': data.unite,
            '5': data.tva,
            '6': data.remise,
            '7': data.qtyRemise,
            '8': data.succursale,
            '9': data.signature,
            '10': data.created,
            '11': data.createdAt,
            '12': data.business,
            '13': data.sync,
            '14': data.async,
          });
    });
  }

  Future<void> update(VenteCartModel data) async {
    await executor.query("""UPDATE $tableName
          SET id_product_cart = @1, quantity_cart = @2, price_total_cart = @3,
          unite = @4, tva = @5, remise = @6, qty_remise = @7,
          succursale = @8, signature = @9, created = @10, 
          created_at = @11, business = @12, 
          sync = @13, async = @14 WHERE id = @15""", substitutionValues: {
      '1': data.idProductCart,
      '2': data.quantityCart,
      '3': data.priceTotalCart,
      '4': data.unite,
      '5': data.tva,
      '6': data.remise,
      '7': data.qtyRemise,
      '8': data.succursale,
      '9': data.signature,
      '10': data.created,
      '11': data.createdAt,
      '12': data.business,
      '13': data.sync,
      '14': data.async,
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
      created: data[0][10],
      createdAt: data[0][11],
      business: data[0][12],
      sync: data[0][13],
      async: data[0][14],
    );
  }
}
