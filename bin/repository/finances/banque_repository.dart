import 'package:postgres/postgres.dart';

import '../../models/charts/courbe_chart_model.dart';
import '../../models/finances/banque_model.dart';

class BanqueRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BanqueRepository(this.executor, this.tableName);

  Future<List<BanqueModel>> getAllData() async {
    var data = <BanqueModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BanqueModel.fromSQL(row));
    }
    return data.toList();
  }



  Future<List<CourbeChartModel>> getAllDataChartMounthDepot() async {
    var data = <CourbeChartModel>{};

    var querySQL =
        "SELECT EXTRACT(MONTH FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"type_operation\"='Depot' AND \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartMounthRetrait() async {
    var data = <CourbeChartModel>{};

    var querySQL =
        "SELECT EXTRACT(MONTH FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"type_operation\"='Retrait' AND \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartYearDepot() async {
    var data = <CourbeChartModel>{};
    var querySQL =
        "SELECT EXTRACT(YEAR FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"type_operation\"='Depot' AND  \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartYearRetrait() async {
    var data = <CourbeChartModel>{};
    var querySQL =
        "SELECT EXTRACT(YEAR FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"type_operation\"='Retrait' AND  \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BanqueModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom_complet, piece_justificative,"
        "libelle, montant, coupure_billet, ligne_budgetaire, resources,"
        "departement, type_operation, numero_operation, signature, created)"
        "VALUES (nextval('banques_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11, @12)",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.coupureBillet,
          '6': data.ligneBudgtaire,
          '7': data.resources,
          '8': data.departement,
          '9': data.typeOperation,
          '10': data.numeroOperation,
          '11': data.signature,
          '12': data.created
        });
    });
  }


  Future<void> update(BanqueModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET nom_complet = @1, piece_justificative = @2, libelle = @3,"
        "montant = @4, coupure_billet = @5, ligne_budgetaire = @6, resources = @7,"
        "departement = @8, type_operation = @9, numero_operation = @10,"
        "signature = @11, created = @12 WHERE id = @13",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.coupureBillet,
          '6': data.ligneBudgtaire,
          '7': data.resources,
          '8': data.departement,
          '9': data.typeOperation,
          '10': data.numeroOperation,
          '11': data.signature,
          '12': data.created,
          '13': data.id
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

  Future<BanqueModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BanqueModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        libelle: data[0][3],
        montant: data[0][4],
        coupureBillet: data[0][5],
        ligneBudgtaire: data[0][6],
        resources: data[0][7],
        departement: data[0][8],
        typeOperation: data[0][9],
        numeroOperation: data[0][10],
        signature: data[0][11],
        created: data[0][12]
    );
  } 
  
}