import 'package:postgres/postgres.dart';

import '../../models/administrations/actionnaire_model.dart';


class ActionnaireRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ActionnaireRepository(this.executor, this.tableName);

  Future<List<ActionnaireModel>> getAllData() async {
    var data = <ActionnaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ActionnaireModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ActionnaireModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
        "INSERT INTO $tableName (id, nom, post_nom, prenom,"
        "email, telephone, adresse, sexe, matricule, signature, created_ref, created)"
        "VALUES (nextval('actionnaires_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11)",
        substitutionValues: {
          '1': data.nom,
          '2': data.postNom,
          '3': data.prenom,
          '4': data.email,
          '5': data.telephone,
          '6': data.adresse,
          '7': data.sexe,
          '8': data.matricule,
          '9': data.signature,
          '10': data.createdRef,
          '11': data.created
        });
    });
  }

  Future<void> update(ActionnaireModel data) async {
    await executor.query("""UPDATE $tableName
      SET nom = @1, post_nom = @2, prenom = @3, email = @4, telephone = @5, 
      adresse = @6, sexe = @7, matricule = @8, signature = @9, created_ref = @10, 
      created = @11 WHERE id = @12""", 
      substitutionValues: {
      '1': data.nom,
      '2': data.postNom,
      '3': data.prenom,
      '4': data.email,
      '5': data.telephone,
      '6': data.adresse,
      '7': data.sexe,
      '8': data.matricule,
      '9': data.signature,
      '10': data.createdRef,
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

  Future<ActionnaireModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ActionnaireModel(
      id: data[0][0],
      nom: data[0][1],
      postNom: data[0][2],
      prenom: data[0][3],
      email: data[0][4],
      telephone: data[0][5],
      adresse: data[0][6],
      sexe: data[0][7],
      matricule: data[0][8],
      signature: data[0][9],
      createdRef: data[0][10],
      created: data[0][11]
    );
  }
}
