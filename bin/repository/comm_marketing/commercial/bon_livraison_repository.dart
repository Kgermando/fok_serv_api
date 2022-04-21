import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/bon_livraison.dart';

class BonLivraisonRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BonLivraisonRepository(this.executor, this.tableName);


  Future<List<BonLivraisonModel>> getAllData() async {
    var data = <BonLivraisonModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BonLivraisonModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BonLivraisonModel bonLivraisonModel) async {
    var idProduct = bonLivraisonModel.idProduct;
    var quantityAchat = bonLivraisonModel.quantityAchat;
    var priceAchatUnit = bonLivraisonModel.priceAchatUnit;
    var prixVenteUnit = bonLivraisonModel.prixVenteUnit;
    var unite = bonLivraisonModel.unite;
    var firstName = bonLivraisonModel.firstName;
    var lastName = bonLivraisonModel.lastName;
    var tva = bonLivraisonModel.tva;
    var remise = bonLivraisonModel.remise;
    var qtyRemise = bonLivraisonModel.qtyRemise;
    var accuseReception = bonLivraisonModel.accuseReception;
    var accuseReceptionFirstName = bonLivraisonModel.accuseReceptionFirstName;
    var accuseReceptionLastName = bonLivraisonModel.accuseReceptionLastName;
    var approbationDG = bonLivraisonModel.approbationDG;
    var signatureDG = bonLivraisonModel.signatureDG;
    var signatureJustificationDG =
        bonLivraisonModel.signatureJustificationDG;

    var approbationFin = bonLivraisonModel.approbationFin;
    var signatureFin = bonLivraisonModel.signatureFin;
    var signatureJustificationFin =
        bonLivraisonModel.signatureJustificationFin;

    var approbationBudget = bonLivraisonModel.approbationBudget;
    var signatureBudget = bonLivraisonModel.signatureBudget;
    var signatureJustificationBudget =
        bonLivraisonModel.signatureJustificationBudget;

    var approbationDD = bonLivraisonModel.approbationDD;
    var signatureDD = bonLivraisonModel.signatureDD;
    var signatureJustificationDD =
        bonLivraisonModel.signatureJustificationDD;
    var succursale = bonLivraisonModel.succursale;
    var signature = bonLivraisonModel.signature;
    var created = bonLivraisonModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('bon_livraisons_id_seq'), '$idProduct',"
        "'$quantityAchat','$priceAchatUnit', '$prixVenteUnit', '$unite', '$created',"
        "'$firstName','$lastName', '$tva','$remise', '$qtyRemise',"
        "'$accuseReception', '$accuseReceptionFirstName', '$accuseReceptionLastName'"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD', '$succursale',"
        "'$signature','$created');");
    });
  }

  Future<void> update(BonLivraisonModel bonLivraisonModel) async {
    var id = bonLivraisonModel.id;
    var idProduct = bonLivraisonModel.idProduct;
    var quantityAchat = bonLivraisonModel.quantityAchat;
    var priceAchatUnit = bonLivraisonModel.priceAchatUnit;
    var prixVenteUnit = bonLivraisonModel.prixVenteUnit;
    var unite = bonLivraisonModel.unite;
    var firstName = bonLivraisonModel.firstName;
    var lastName = bonLivraisonModel.lastName;
    var tva = bonLivraisonModel.tva;
    var remise = bonLivraisonModel.remise;
    var qtyRemise = bonLivraisonModel.qtyRemise;
    var accuseReception = bonLivraisonModel.accuseReception;
    var accuseReceptionFirstName = bonLivraisonModel.accuseReceptionFirstName;
    var accuseReceptionLastName = bonLivraisonModel.accuseReceptionLastName;
    var approbationDG = bonLivraisonModel.approbationDG;
    var signatureDG = bonLivraisonModel.signatureDG;
    var signatureJustificationDG = bonLivraisonModel.signatureJustificationDG;

    var approbationFin = bonLivraisonModel.approbationFin;
    var signatureFin = bonLivraisonModel.signatureFin;
    var signatureJustificationFin = bonLivraisonModel.signatureJustificationFin;

    var approbationBudget = bonLivraisonModel.approbationBudget;
    var signatureBudget = bonLivraisonModel.signatureBudget;
    var signatureJustificationBudget =
        bonLivraisonModel.signatureJustificationBudget;

    var approbationDD = bonLivraisonModel.approbationDD;
    var signatureDD = bonLivraisonModel.signatureDD;
    var signatureJustificationDD = bonLivraisonModel.signatureJustificationDD;
    var succursale = bonLivraisonModel.succursale;
    var signature = bonLivraisonModel.signature;
    var created = bonLivraisonModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProduct\"='$idProduct', \"quantityAchat\"='$quantityAchat',"
        "\"priceAchatUnit\"='$priceAchatUnit',\"prixVenteUnit\"='$prixVenteUnit',"
        "\"unite\"='$unite',\"firstName\"='$firstName', \"lastName\"='$lastName',"
        "\"tva\"='$tva', \"remise\"='$remise', \"qtyRemise\"='$qtyRemise',\"accuseReception\"='$accuseReception',"
        "\"accuseReceptionFirstName\"='$accuseReceptionFirstName', \"accuseReceptionLastName\"='$accuseReceptionLastName'"
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

  Future<BonLivraisonModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BonLivraisonModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantityAchat: data[0][2],
      priceAchatUnit: data[0][3],
      prixVenteUnit: data[0][4],
      unite: data[0][5],
      firstName: data[0][6],
      lastName: data[0][7],
      tva: data[0][8],
      remise: data[0][9],
      qtyRemise: data[0][10],
      accuseReception: data[0][11],
      accuseReceptionFirstName: data[0][12],
      accuseReceptionLastName: data[0][13],
      approbationDG: data[0][14],
      signatureDG: data[0][15],
      signatureJustificationDG: data[0][16],
      approbationFin: data[0][17],
      signatureFin: data[0][18],
      signatureJustificationFin: data[0][19],
      approbationBudget: data[0][20],
      signatureBudget: data[0][21],
      signatureJustificationBudget: data[0][22],
      approbationDD: data[0][23],
      signatureDD: data[0][24],
      signatureJustificationDD: data[0][25],
      succursale: data[0][26],
      signature: data[0][27],
      created: data[0][28]
    );
  } 
}