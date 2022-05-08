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
    var succursale = bonLivraisonModel.succursale;
    var signature = bonLivraisonModel.signature;
    var created = bonLivraisonModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('bon_livraisons_id_seq'), '$idProduct',"
        "'$quantityAchat','$priceAchatUnit', '$prixVenteUnit', '$unite',"
        "'$firstName','$lastName', '$tva','$remise', '$qtyRemise',"
        "'$accuseReception', '$accuseReceptionFirstName', '$accuseReceptionLastName',"
        "'$succursale', '$signature', '$created');");
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
        "\"accuseReceptionFirstName\"='$accuseReceptionFirstName', \"accuseReceptionLastName\"='$accuseReceptionLastName',"
        "\"succursale\"='$succursale',"
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
      succursale: data[0][14],
      signature: data[0][15],
      created: data[0][16]
    );
  } 
}