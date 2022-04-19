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
    var created = achatModel.created;
    var telephone = achatModel.telephone;
    var succursale = achatModel.succursale;
    var nameBusiness = achatModel.nameBusiness;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('ventes_id_seq'), '$idProductCart',"
        "'$quantityCart','$priceTotalCart', '$unite',"
        "'$created','$telephone','$succursale', '$nameBusiness', '$tva',"
        "'$remise', '$qtyRemise');");
    });
  }

  Future<void> update(VenteCartModel achatModel) async {
    var id = achatModel.id;
    var idProductCart = achatModel.idProductCart;
    var quantityCart = achatModel.quantityCart;
    var priceTotalCart = achatModel.priceTotalCart;
    var unite = achatModel.unite;
    var created = achatModel.created;
    var telephone = achatModel.telephone;
    var succursale = achatModel.succursale;
    var nameBusiness = achatModel.nameBusiness;
    var tva = achatModel.tva;
    var remise = achatModel.remise;
    var qtyRemise = achatModel.qtyRemise;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProductCart\"='$idProductCart', \"quantityCart\"='$quantityCart',"
        "\"priceTotalCart\"='$priceTotalCart', \"unite\"='$unite',"
        "\"created\"='$created', \"telephone\"='$telephone', \"succursale\"='$succursale',"
        "\"nameBusiness\"='$nameBusiness', \"tva\"='$tva', \"remise\"='$remise',"
        "\"qtyRemise\"='$qtyRemise' WHERE id=$id;");
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
      created: data[0][5],
      telephone: data[0][6],
      succursale: data[0][7],
      nameBusiness: data[0][8],
      tva: data[0][9],
      remise: data[0][10],
      qtyRemise: data[0][11]
    );
  } 
}