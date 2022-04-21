import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/achat_model.dart';

class AchatsRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AchatsRepository(this.executor, this.tableName);

 
  Future<List<AchatModel>> getAllData() async {
    var data = <AchatModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AchatModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AchatModel achatModel) async {
    var idProduct = achatModel.idProduct;
    var quantity = achatModel.quantity;
    var quantityAchat = achatModel.quantityAchat;
    var priceAchatUnit = achatModel.priceAchatUnit;
    var prixVenteUnit = achatModel.prixVenteUnit;
    var unite = achatModel.unite;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;
    var qtyLivre = achatModel.qtyLivre;
    var approbationDG = achatModel.approbationDG;
    var signatureDG = achatModel.signatureDG;
    var signatureJustificationDG = achatModel.signatureJustificationDG;

    var approbationFin = achatModel.approbationFin;
    var signatureFin = achatModel.signatureFin;
    var signatureJustificationFin = achatModel.signatureJustificationFin;

    var approbationBudget = achatModel.approbationBudget;
    var signatureBudget = achatModel.signatureBudget;
    var signatureJustificationBudget = achatModel.signatureJustificationBudget;

    var approbationDD = achatModel.approbationDD;
    var signatureDD = achatModel.signatureDD;
    var signatureJustificationDD = achatModel.signatureJustificationDD;

    var succursale = achatModel.succursale;
    var signature = achatModel.signature;
    var created = achatModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('achats_id_seq'), '$idProduct',"
        "'$quantity','$quantityAchat','$priceAchatUnit', '$prixVenteUnit', '$unite',"
        "'$tva', '$remise', '$qtyRemise', '$qtyLivre'"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD', '$succursale',"
        "'$signature','$created');");
    });
  }

  Future<void> update(AchatModel achatModel) async {
    var id = achatModel.id;
    var idProduct = achatModel.idProduct;
    var quantity = achatModel.quantity;
    var quantityAchat = achatModel.quantityAchat;
    var priceAchatUnit = achatModel.priceAchatUnit;
    var prixVenteUnit = achatModel.prixVenteUnit;
    var unite = achatModel.unite;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;
    var qtyLivre = achatModel.qtyLivre;
    var approbationDG = achatModel.approbationDG;
    var signatureDG = achatModel.signatureDG;
    var signatureJustificationDG =
        achatModel.signatureJustificationDG;

    var approbationFin = achatModel.approbationFin;
    var signatureFin = achatModel.signatureFin;
    var signatureJustificationFin =
        achatModel.signatureJustificationFin;

    var approbationBudget = achatModel.approbationBudget;
    var signatureBudget = achatModel.signatureBudget;
    var signatureJustificationBudget =
        achatModel.signatureJustificationBudget;

    var approbationDD = achatModel.approbationDD;
    var signatureDD = achatModel.signatureDD;
    var signatureJustificationDD =
        achatModel.signatureJustificationDD;
    var succursale = achatModel.succursale;
    var signature = achatModel.signature; 
    var created = achatModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProduct\"='$idProduct', \"quantity\"='$quantity',"
        "\"quantityAchat\"='$quantityAchat',\"priceAchatUnit\"='$priceAchatUnit',"
        "\"prixVenteUnit\"='$prixVenteUnit',\"unite\"='$unite',"
        "\"tva\"='$tva', \"remise\"='$remise',"
        "\"qtyRemise\"='$qtyRemise', \"qtyLivre\"='$qtyLivre'"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
        "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
        "\"signatureJustificationFin\"='$signatureJustificationFin',"
        "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
        "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
        "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
        "\"signatureJustificationDD\"='$signatureJustificationDD', \"succursale\"='$succursale',"
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

  Future<AchatModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AchatModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantity: data[0][2],
      quantityAchat: data[0][3],
      priceAchatUnit: data[0][4],
      prixVenteUnit: data[0][5],
      unite: data[0][6],
      tva: data[0][7],
      remise: data[0][8],
      qtyRemise: data[0][9],
      qtyLivre: data[0][10],
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
      succursale: data[0][23],
      signature: data[0][24],
      created: data[0][25]
    );
  } 
}