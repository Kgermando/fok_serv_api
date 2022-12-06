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
        "INSERT INTO $tableName (id, nom, type_objet,"
        "type_maintenance, duree_travaux,"
        "signature, created, approbation_dd, motif_dd, signature_dd, is_submit)"
        "VALUES (nextval('entretiens_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10)",
        substitutionValues: {
          '1': data.nom,
          '2': data.typeObjet,
          '3': data.typeMaintenance,
          '4': data.dureeTravaux,
          '5': data.signature,
          '6': data.created,
          '7': data.approbationDD,
          '8': data.motifDD,
          '9': data.signatureDD,
          '10': data.isSubmit
        });
    });
  }

  Future<void> update(EntretienModel data) async {
    await executor.execute("""UPDATE $tableName
        SET nom = @1, type_objet = @2, type_maintenance = @3,
        duree_travaux = @4, signature = @5, created = @6,
        approbation_dd = @7, motif_dd = @8, signature_dd = @9, is_submit = @10 WHERE id = @11""", substitutionValues: {
      '1': data.nom,
      '2': data.typeObjet,
      '3': data.typeMaintenance,
      '4': data.dureeTravaux,
      '5': data.signature,
      '6': data.created,
      '7': data.approbationDD,
      '8': data.motifDD,
      '9': data.signatureDD,
      '10': data.isSubmit,
      '11': data.id 
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
      typeObjet: data[0][2],
      typeMaintenance: data[0][3],
      dureeTravaux: data[0][4],
      signature: data[0][5],
      created: data[0][6], 
      approbationDD: data[0][7],
      motifDD: data[0][8],
      signatureDD: data[0][9],
      isSubmit: data[0][10]
    );
  }
}