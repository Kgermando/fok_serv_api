import 'package:postgres/postgres.dart';

import '../../models/suivi_controle/abonnement_client_model.dart';

class AbonnementRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AbonnementRepository(this.executor, this.tableName, {sommeContrat});

  Future<List<AbonnementClientModel>> getAllData() async {
    var data = <AbonnementClientModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AbonnementClientModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AbonnementClientModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, duree, type_contrat,"
          "somme_contrat, receptionniste, date_signature_contrat,"
          "signataire_contrat_entreprise, signature, created)"
          "VALUES (nextval('abonnement_clients_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8)",
          substitutionValues: {
            '1': data.duree,
            '2': data.typeContrat,
            '3': data.sommeContrat,
            '4': data.receptionniste,
            '5': data.dateSignatureContrat,
            '6': data.signataireContratEntreprise,
            '7': data.signature,
            '8': data.created 
          });
    });
  }

  Future<void> update(AbonnementClientModel data) async {
    await executor.query("""UPDATE $tableName
          SET duree = @1, type_contrat = @2, somme_contrat = @3,
          receptionniste = @4, date_signature_contrat = @5, 
          signataire_contrat_entreprise = @6, 
          signature = @7,
          created = @8 WHERE id = @9""",
        substitutionValues: {
          '1': data.duree,
          '2': data.typeContrat,
          '3': data.sommeContrat,
          '4': data.receptionniste,
          '5': data.dateSignatureContrat,
          '6': data.signataireContratEntreprise,
          '7': data.signature,
          '8': data.created,
          '9': data.id
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

  Future<AbonnementClientModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AbonnementClientModel(
      id: data[0][0],
      duree: data[0][1],
      typeContrat: data[0][2],
      sommeContrat: data[0][3],
      receptionniste: data[0][4],
      dateSignatureContrat: data[0][5],
      signataireContratEntreprise: data[0][6],
      signature: data[0][7],
      created: data[0][8] 
    );
  }
}
