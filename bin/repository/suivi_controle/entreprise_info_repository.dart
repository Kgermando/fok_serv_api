import 'package:postgres/postgres.dart';

import '../../models/suivi_controle/entreprise_info_model.dart';

class EntrepriseRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  EntrepriseRepository(this.executor, this.tableName);

 
  Future<List<EntrepriseInfoModel>> getAllData() async {
    var data = <EntrepriseInfoModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(EntrepriseInfoModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(EntrepriseInfoModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom_social, nom_gerant,"
          "email_entreprise, email_gerant, telephone1, telephone2, rccm,"
          "identification_nationale, numeros_impot, secteur_activite,"
          "adresse_physique_entreprise, signature, created)"
          "VALUES (nextval('entreprise_infos_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13)",
          substitutionValues: {
            '1': data.nomSocial,
            '2': data.nomGerant,
            '3': data.emailEntreprise,
            '4': data.emailGerant,
            '5': data.telephone1,
            '6': data.telephone2,
            '7': data.rccm,
            '8': data.identificationNationale,
            '9': data.numerosImpot,
            '10': data.secteurActivite,
            '11': data.adressePhysiqueEntreprise,
            '12': data.signature,
            '13': data.created  
          });
    });
  }

  Future<void> update(EntrepriseInfoModel data) async {
   await executor.query("""UPDATE $tableName
    SET nom_social = @1, nom_gerant = @2, email_entreprise = @3,
    email_gerant = @4, telephone1 = @5, telephone2 = @6, rccm = @7,
    identification_nationale = @8, numeros_impot = @9, secteur_activite = @10, 
    adresse_physique_entreprise = @11,
    signature = @12, created = @13 WHERE id = @14""",
        substitutionValues: {
          '1': data.nomSocial,
          '2': data.nomGerant,
          '3': data.emailEntreprise,
          '4': data.emailGerant,
          '5': data.telephone1,
          '6': data.telephone2,
          '7': data.rccm,
          '8': data.identificationNationale,
          '9': data.numerosImpot,
          '10': data.secteurActivite,
          '11': data.adressePhysiqueEntreprise,
          '12': data.signature,
          '13': data.created,
          '14': data.id 
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

  Future<EntrepriseInfoModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return EntrepriseInfoModel(
      id: data[0][0],
      nomSocial: data[0][1],
      nomGerant: data[0][2],
      emailEntreprise: data[0][3],
      emailGerant: data[0][4],
      telephone1: data[0][5],
      telephone2: data[0][6],
      rccm: data[0][7],
      identificationNationale: data[0][8],
      numerosImpot: data[0][9],
      secteurActivite: data[0][10],
      adressePhysiqueEntreprise: data[0][11],
      signature: data[0][12],
      created: data[0][13]
    );
  } 
}