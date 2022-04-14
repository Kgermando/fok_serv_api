import 'package:postgres/postgres.dart';

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
 
  Future<void> insertData(CaisseModel caisseModel) async {
    var nomComplet = caisseModel.nomComplet;
    var pieceJustificative = caisseModel.pieceJustificative;
    var libelle = caisseModel.libelle;
    var montant = caisseModel.montant;
    var coupureBillet = caisseModel.coupureBillet;
    var ligneBudgtaire = caisseModel.ligneBudgtaire;
    var departement = caisseModel.departement;
    var typeOperation = caisseModel.typeOperation;
    var numeroOperation = caisseModel.numeroOperation;
    var created = caisseModel.created;
    var signature = caisseModel.signature;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('caisses_id_seq'), '$nomComplet',"
          "'$pieceJustificative','$libelle','$montant','$coupureBillet',"
          "'$ligneBudgtaire','$departement','$typeOperation','$numeroOperation', '$created', '$signature');");
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
    var departement = caisseModel.departement;
    var typeOperation = caisseModel.typeOperation;
    var numeroOperation = caisseModel.numeroOperation;
    var created = caisseModel.created;
    var signature = caisseModel.signature;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"nomComplet\"='$nomComplet', "
          "\"pieceJustificative\"='$pieceJustificative',\"libelle\"='$libelle',"
          "\"montant\"='$montant',\"coupureBillet\"='$coupureBillet',"
          "\"ligneBudgtaire\"='$ligneBudgtaire', \"departement\"='$departement',"
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
        departement: data[0][7],
        typeOperation: data[0][8],
        numeroOperation: data[0][9],
        created: data[0][10],
        signature: data[0][11]);
  }


}