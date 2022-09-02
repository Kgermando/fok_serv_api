import 'package:postgres/postgres.dart';

import '../../models/administrations/actionnaire_cotisation_model.dart'; 

class ActionnaireCotisationRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ActionnaireCotisationRepository(this.executor, this.tableName);

  Future<List<ActionnaireCotisationModel>> getAllData() async {
    var data = <ActionnaireCotisationModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ActionnaireCotisationModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ActionnaireCotisationModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
        "INSERT INTO $tableName (id, reference, nom, post_nom, prenom,"
        "matricule, montant, note, moyen_paiement, numero_transaction, signature, created)"
        "VALUES (nextval('actionnaire_cotisations_id_seq'), @1, @2, @3, @4, @5,"
          "@6, @7, @8, @9, @10, @11)",
          substitutionValues: {
            '1': data.reference,
            '2': data.nom,
            '3': data.postNom,
            '4': data.prenom,
            '5': data.matricule,
            '6': data.montant,
            '7': data.note,
            '8': data.moyenPaiement,
            '9': data.numeroTransaction,
            '10': data.signature,
            '11': data.created
          });
    });
  }

  Future<void> update(ActionnaireCotisationModel data) async {
    await executor.query("""UPDATE $tableName
      SET reference = @1, nom = @2, post_nom = @3, prenom = @4, matricule = @5, 
      montant = @6, note = @7, moyen_paiement = @8, numero_transaction = @9,
      signature = @10, created = @11 WHERE id = @12""", 
      substitutionValues: {
        '1': data.reference,
        '2': data.nom,
        '3': data.postNom,
        '4': data.prenom,
        '5': data.matricule,
        '6': data.montant,
        '7': data.note,
        '8': data.moyenPaiement,
        '9': data.numeroTransaction,
        '10': data.signature,
        '11': data.created,
        '12': data.id
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

  Future<ActionnaireCotisationModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ActionnaireCotisationModel(
        id: data[0][0],
        reference: data[0][1],
        nom: data[0][2],
        postNom: data[0][3],
        prenom: data[0][4],
        matricule: data[0][5],
        montant: data[0][6],
        note: data[0][7],
        moyenPaiement: data[0][8],
        numeroTransaction: data[0][9],
        signature: data[0][10],
        created: data[0][11]
    );
  }
}
