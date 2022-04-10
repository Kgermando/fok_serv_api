import 'package:postgres/postgres.dart';

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

  Future<void> insertData(BanqueModel banqueModel) async {
    var nomComplet = banqueModel.nomComplet;
    var pieceJustificative = banqueModel.pieceJustificative;
    var libelle = banqueModel.libelle;
    var montant = banqueModel.montant;
    var coupureBillet = banqueModel.coupureBillet;
    var ligneBudgtaire = banqueModel.ligneBudgtaire;
    var departement = banqueModel.departement;
    var typeOperation = banqueModel.typeOperation;
    var numeroOperation = banqueModel.numeroOperation;
    var created = banqueModel.created;
    var signature = banqueModel.signature;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('banques_id_seq'), '$nomComplet',"
        "'$pieceJustificative','$libelle','$montant','$coupureBillet',"
        "'$ligneBudgtaire','$departement','$typeOperation','$numeroOperation', '$created', '$signature');");
    });
  }


  Future<void> update(BanqueModel banqueModel) async {
    var id = banqueModel.id;
    var nomComplet = banqueModel.nomComplet;
    var pieceJustificative = banqueModel.pieceJustificative;
    var libelle = banqueModel.libelle;
    var montant = banqueModel.montant;
    var coupureBillet = banqueModel.coupureBillet;
    var ligneBudgtaire = banqueModel.ligneBudgtaire;
    var departement = banqueModel.departement;
    var typeOperation = banqueModel.typeOperation;
    var numeroOperation = banqueModel.numeroOperation;
    var created = banqueModel.created;
    var signature = banqueModel.signature;

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
        departement: data[0][7],
        typeOperation: data[0][8],
        numeroOperation: data[0][9],
        created: data[0][10],
        signature: data[0][11]
        );
  } 
  
}