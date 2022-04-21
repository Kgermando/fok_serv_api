import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/cart_model.dart';

class CartRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CartRepository(this.executor, this.tableName);


  Future<List<CartModel>> getAllData() async {
    var data = <CartModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CartModel cartModel) async {
    var idProductCart = cartModel.idProductCart;
    var quantityCart = cartModel.quantityCart;
    var priceCart = cartModel.priceCart;
    var priceAchatUnit = cartModel.priceAchatUnit;
    var unite = cartModel.unite;
    var tva = cartModel.tva;
    var remise = cartModel.remise;
    var qtyRemise = cartModel.qtyRemise;
    var approbationDG = cartModel.approbationDG;
    var signatureDG = cartModel.signatureDG;
    var signatureJustificationDG =
        cartModel.signatureJustificationDG;

    var approbationFin = cartModel.approbationFin;
    var signatureFin = cartModel.signatureFin;
    var signatureJustificationFin =
        cartModel.signatureJustificationFin;

    var approbationBudget = cartModel.approbationBudget;
    var signatureBudget = cartModel.signatureBudget;
    var signatureJustificationBudget =
        cartModel.signatureJustificationBudget;

    var approbationDD = cartModel.approbationDD;
    var signatureDD = cartModel.signatureDD;
    var signatureJustificationDD =
        cartModel.signatureJustificationDD;
    var succursale = cartModel.succursale;
    var signature = cartModel.signature;
    var created = cartModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('carts_id_seq'), '$idProductCart',"
        "'$quantityCart', '$priceCart','$priceAchatUnit', '$unite',"
        "'$tva', '$remise', '$qtyRemise'"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(CartModel cartModel) async {
    var id = cartModel.id;
    var idProductCart = cartModel.idProductCart;
    var quantityCart = cartModel.quantityCart;
    var priceCart = cartModel.priceCart;
    var priceAchatUnit = cartModel.priceAchatUnit;
    var unite = cartModel.unite;
    var tva = cartModel.tva;
    var remise = cartModel.remise;
    var qtyRemise = cartModel.qtyRemise;
    var approbationDG = cartModel.approbationDG;
    var signatureDG = cartModel.signatureDG;
    var signatureJustificationDG = cartModel.signatureJustificationDG;

    var approbationFin = cartModel.approbationFin;
    var signatureFin = cartModel.signatureFin;
    var signatureJustificationFin = cartModel.signatureJustificationFin;

    var approbationBudget = cartModel.approbationBudget;
    var signatureBudget = cartModel.signatureBudget;
    var signatureJustificationBudget = cartModel.signatureJustificationBudget;

    var approbationDD = cartModel.approbationDD;
    var signatureDD = cartModel.signatureDD;
    var signatureJustificationDD = cartModel.signatureJustificationDD;
    var succursale = cartModel.succursale;
    var signature = cartModel.signature;
    var created = cartModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProductCart\"='$idProductCart', \"quantityCart\"='$quantityCart',"
        "\"priceCart\"='$priceCart',\"priceAchatUnit\"='$priceAchatUnit',"
        "\"unite\"='$unite',"
        "\"tva\"='$tva', \"remise\"='$remise', \"qtyRemise\"='$qtyRemise'"
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

  Future<CartModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CartModel(
      id: data[0][0],
      idProductCart: data[0][1],
      quantityCart: data[0][2],
      priceCart: data[0][3],
      priceAchatUnit: data[0][4],
      unite: data[0][5],
      tva: data[0][6],
      remise: data[0][7],
      qtyRemise: data[0][8],
      approbationDG: data[0][9],
      signatureDG: data[0][10],
      signatureJustificationDG: data[0][11],
      approbationFin: data[0][12],
      signatureFin: data[0][13],
      signatureJustificationFin: data[0][14],
      approbationBudget: data[0][15],
      signatureBudget: data[0][16],
      signatureJustificationBudget: data[0][17],
      approbationDD: data[0][18],
      signatureDD: data[0][19],
      signatureJustificationDD: data[0][20],
      succursale: data[0][21],
      signature: data[0][22],
      created: data[0][23]
    );
  } 
  
}