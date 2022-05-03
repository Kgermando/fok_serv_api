import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/annuaire_model.dart';

class AnnuaireReposiotry {
  final PostgreSQLConnection executor;
  final String tableName;

  AnnuaireReposiotry(this.executor, this.tableName);


  Future<List<AnnuaireModel>> getAllData() async {
    var data = <AnnuaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AnnuaireModel.fromSQL(row));
    }
    return data.toList();
  }

  
  Future<void> insertData(AnnuaireModel data) async {
    var categorie = data.categorie;
    var nomPostnomPrenom = data.nomPostnomPrenom;
    var email = data.email;
    var mobile1 = data.mobile1;
    var mobile2 = data.mobile2;
    var secteurActivite = data.secteurActivite;
    var nomEntreprise = data.nomEntreprise;
    var grade = data.grade;
    var adresseEntreprise = data.adresseEntreprise;
    var succursale = data.succursale;
    var signature = data.signature;
    var created = data.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('annuaires_id_seq'), '$categorie',"
        "'$nomPostnomPrenom','$email','$mobile1', '$mobile2', '$secteurActivite',"
        "'$nomEntreprise','$grade','$adresseEntreprise',"
        "'$succursale','$signature','$created');");
    });
  }

  Future<void> update(AnnuaireModel data) async {
    var id = data.id;
    var categorie = data.categorie;
    var nomPostnomPrenom = data.nomPostnomPrenom;
    var email = data.email;
    var mobile1 = data.mobile1;
    var mobile2 = data.mobile2;
    var secteurActivite = data.secteurActivite;
    var nomEntreprise = data.nomEntreprise;
    var grade = data.grade;
    var adresseEntreprise = data.adresseEntreprise;
    var succursale = data.succursale;
    var signature = data.signature;
    var created = data.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"categorie\"='$categorie', "
          "\"nomPostnomPrenom\"='$nomPostnomPrenom',\"email\"='$email',"
          "\"mobile1\"='$mobile1', \"mobile2\"='$mobile2', \"secteurActivite\"='$secteurActivite',"
          "\"nomEntreprise\"='$nomEntreprise', \"grade\"='$grade', "
          "\"adresseEntreprise\"='$adresseEntreprise', \"succursale\"='$succursale', "
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

  Future<AnnuaireModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AnnuaireModel(
      id: data[0][0],
      categorie: data[0][1],
      nomPostnomPrenom: data[0][2],
      email: data[0][3],
      mobile1: data[0][4],
      mobile2: data[0][5],
      secteurActivite: data[0][6],
      nomEntreprise: data[0][7],
      grade: data[0][8],
      adresseEntreprise: data[0][9],
      succursale: data[0][10],
      signature: data[0][11],
      created: data[0][12]
    );
  } 
}