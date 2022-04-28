import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/livraiason_history_model.dart';

class HistoryLivraisonRepository {
    final PostgreSQLConnection executor;
  final String tableName;

  HistoryLivraisonRepository(this.executor, this.tableName);


  Future<List<LivraisonHistoryModel>> getAllData() async {
    var data = <LivraisonHistoryModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(LivraisonHistoryModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(LivraisonHistoryModel livraisonHistoryModel) async {
    var idProduct = livraisonHistoryModel.idProduct;
    var quantity = livraisonHistoryModel.quantity;
    var quantityAchat = livraisonHistoryModel.quantityAchat;
    var priceAchatUnit = livraisonHistoryModel.priceAchatUnit;
    var prixVenteUnit = livraisonHistoryModel.prixVenteUnit;
    var unite = livraisonHistoryModel.unite;
    var margeBen = livraisonHistoryModel.margeBen;
    var tva = livraisonHistoryModel.tva;
    var remise = livraisonHistoryModel.remise;
    var qtyRemise = livraisonHistoryModel.qtyRemise;
    var margeBenRemise = livraisonHistoryModel.margeBenRemise;
    var qtyLivre = livraisonHistoryModel.qtyLivre;
    
    var approbationDG = livraisonHistoryModel.approbationDG;
    var signatureDG = livraisonHistoryModel.signatureDG;
    var signatureJustificationDG =
        livraisonHistoryModel.signatureJustificationDG;

    var approbationFin = livraisonHistoryModel.approbationFin;
    var signatureFin = livraisonHistoryModel.signatureFin;
    var signatureJustificationFin =
        livraisonHistoryModel.signatureJustificationFin;

    var approbationBudget = livraisonHistoryModel.approbationBudget;
    var signatureBudget = livraisonHistoryModel.signatureBudget;
    var signatureJustificationBudget =
        livraisonHistoryModel.signatureJustificationBudget;

    var approbationDD = livraisonHistoryModel.approbationDD;
    var signatureDD = livraisonHistoryModel.signatureDD;
    var signatureJustificationDD =
        livraisonHistoryModel.signatureJustificationDD;

    var succursale = livraisonHistoryModel.succursale;
    var signature = livraisonHistoryModel.signature;
    var created = livraisonHistoryModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('history_livraisons_id_seq'), '$idProduct',"
        "'$quantity','$quantityAchat','$priceAchatUnit', '$prixVenteUnit', '$unite',"
        "'$margeBen', '$tva', '$remise', '$qtyRemise', '$margeBenRemise', '$qtyLivre',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$succursale', '$signature', '$created');");
    });
  }

  Future<void> update(LivraisonHistoryModel livraisonHistoryModel) async {
    var id = livraisonHistoryModel.id;
    var idProduct = livraisonHistoryModel.idProduct;
    var quantity = livraisonHistoryModel.quantity;
    var quantityAchat = livraisonHistoryModel.quantityAchat;
    var priceAchatUnit = livraisonHistoryModel.priceAchatUnit;
    var prixVenteUnit = livraisonHistoryModel.prixVenteUnit;
    var unite = livraisonHistoryModel.unite;
    var margeBen = livraisonHistoryModel.margeBen;
    var tva = livraisonHistoryModel.tva;
    var remise = livraisonHistoryModel.remise;
    var qtyRemise = livraisonHistoryModel.qtyRemise;
    var margeBenRemise = livraisonHistoryModel.margeBenRemise;
    var qtyLivre = livraisonHistoryModel.qtyLivre;

    var approbationDG = livraisonHistoryModel.approbationDG;
    var signatureDG = livraisonHistoryModel.signatureDG;
    var signatureJustificationDG =
        livraisonHistoryModel.signatureJustificationDG;

    var approbationFin = livraisonHistoryModel.approbationFin;
    var signatureFin = livraisonHistoryModel.signatureFin;
    var signatureJustificationFin =
        livraisonHistoryModel.signatureJustificationFin;

    var approbationBudget = livraisonHistoryModel.approbationBudget;
    var signatureBudget = livraisonHistoryModel.signatureBudget;
    var signatureJustificationBudget =
        livraisonHistoryModel.signatureJustificationBudget;

    var approbationDD = livraisonHistoryModel.approbationDD;
    var signatureDD = livraisonHistoryModel.signatureDD;
    var signatureJustificationDD =
        livraisonHistoryModel.signatureJustificationDD;

    var succursale = livraisonHistoryModel.succursale;
    var signature = livraisonHistoryModel.signature;
    var created = livraisonHistoryModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProduct\"='$idProduct', \"quantity\"='$quantity',"
        "\"quantityAchat\"='$quantityAchat',\"priceAchatUnit\"='$priceAchatUnit',"
        "\"prixVenteUnit\"='$prixVenteUnit',\"unite\"='$unite', \"margeBen\"='$margeBen',"
        "\"tva\"='$tva', \"remise\"='$remise', \"qtyRemise\"='$qtyRemise',"
        "\"margeBenRemise\"='$margeBenRemise', \"qtyLivre\"='$qtyLivre',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
        "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
        "\"signatureJustificationFin\"='$signatureJustificationFin',"
        "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
        "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
        "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
        "\"signatureJustificationDD\"='$signatureJustificationDD',"
        "\"succursale\"='$succursale', \"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
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

  Future<LivraisonHistoryModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return LivraisonHistoryModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantity: data[0][2],
      quantityAchat: data[0][3],
      priceAchatUnit: data[0][4],
      prixVenteUnit: data[0][5],
      unite: data[0][6],
      margeBen: data[0][7],
      tva: data[0][8],
      remise: data[0][9],
      qtyRemise: data[0][10],
      margeBenRemise: data[0][11],
      qtyLivre: data[0][12],
      approbationDG: data[0][13],
      signatureDG: data[0][14],
      signatureJustificationDG: data[0][15],
      approbationFin: data[0][16],
      signatureFin: data[0][17],
      signatureJustificationFin: data[0][18],
      approbationBudget: data[0][19],
      signatureBudget: data[0][20],
      signatureJustificationBudget: data[0][21],
      approbationDD: data[0][22],
      signatureDD: data[0][23],
      signatureJustificationDD: data[0][24],
      succursale: data[0][25],
      signature: data[0][26],
      created: data[0][27]
    );
  } 
}