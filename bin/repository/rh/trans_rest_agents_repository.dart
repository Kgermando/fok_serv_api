import 'package:postgres/postgres.dart';

import '../../models/rh/transport_restauration_model.dart';

class TransRestAgentsRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  TransRestAgentsRepository(this.executor, this.tableName);

  Future<List<TransRestAgentsModel>> getAllData() async {
    var data = <TransRestAgentsModel>{};

    var querySQL = "SELECT * FROM $tableName;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(TransRestAgentsModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(TransRestAgentsModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
          "INSERT INTO $tableName (id, reference, nom,"
          "prenom, matricule, montant)"
          "VALUES (nextval('trans_rest_agents_id_seq'), @1, @2, @3, @4, @5)",
          substitutionValues: {
            '1': data.reference,
            '2': data.nom,
            '3': data.prenom,
            '4': data.matricule,
            '5': data.montant
          });
    });
  }

  Future<void> update(TransRestAgentsModel data) async {
    await executor.query("""UPDATE $tableName
        SET reference = @1, nom = @2, prenom = @3, matricule = @4,
        montant = @5 WHERE id = @6""", substitutionValues: {
      '1': data.reference,
      '2': data.nom,
      '3': data.prenom,
      '4': data.matricule,
      '5': data.montant,
      '6': data.id
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

  Future<TransRestAgentsModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return TransRestAgentsModel(
        id: data[0][0],
        reference: data[0][1],
        nom: data[0][2],
        prenom: data[0][3],
        matricule: data[0][4],
        montant: data[0][5]
    );
  }

}