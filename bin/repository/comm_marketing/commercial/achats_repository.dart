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
    var created = achatModel.created;
    var telephone = achatModel.telephone;
    var succursale = achatModel.succursale;
    var nameBusiness = achatModel.nameBusiness;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;
    var qtyLivre = achatModel.qtyLivre;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('achats_id_seq'), '$idProduct',"
        "'$quantity','$quantityAchat','$priceAchatUnit', '$prixVenteUnit', '$unite',"
        "'$created','$telephone','$succursale', '$nameBusiness', '$tva',"
        "'$remise', '$qtyRemise', '$qtyLivre');");
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
    var created = achatModel.created;
    var telephone = achatModel.telephone;
    var succursale = achatModel.succursale;
    var nameBusiness = achatModel.nameBusiness;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;
    var qtyLivre = achatModel.qtyLivre;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProduct\"='$idProduct', \"quantity\"='$quantity',"
        "\"quantityAchat\"='$quantityAchat',\"priceAchatUnit\"='$priceAchatUnit',"
        "\"prixVenteUnit\"='$prixVenteUnit',\"unite\"='$unite',"
        "\"created\"='$created', \"telephone\"='$telephone', \"succursale\"='$succursale',"
        "\"nameBusiness\"='$nameBusiness', \"tva\"='$tva', \"remise\"='$remise',"
        "\"qtyRemise\"='$qtyRemise', \"qtyLivre\"='$qtyLivre' WHERE id=$id;");
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
      created: data[0][7],
      telephone: data[0][8],
      succursale: data[0][9],
      nameBusiness: data[0][10],
      tva: data[0][11],
      remise: data[0][12],
      qtyRemise: data[0][13],
      qtyLivre: data[0][14]
    );
  } 
}