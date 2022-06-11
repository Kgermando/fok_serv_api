import 'package:postgres/postgres.dart';

import '../../models/charts/courbe_chart_model.dart';
import '../../models/finances/caisse_model.dart';

class CaissesRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CaissesRepository(this.executor, this.tableName);

  Future<List<CaisseModel>> getAllData() async {
    var data = <CaisseModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CaisseModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartMounthEncaissement() async {
    var data = <CourbeChartModel>{};

    var querySQL =
        "SELECT EXTRACT(MONTH FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"type_operation\"='Encaissement' AND \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartMounthDecaissement() async {
    var data = <CourbeChartModel>{};

    var querySQL =
        "SELECT EXTRACT(MONTH FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"type_operation\"='Decaissement' AND \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartYearEncaissement() async {
    var data = <CourbeChartModel>{};
    var querySQL =
        "SELECT EXTRACT(YEAR FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"type_operation\"='Encaissement' AND  \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartYearDecaissement() async {
    var data = <CourbeChartModel>{};
    var querySQL =
        "SELECT EXTRACT(YEAR FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"type_operation\"='Decaissement' AND  \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }
 
  Future<void> insertData(CaisseModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom_complet, piece_justificative,"
        "libelle, montant,"
        "departement,  type_operation,  numero_operation, signature,"
        "created_ref, created)"
        "VALUES (nextval('caisses_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10)",
        substitutionValues: {
           '1': data.nomComplet,
            '2': data.pieceJustificative,
            '3': data.libelle,
            '4': data.montant,
            '5': data.departement,
            '6': data.typeOperation,
            '7': data.numeroOperation,
            '8': data.signature,
            '9': data.createdRef,
            '10': data.created
        });
    });
  }

  Future<void> update(CaisseModel data) async {
    await executor.transaction((conn) async {
       await conn.query(
        "UPDATE $tableName"
        "SET nom_complet = @1, piece_justificative = @2, libelle = @3,"
        "montant = @4, departement = @5,"
        "type_operation = @6, numero_operation = @7, signature = @8,"
        "created_ref = @9, created = @10 WHERE id = @11",
        substitutionValues: {
           '1': data.nomComplet,
            '2': data.pieceJustificative,
            '3': data.libelle,
            '4': data.montant,
            '5': data.departement,
            '6': data.typeOperation,
            '7': data.numeroOperation,
            '8': data.signature,
            '9': data.createdRef,
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

  Future<CaisseModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CaisseModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        libelle: data[0][3],
        montant: data[0][4],
        departement: data[0][5],
        typeOperation: data[0][6],
        numeroOperation: data[0][7],
        signature: data[0][8],
        createdRef: data[0][9],
        created: data[0][10] 
      );
  }


}