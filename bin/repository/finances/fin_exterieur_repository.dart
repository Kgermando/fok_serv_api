import 'package:postgres/postgres.dart';

import '../../models/finances/fin_exterieur_model.dart';

class FinExteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  FinExteRepository(this.executor, this.tableName);

  Future<List<FinanceExterieurModel>> getAllData() async {
    var data = <FinanceExterieurModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(FinanceExterieurModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(FinanceExterieurModel financeExterieurModel) async {
    var nomComplet = financeExterieurModel.nomComplet;
    var pieceJustificative = financeExterieurModel.pieceJustificative;
    var libelle = financeExterieurModel.libelle;
    var montant = financeExterieurModel.montant;
    var coupureBillet = financeExterieurModel.coupureBillet;
    var ligneBudgtaire = financeExterieurModel.ligneBudgtaire;
    var typeOperation = financeExterieurModel.typeOperation;
    var numeroOperation = financeExterieurModel.numeroOperation;
    var created = financeExterieurModel.created;
    var signature = financeExterieurModel.signature;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('fin_exterieurs_id_seq'), '$nomComplet',"
        "'$pieceJustificative','$libelle','$montant','$coupureBillet',"
        "'$ligneBudgtaire', '$typeOperation','$numeroOperation', '$created', '$signature');");
    });
  }

  Future<void> update(FinanceExterieurModel financeExterieurModel) async {
    var id = financeExterieurModel.id;
    var nomComplet = financeExterieurModel.nomComplet;
    var pieceJustificative = financeExterieurModel.pieceJustificative;
    var libelle = financeExterieurModel.libelle;
    var montant = financeExterieurModel.montant;
    var coupureBillet = financeExterieurModel.coupureBillet;
    var ligneBudgtaire = financeExterieurModel.ligneBudgtaire;
    var typeOperation = financeExterieurModel.typeOperation;
    var numeroOperation = financeExterieurModel.numeroOperation;
    var created = financeExterieurModel.created;
    var signature = financeExterieurModel.signature;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"nomComplet\"='$nomComplet', "
          "\"pieceJustificative\"='$pieceJustificative',\"libelle\"='$libelle',"
          "\"montant\"='$montant',\"coupureBillet\"='$coupureBillet',"
          "\"ligneBudgtaire\"='$ligneBudgtaire',"
          "\"typeOperation\"='$typeOperation', \"numeroOperation\"='$numeroOperation',"
          "\"created\"='$created', \"signature\"='$signature' WHERE id=$id;");
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

  Future<FinanceExterieurModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return FinanceExterieurModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        libelle: data[0][3],
        montant: data[0][4],
        coupureBillet: data[0][5],
        ligneBudgtaire: data[0][6],
        typeOperation: data[0][7],
        numeroOperation: data[0][8],
        created: data[0][9],
        signature: data[0][10]);
  } 
  
}