import 'package:postgres/postgres.dart';

import '../../models/logistiques/entretien_model.dart';

class EntretienRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  EntretienRepository(this.executor, this.tableName);

  Future<List<EntretienModel>> getAllData() async {
    var data = <EntretienModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(EntretienModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(EntretienModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom, modele,"
        "marque, etat_objet, objet_remplace, duree_travaux,"
        "signature, created)"
        "VALUES (nextval('entretiens_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)",
        substitutionValues: {
          '1': data.nom,
          '2': data.modele,
          '3': data.marque,
          '4': data.etatObjet,
          '5': data.objetRemplace,
          '6': data.dureeTravaux,
          '7': data.signature,
          '8': data.created
        });
    });
  }

  Future<void> update(EntretienModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET nom = @1, modele = @2, marque = @3,"
          "etat_objet = @4, objet_remplace = @5, duree_travaux = @6,"
          "signature = @7, created = @8 WHERE id = @9",
          substitutionValues: {
            '1': data.nom,
            '2': data.modele,
            '3': data.marque,
            '4': data.etatObjet,
            '5': data.objetRemplace,
            '6': data.dureeTravaux,
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

  Future<EntretienModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return EntretienModel(
      id: data[0][0],
      nom: data[0][1],
      modele: data[0][2],
      marque: data[0][3],
      etatObjet: data[0][4],
      objetRemplace: data[0][5],
      dureeTravaux: data[0][6], 
      signature: data[0][7],
      created: data[0][8]
    );
  }
}