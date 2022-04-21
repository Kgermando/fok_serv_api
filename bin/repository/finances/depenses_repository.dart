import 'package:postgres/postgres.dart';

import '../../models/finances/depenses_model.dart';

class DepensesRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DepensesRepository(this.executor, this.tableName);

  Future<List<DepensesModel>> getAllData() async {
    var data = <DepensesModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(DepensesModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(DepensesModel depensesModel) async {
    var nomComplet = depensesModel.nomComplet;
    var pieceJustificative = depensesModel.pieceJustificative;
    var naturePayement = depensesModel.naturePayement;
    var montant = depensesModel.montant;
    var coupureBillet = depensesModel.coupureBillet;
    var ligneBudgtaire = depensesModel.ligneBudgtaire;
    var modePayement = depensesModel.modePayement;
    var numeroOperation = depensesModel.numeroOperation;
    var approbationDG = depensesModel.approbationDG;
    var signatureDG = depensesModel.signatureDG;
    var signatureJustificationDG =
        depensesModel.signatureJustificationDG;

    var approbationFin = depensesModel.approbationFin;
    var signatureFin = depensesModel.signatureFin;
    var signatureJustificationFin =
        depensesModel.signatureJustificationFin;

    var approbationBudget = depensesModel.approbationBudget;
    var signatureBudget = depensesModel.signatureBudget;
    var signatureJustificationBudget =
        depensesModel.signatureJustificationBudget;

    var approbationDD = depensesModel.approbationDD;
    var signatureDD = depensesModel.signatureDD;
    var signatureJustificationDD =
        depensesModel.signatureJustificationDD;

    var signature = depensesModel.signature;
    var created = depensesModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('depenses_id_seq'), '$nomComplet',"
          "'$pieceJustificative','$naturePayement','$montant','$coupureBillet',"
          "'$ligneBudgtaire','$modePayement',"
          "'$numeroOperation',"
          "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
          "'$signature','$created'));");
    });
  }

  Future<void> update(DepensesModel depensesModel) async {
    var id = depensesModel.id;
    var nomComplet = depensesModel.nomComplet;
    var pieceJustificative = depensesModel.pieceJustificative;
    var naturePayement = depensesModel.naturePayement;
    var montant = depensesModel.montant;
    var coupureBillet = depensesModel.coupureBillet;
    var ligneBudgtaire = depensesModel.ligneBudgtaire;
    var modePayement = depensesModel.modePayement;
    var numeroOperation = depensesModel.numeroOperation;
    var approbationDG = depensesModel.approbationDG;
    var signatureDG = depensesModel.signatureDG;
    var signatureJustificationDG =
        depensesModel.signatureJustificationDG;

    var approbationFin = depensesModel.approbationFin;
    var signatureFin = depensesModel.signatureFin;
    var signatureJustificationFin =
        depensesModel.signatureJustificationFin;

    var approbationBudget = depensesModel.approbationBudget;
    var signatureBudget = depensesModel.signatureBudget;
    var signatureJustificationBudget =
        depensesModel.signatureJustificationBudget;

    var approbationDD = depensesModel.approbationDD;
    var signatureDD = depensesModel.signatureDD;
    var signatureJustificationDD =
        depensesModel.signatureJustificationDD;

    var signature = depensesModel.signature;
    var created = depensesModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nomComplet\"='$nomComplet', "
        "\"pieceJustificative\"='$pieceJustificative',\"naturePayement\"='$naturePayement',"
        "\"montant\"='$montant', \"coupureBillet\"='$coupureBillet',"
        "\"ligneBudgtaire\"='$ligneBudgtaire', \"modePayement\"='$modePayement',"
        "\"numeroOperation\"='$numeroOperation',"
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

  Future<DepensesModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DepensesModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        naturePayement: data[0][3],
        montant: data[0][4],
        coupureBillet: data[0][5],
        ligneBudgtaire: data[0][6],
        modePayement: data[0][7],
        numeroOperation: data[0][8],
      approbationDG: data[0][9],
        signatureDG: data[0][10],
        signatureJustificationDG: data[0][11],
        approbationFin: data[0][12],
        signatureFin: data[0][13],
        signatureJustificationFin: data[0][14],
        approbationBudget: data[0][15],
        signatureBudget: data[0][16],
        signatureJustificationBudget: data[0][17],
        approbationDD: data[0][18],
        signatureDD: data[0][19],
        signatureJustificationDD: data[0][20],
        signature: data[0][21],
        created: data[0][22]
    );
  }
}