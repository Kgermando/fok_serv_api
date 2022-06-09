import 'package:postgres/postgres.dart';

import '../../models/logistiques/trajet_model.dart';

class TrajetRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  TrajetRepository(this.executor, this.tableName);

  Future<List<TrajetModel>> getAllData() async {
    var data = <TrajetModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(TrajetModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(TrajetModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nomero_entreprise, nom_utilisateur,"
          "trajet_de, trajet_a, mission, kilometrage_sorite, kilometrage_retour,"
          "signature, created_ref, created)"
          "VALUES (nextval('trajets_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10)",
          substitutionValues: {
            '1': data.nomeroEntreprise,
            '2': data.nomUtilisateur,
            '3': data.trajetDe,
            '4': data.trajetA,
            '5': data.mission,
            '6': data.kilometrageSorite,
            '7': data.kilometrageRetour,
            '8': data.signature,
            '9': data.createdRef,
            '10': data.created

          });
    });
  }

  Future<void> update(TrajetModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET nomero_entreprise = @1, nom_utilisateur = @2, trajet_de = @3,"
          "trajet_a = @4, mission = @5, kilometrage_sorite = @6, kilometrage_retour = @7,"
          "signature = @8, created_ref = @9, created = @10 WHERE id = @11",
          substitutionValues: {
            '1': data.nomeroEntreprise,
            '2': data.nomUtilisateur,
            '3': data.trajetDe,
            '4': data.trajetA,
            '5': data.mission,
            '6': data.kilometrageSorite,
            '7': data.kilometrageRetour,
            '8': data.signature,
            '9': data.createdRef,
            '10': data.created,
            '11': data.id
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

  Future<TrajetModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return TrajetModel(
        id: data[0][0],
        nomeroEntreprise: data[0][1],
        nomUtilisateur: data[0][2],
        trajetDe: data[0][3],
        trajetA: data[0][4],
        mission: data[0][5],
        kilometrageSorite: data[0][6],
        kilometrageRetour: data[0][7], 
        signature: data[0][8],
        createdRef: data[0][9],
        created: data[0][10]
    );
  }
}