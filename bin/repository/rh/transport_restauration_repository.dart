import 'package:postgres/postgres.dart';

import '../../models/rh/transport_restauration_model.dart';

class TasnportRestaurationRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  TasnportRestaurationRepository(this.executor, this.tableName);

  Future<List<TransportRestauration>> getAllData() async {
    var data = <TransportRestauration>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(TransportRestauration.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(TransportRestauration data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
          "INSERT INTO $tableName (id, title, agents, ligne_budgetaire,"
          "resources, signature, created)"
          "VALUES (nextval('transport_restaurations_id_seq'), @1, @2, @3, @4, @5, @6)",
          substitutionValues: {
            '1': data.title,
            '2': data.agents,
            '3': data.ligneBudgtaire,
            '4': data.resources,
            '5': data.signature,
            '6': data.created
          });
    });
  }

  Future<void> update(TransportRestauration data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET title = @1, agents = @2, ligne_budgetaire = @3, resources = @4,"
        "signature = @5, created = @6 WHERE id = @7",
        substitutionValues: {
          '1': data.title,
          '2': data.agents,
          '3': data.ligneBudgtaire,
          '4': data.resources,
          '5': data.signature,
          '6': data.created,
          '7': data.id
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

  Future<TransportRestauration> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return TransportRestauration(
        id: data[0][0],
        title: data[0][1],
        agents: data[0][2],
        ligneBudgtaire: data[0][3],
        resources: data[0][4],
        signature: data[0][5],
        created: data[0][6]
    );
  }

}