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

  Future<void> insertData(ProductModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, categorie, sous_categorie_1,"
          "sous_categorie_2, sous_categorie_3, sous_categorie_4, id_product,"
          "signature, created)"
          "VALUES (nextval('produits_model_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8)",
          substitutionValues: {
            '1': data.categorie,
            '2': data.sousCategorie1,
            '3': data.sousCategorie2,
            '4': data.sousCategorie3,
            '5': data.sousCategorie4,
            '6': data.idProduct,
            '7': data.signature,
            '8': data.created
          });
    });
  }

  Future<void> update(ProductModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          """UPDATE $tableName
          SET categorie = @1, sous_categorie_1 = @2, sous_categorie_2 = @3,
          sous_categorie_3 = @4, sous_categorie_4 = @5, id_product = @6,
          signature = @7, created = @8 WHERE id = @9""",
          substitutionValues: {
            '1': data.categorie,
            '2': data.sousCategorie1,
            '3': data.sousCategorie2,
            '4': data.sousCategorie3,
            '5': data.sousCategorie4,
            '6': data.idProduct,
            '7': data.signature,
            '8': data.created,
            '9': data.id
          });
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
      signature: data[0][7],
      created: data[0][8]
    );
  } 
  
}