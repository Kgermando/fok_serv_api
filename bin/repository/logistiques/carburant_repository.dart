import 'package:postgres/postgres.dart';

import '../../models/logistiques/carburant_model.dart';

class CarburantRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CarburantRepository(this.executor, this.tableName);

  Future<List<CarburantModel>> getAllData() async {
    var data = <CarburantModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CarburantModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CarburantModel carburantModel) async {
    
    var operationEntreSortie = carburantModel.operationEntreSortie;
    var typeCaburant = carburantModel.typeCaburant;
    var fournisseur = carburantModel.fournisseur;
    var nomeroFactureAchat = carburantModel.nomeroFactureAchat;
    var prixAchatParLitre = carburantModel.prixAchatParLitre;
    var nomReceptioniste = carburantModel.nomReceptioniste;
    var numeroPlaque = carburantModel.numeroPlaque;
    var dateHeureSortieAnguin = carburantModel.dateHeureSortieAnguin;
    var qtyAchat = carburantModel.qtyAchat;

    var signature = carburantModel.signature;
    var created = carburantModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('carburants_id_seq'), '$operationEntreSortie',"
        "'$typeCaburant', '$fournisseur', '$nomeroFactureAchat', '$prixAchatParLitre',"
        "'$nomReceptioniste', '$numeroPlaque','$dateHeureSortieAnguin',"
        "'$qtyAchat',"
        "'$signature', '$created');");
    });
  }

  Future<void> update(CarburantModel carburantModel) async {
    var id = carburantModel.id;
    var operationEntreSortie = carburantModel.operationEntreSortie;
    var typeCaburant = carburantModel.typeCaburant;
    var fournisseur = carburantModel.fournisseur;
    var nomeroFactureAchat = carburantModel.nomeroFactureAchat;
    var prixAchatParLitre = carburantModel.prixAchatParLitre;
    var nomReceptioniste = carburantModel.nomReceptioniste;
    var numeroPlaque = carburantModel.numeroPlaque;
    var dateHeureSortieAnguin = carburantModel.dateHeureSortieAnguin;
    var qtyAchat = carburantModel.qtyAchat;

    var signature = carburantModel.signature;
    var created = carburantModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"operationEntreSortie\"='$operationEntreSortie', \"typeCaburant\"='$typeCaburant',"
        "\"fournisseur\"='$fournisseur', \"nomeroFactureAchat\"='$nomeroFactureAchat', \"prixAchatParLitre\"='$prixAchatParLitre',"
        "\"nomReceptioniste\"='$nomReceptioniste', \"numeroPlaque\"='$numeroPlaque', \"dateHeureSortieAnguin\"='$dateHeureSortieAnguin',"
        " \"qtyAchat\"='$qtyAchat',"
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

  Future<CarburantModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CarburantModel(
      id: data[0][0],
      operationEntreSortie: data[0][1],
      typeCaburant: data[0][2],
      fournisseur: data[0][3],
      nomeroFactureAchat: data[0][4],
      prixAchatParLitre: data[0][5],
      nomReceptioniste: data[0][6],
      numeroPlaque: data[0][7],
      dateHeureSortieAnguin: data[0][8],
      qtyAchat: data[0][9],
      signature: data[0][10],
      created: data[0][11]
    );
  }




  
}