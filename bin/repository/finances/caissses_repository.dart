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
        "SELECT EXTRACT(MONTH FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"typeOperation\"='Encaissement' AND \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartMounthDecaissement() async {
    var data = <CourbeChartModel>{};

    var querySQL =
        "SELECT EXTRACT(MONTH FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"typeOperation\"='Decaissement' AND \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartYearEncaissement() async {
    var data = <CourbeChartModel>{};
    var querySQL =
        "SELECT EXTRACT(YEAR FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"typeOperation\"='Encaissement' AND  \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<CourbeChartModel>> getAllDataChartYearDecaissement() async {
    var data = <CourbeChartModel>{};
    var querySQL =
        "SELECT EXTRACT(YEAR FROM \"created\" ::TIMESTAMP), SUM(\"montant\"::FLOAT) FROM $tableName WHERE \"typeOperation\"='Decaissement' AND  \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ASC ;";

    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CourbeChartModel.fromSQL(row));
    }
    return data.toList();
  }
 
  Future<void> insertData(CaisseModel caisseModel) async {
    var nomComplet = caisseModel.nomComplet;
    var pieceJustificative = caisseModel.pieceJustificative;
    var libelle = caisseModel.libelle;
    var montant = caisseModel.montant;
    var coupureBillet = caisseModel.coupureBillet;
    var ligneBudgtaire = caisseModel.ligneBudgtaire;
    var resources = caisseModel.resources;
    var departement = caisseModel.departement;
    var typeOperation = caisseModel.typeOperation;
    var numeroOperation = caisseModel.numeroOperation;
    var approbationDG = caisseModel.approbationDG;
    var signatureDG = caisseModel.signatureDG;
    var signatureJustificationDG = caisseModel.signatureJustificationDG;

    var approbationFin = caisseModel.approbationFin;
    var signatureFin = caisseModel.signatureFin;
    var signatureJustificationFin = caisseModel.signatureJustificationFin;

    var approbationBudget = caisseModel.approbationBudget;
    var signatureBudget = caisseModel.signatureBudget;
    var signatureJustificationBudget = caisseModel.signatureJustificationBudget;

    var approbationDD = caisseModel.approbationDD;
    var signatureDD = caisseModel.signatureDD;
    var signatureJustificationDD = caisseModel.signatureJustificationDD;

    var signature = caisseModel.signature;
    var created = caisseModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('caisses_id_seq'), '$nomComplet',"
          "'$pieceJustificative','$libelle','$montant','$coupureBillet',"
          "'$ligneBudgtaire', '$resources', '$departement','$typeOperation','$numeroOperation',"
          "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
          "'$signature', '$created');");
    });
  }

  Future<void> update(CaisseModel caisseModel) async {
    var id = caisseModel.id;
    var nomComplet = caisseModel.nomComplet;
    var pieceJustificative = caisseModel.pieceJustificative;
    var libelle = caisseModel.libelle;
    var montant = caisseModel.montant;
    var coupureBillet = caisseModel.coupureBillet;
    var ligneBudgtaire = caisseModel.ligneBudgtaire;
    var resources = caisseModel.resources;
    var departement = caisseModel.departement;
    var typeOperation = caisseModel.typeOperation;
    var numeroOperation = caisseModel.numeroOperation;
    var approbationDG = caisseModel.approbationDG;
    var signatureDG = caisseModel.signatureDG;
    var signatureJustificationDG = caisseModel.signatureJustificationDG;

    var approbationFin = caisseModel.approbationFin;
    var signatureFin = caisseModel.signatureFin;
    var signatureJustificationFin = caisseModel.signatureJustificationFin;

    var approbationBudget = caisseModel.approbationBudget;
    var signatureBudget = caisseModel.signatureBudget;
    var signatureJustificationBudget = caisseModel.signatureJustificationBudget;

    var approbationDD = caisseModel.approbationDD;
    var signatureDD = caisseModel.signatureDD;
    var signatureJustificationDD = caisseModel.signatureJustificationDD;

    var signature = caisseModel.signature;
    var created = caisseModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nomComplet\"='$nomComplet', "
        "\"pieceJustificative\"='$pieceJustificative',\"libelle\"='$libelle',"
        "\"montant\"='$montant',\"coupureBillet\"='$coupureBillet',"
        "\"ligneBudgtaire\"='$ligneBudgtaire', \"resources\"='$resources', \"departement\"='$departement',"
        "\"typeOperation\"='$typeOperation', \"numeroOperation\"='$numeroOperation',"
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

  Future<CaisseModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CaisseModel(
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
        approbationDG: data[0][11],
        signatureDG: data[0][12],
        signatureJustificationDG: data[0][13],
        approbationFin: data[0][14],
        signatureFin: data[0][15],
        signatureJustificationFin: data[0][16],
        approbationBudget: data[0][17],
        signatureBudget: data[0][18],
        signatureJustificationBudget: data[0][19],
        approbationDD: data[0][20],
        signatureDD: data[0][21],
        signatureJustificationDD: data[0][22],
        signature: data[0][23],
        created: data[0][24]
        
      );
  }


}