import 'package:postgres/postgres.dart';

import '../../models/marketing/annuaire_model.dart';

class AnnuaireReposiotry {
  final PostgreSQLConnection executor;
  final String tableName;

  AnnuaireReposiotry(this.executor, this.tableName);

  Future<List<AnnuaireModel>> getAllData(String business) async {
    var data = <AnnuaireModel>{};

    var querySQL =
        "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AnnuaireModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AnnuaireModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, categorie, nom_postnom_prenom,"
          "email, mobile_1, mobile_2, secteur_activite, nom_entreprise,"
          "grade,  adresse_entreprise, succursale, signature, created,"
          "business, sync, async)"
          "VALUES (nextval('annuaires_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13, @14, @15)",
          substitutionValues: {
            '1': data.categorie,
            '2': data.nomPostnomPrenom,
            '3': data.email,
            '4': data.mobile1,
            '5': data.mobile2,
            '6': data.secteurActivite,
            '7': data.nomEntreprise,
            '8': data.grade,
            '9': data.adresseEntreprise,
            '10': data.succursale,
            '11': data.signature,
            '12': data.created,
            '13': data.business,
            '14': data.sync,
            '15': data.async,
          });
    });
  }

  Future<void> update(AnnuaireModel data) async {
    await executor.query("""UPDATE $tableName
          SET categorie = @1, nom_postnom_prenom = @2, email = @3,
          mobile_1 = @4, mobile_2 = @5, secteur_activite = @6, nom_entreprise = @7,
          grade = @8, adresse_entreprise = @9, succursale = @10, signature = @11,
          created = @12, business = @13,
          sync = @14, async = @15 WHERE id = @16""", substitutionValues: {
      '1': data.categorie,
      '2': data.nomPostnomPrenom,
      '3': data.email,
      '4': data.mobile1,
      '5': data.mobile2,
      '6': data.secteurActivite,
      '7': data.nomEntreprise,
      '8': data.grade,
      '9': data.adresseEntreprise,
      '10': data.succursale,
      '11': data.signature,
      '12': data.created,
      '13': data.business,
      '14': data.sync,
      '15': data.async,
      '16': data.id
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
      created: data[0][12],
      business: data[0][13],
      sync: data[0][14],
      async: data[0][15],
    );
  }
}
