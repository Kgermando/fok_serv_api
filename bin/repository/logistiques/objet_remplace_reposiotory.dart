import 'package:postgres/postgres.dart';

import '../../models/logistiques/objet_remplace_model.dart';

class ObjetRemplaceRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ObjetRemplaceRepository(this.executor, this.tableName);

  Future<List<ObjetRemplaceModel>> getAllData() async {
    var data = <ObjetRemplaceModel>{};

    var querySQL = "SELECT * FROM $tableName;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ObjetRemplaceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ObjetRemplaceModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, reference, nom,"
        "cout, caracteristique, observation)"
        "VALUES (nextval('objets_remplace_id_seq'), @1, @2, @3, @4, @5)",
        substitutionValues: {
          '1': data.reference,
          '2': data.nom,
          '3': data.cout,
          '4': data.caracteristique,
          '5': data.observation
        });
    });
  }

  Future<void> update(ObjetRemplaceModel data) async {
    await executor.transaction((conn) async {
      await conn.execute(
          """"UPDATE $tableName
          SET reference = @1, nom = @2, cout = @3,
          caracteristique = @4, observation = @5 WHERE id = @6""",
          substitutionValues: {
            '1': data.reference,
            '2': data.nom,
            '3': data.cout,
            '4': data.caracteristique,
            '5': data.observation,
            '6': data.id
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

  Future<ObjetRemplaceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ObjetRemplaceModel(
      id: data[0][0],
      reference: data[0][1],
      nom: data[0][2],
      cout: data[0][3],
      caracteristique: data[0][4],
      observation: data[0][5] 
    );
  }
}