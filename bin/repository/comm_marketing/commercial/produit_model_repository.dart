import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/prod_model.dart';

class ProduitModelRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ProduitModelRepository(this.executor, this.tableName);

  Future<List<ProductModel>> getAllData() async {
    var data = <ProductModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ProductModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ProductModel productModel) async {
    var categorie = productModel.categorie;
    var sousCategorie1 = productModel.sousCategorie1;
    var sousCategorie2 = productModel.sousCategorie2;
    var sousCategorie3 = productModel.sousCategorie3;
    var sousCategorie4 = productModel.sousCategorie4;

    var approbationDG = productModel.approbationDG;
    var signatureDG = productModel.signatureDG;
    var signatureJustificationDG = productModel.signatureJustificationDG;

    var approbationDD = productModel.approbationDD;
    var signatureDD = productModel.signatureDD;
    var signatureJustificationDD = productModel.signatureJustificationDD;

    var idProduct = productModel.idProduct;
    var signature = productModel.signature;
    var created = productModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('produits_model_id_seq'), '$categorie',"
        "'$sousCategorie1','$sousCategorie2','$sousCategorie3','$sousCategorie4', '$idProduct',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG',"
        "'$approbationDD', '$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(ProductModel productModel) async {
    var id = productModel.id;
    var categorie = productModel.categorie;
    var sousCategorie1 = productModel.sousCategorie1;
    var sousCategorie2 = productModel.sousCategorie2;
    var sousCategorie3 = productModel.sousCategorie3;
    var sousCategorie4 = productModel.sousCategorie4;

      var approbationDG = productModel.approbationDG;
    var signatureDG = productModel.signatureDG;
    var signatureJustificationDG = productModel.signatureJustificationDG;

    var approbationDD = productModel.approbationDD;
    var signatureDD = productModel.signatureDD;
    var signatureJustificationDD = productModel.signatureJustificationDD;

    var idProduct = productModel.idProduct;
    var signature = productModel.signature;
    var created = productModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"categorie\"='$categorie', "
        "\"sousCategorie1\"='$sousCategorie1', \"sousCategorie2\"='$sousCategorie2',"
        "\"sousCategorie3\"='$sousCategorie3', \"sousCategorie4\"='$sousCategorie4',"
        "\"idProduct\"='$idProduct',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
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

  Future<ProductModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ProductModel(
      id: data[0][0],
      categorie: data[0][1],
      sousCategorie1: data[0][2],
      sousCategorie2: data[0][3],
      sousCategorie3: data[0][4],
      sousCategorie4: data[0][5],
      idProduct: data[0][6],
      approbationDG: data[0][7],
      signatureDG: data[0][8],
      signatureJustificationDG: data[0][9],
      approbationDD: data[0][10],
      signatureDD: data[0][11],
      signatureJustificationDD: data[0][12],
      signature: data[0][13],
      created: data[0][14]
    );
  } 
  
}