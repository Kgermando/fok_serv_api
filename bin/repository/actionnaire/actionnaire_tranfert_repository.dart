import 'package:postgres/postgres.dart';
 
import '../../models/actionnaire/actionnaire_transfert_model.dart'; 

class ActionnaireTransfertRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ActionnaireTransfertRepository(this.executor, this.tableName);

  Future<List<ActionnaireTransfertModel>> getAllData() async {
    var data = <ActionnaireTransfertModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ActionnaireTransfertModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ActionnaireTransfertModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
        "INSERT INTO $tableName (id, matricule_envoi, matricule_recu, montant,"
        "signature, created)"
        "VALUES (nextval('actionnaire_transferts_id_seq'), @1, @2, @3, @4, @5)",
          substitutionValues: {
            '1': data.matriculeEnvoi,
            '2': data.matriculeRecu,
            '3': data.montant,
            '4': data.signature,
            '5': data.created 
          });
    });
  }

  Future<void> update(ActionnaireTransfertModel data) async {
    await executor.query("""UPDATE $tableName
      SET matricule_envoi = @1, matricule_recu = @2, montant = @3, 
        signature = @4, created = @5 WHERE id = @6""", 
      substitutionValues: {
        '1': data.matriculeEnvoi,
        '2': data.matriculeRecu,
        '3': data.montant,
        '4': data.signature,
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

  Future<ActionnaireTransfertModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ActionnaireTransfertModel(
        id: data[0][0],
        matriculeEnvoi: data[0][1],
        matriculeRecu: data[0][2],
        montant: data[0][3],
        signature: data[0][4],
        created: data[0][5] 
    );
  }
}
