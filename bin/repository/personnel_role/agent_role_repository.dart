import 'package:postgres/postgres.dart';

import '../../models/personnel_role/agent_role_model.dart';


class AgentRoleRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AgentRoleRepository(this.executor, this.tableName);

  Future<List<AgentRoleModel>> getAllData() async {
    var data = <AgentRoleModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AgentRoleModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AgentRoleModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, reference, departement, agent, role, created)"
          "VALUES (nextval('agents_roles_id_seq'), @1, @2, @3, @4, @5)",
          substitutionValues: {
            '1': data.reference,
            '2': data.departement,
            '3': data.agent,
            '4': data.role,
            '5': data.created
          });
    });
  }

  Future<void> update(AgentRoleModel data) async {
     await executor.query("""UPDATE $tableName
          SET reference = @1, departement = @2, agent = @3, role = @4, created = @5 WHERE id = @6""",
        substitutionValues: {
          '1': data.reference,
          '2': data.departement,
          '3': data.agent,
          '4': data.role,
          '5': data.created,
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

  Future<AgentRoleModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AgentRoleModel(
      id: data[0][0],
      reference: data[0][1],
      departement: data[0][2],
      agent: data[0][3],
      role: data[0][4],
      created: data[0][5]
    );
  }
}
