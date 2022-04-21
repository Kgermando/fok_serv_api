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
    var approbationDG = carburantModel.approbationDG;
    var signatureDG = carburantModel.signatureDG;
    var signatureJustificationDG =
        carburantModel.signatureJustificationDG;

    var approbationFin = carburantModel.approbationFin;
    var signatureFin = carburantModel.signatureFin;
    var signatureJustificationFin =
        carburantModel.signatureJustificationFin;

    var approbationBudget = carburantModel.approbationBudget;
    var signatureBudget = carburantModel.signatureBudget;
    var signatureJustificationBudget =
        carburantModel.signatureJustificationBudget;

    var approbationDD = carburantModel.approbationDD;
    var signatureDD = carburantModel.signatureDD;
    var signatureJustificationDD =
        carburantModel.signatureJustificationDD;

    var signature = carburantModel.signature;
    var created = carburantModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('carburants_id_seq'), '$operationEntreSortie',"
        "'$typeCaburant', '$fournisseur', '$nomeroFactureAchat', '$prixAchatParLitre',"
        "'$nomReceptioniste', '$numeroPlaque','$dateHeureSortieAnguin',"
        "'$qtyAchat',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
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
    var approbationDG = carburantModel.approbationDG;
    var signatureDG = carburantModel.signatureDG;
    var signatureJustificationDG = carburantModel.signatureJustificationDG;

    var approbationFin = carburantModel.approbationFin;
    var signatureFin = carburantModel.signatureFin;
    var signatureJustificationFin = carburantModel.signatureJustificationFin;

    var approbationBudget = carburantModel.approbationBudget;
    var signatureBudget = carburantModel.signatureBudget;
    var signatureJustificationBudget =
        carburantModel.signatureJustificationBudget;

    var approbationDD = carburantModel.approbationDD;
    var signatureDD = carburantModel.signatureDD;
    var signatureJustificationDD = carburantModel.signatureJustificationDD;

    var signature = carburantModel.signature;
    var created = carburantModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"operationEntreSortie\"='$operationEntreSortie', \"typeCaburant\"='$typeCaburant',"
        "\"fournisseur\"='$fournisseur', \"nomeroFactureAchat\"='$nomeroFactureAchat', \"prixAchatParLitre\"='$prixAchatParLitre',"
        "\"nomReceptioniste\"='$nomReceptioniste', \"numeroPlaque\"='$numeroPlaque', \"dateHeureSortieAnguin\"='$dateHeureSortieAnguin',"
        " \"qtyAchat\"='$qtyAchat',"
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
      approbationDG: data[0][10],
      signatureDG: data[0][11],
      signatureJustificationDG: data[0][12],
      approbationFin: data[0][13],
      signatureFin: data[0][14],
      signatureJustificationFin: data[0][15],
      approbationBudget: data[0][16],
      signatureBudget: data[0][17],
      signatureJustificationBudget: data[0][18],
      approbationDD: data[0][19],
      signatureDD: data[0][20],
      signatureJustificationDD: data[0][21],
      signature: data[0][22],
      created: data[0][23]
    );
  }
}