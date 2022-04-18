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
    var idProduct = productModel.idProduct;
    var telephone = productModel.telephone;
    var succursale = productModel.succursale;
    var nameBusiness = productModel.nameBusiness;
    var created = productModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('models_produits_id_seq'), '$categorie',"
        "'$sousCategorie1','$sousCategorie2','$sousCategorie3','$sousCategorie4',"
        "'$idProduct', '$telephone', '$succursale', '$nameBusiness','$created');");
    });
  }

  Future<void> update(ProductModel productModel) async {
    var id = productModel.id;
    var categorie = productModel.categorie;
    var sousCategorie1 = productModel.sousCategorie1;
    var sousCategorie2 = productModel.sousCategorie2;
    var sousCategorie3 = productModel.sousCategorie3;
    var sousCategorie4 = productModel.sousCategorie4;
    var idProduct = productModel.idProduct;
    var telephone = productModel.telephone;
    var succursale = productModel.succursale;
    var nameBusiness = productModel.nameBusiness;
    var created = productModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"categorie\"='$categorie', "
        "\"sousCategorie1\"='$sousCategorie1', \"sousCategorie2\"='$sousCategorie2',"
        "\"sousCategorie3\"='$sousCategorie3', \"sousCategorie4\"='$sousCategorie4',"
        "\"idProduct\"='$idProduct', \"telephone\"='$telephone', \"succursale\"='$succursale',"
        "\"nameBusiness\"='$nameBusiness', \"created\"='$created' WHERE id=$id;");
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
      telephone: data[0][7],
      succursale: data[0][8],
      nameBusiness: data[0][9],
      created: data[0][10]);
  } 
  
}