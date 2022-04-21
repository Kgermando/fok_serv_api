import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/vente_cart_model.dart';

class VenteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  VenteRepository(this.executor, this.tableName);


  Future<List<VenteCartModel>> getAllData() async {
    var data = <VenteCartModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(VenteCartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(VenteCartModel achatModel) async {
    var idProductCart = achatModel.idProductCart;
    var quantityCart = achatModel.quantityCart;
    var priceTotalCart = achatModel.priceTotalCart;
    var unite = achatModel.unite;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;
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

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('ventes_id_seq'), '$idProductCart',"
        "'$quantityCart','$priceTotalCart', '$unite', '$tva', '$remise', '$qtyRemise'"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD', '$succursale',"
        "'$signature','$created');");
    });
  }

  Future<void> update(VenteCartModel achatModel) async {
    var id = achatModel.id;
    var idProductCart = achatModel.idProductCart;
    var quantityCart = achatModel.quantityCart;
    var priceTotalCart = achatModel.priceTotalCart;
    var unite = achatModel.unite;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;
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

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProductCart\"='$idProductCart', \"quantityCart\"='$quantityCart',"
        "\"priceTotalCart\"='$priceTotalCart', \"unite\"='$unite',"
        "\"succursale\"='$succursale', \"tva\"='$tva', \"remise\"='$remise', \"qtyRemise\"='$qtyRemise'"
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

  Future<VenteCartModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return VenteCartModel(
      id: data[0][0],
      idProductCart: data[0][1],
      quantityCart: data[0][2],
      priceTotalCart: data[0][3],
      unite: data[0][4],
      tva: data[0][5],
      remise: data[0][6],
      qtyRemise: data[0][7],
      approbationDG: data[0][8],
      signatureDG: data[0][9],
      signatureJustificationDG: data[0][10],
      approbationFin: data[0][11],
      signatureFin: data[0][12],
      signatureJustificationFin: data[0][13],
      approbationBudget: data[0][14],
      signatureBudget: data[0][15],
      signatureJustificationBudget: data[0][16],
      approbationDD: data[0][17],
      signatureDD: data[0][18],
      signatureJustificationDD: data[0][19],
      succursale: data[0][20],
      signature: data[0][21],
      created: data[0][22]
    );
  } 
}