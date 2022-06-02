import 'package:postgres/postgres.dart';

import '../../models/finances/creance_dette_model.dart';

class CreanceDetteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CreanceDetteRepository(this.executor, this.tableName);

  Future<List<CreanceDetteModel>> getAllData() async {
    var data = <CreanceDetteModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CreanceDetteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CreanceDetteModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom_complet, piece_justificative,"
        "libelle, montant, creance_dette,  signature, created)"
        "VALUES (nextval('creance_dettes_id_seq'), @1, @2, @3, @4, @5, @6, @7)",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.creanceDette,
          '6': data.signature,
          '7': data.created
        });
    });
  }

  Future<void> update(CreanceDetteModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET nom_complet = @1, piece_justificative = @2, libelle = @3,"
        "montant = @4, creance_dette = @5, signature = @6, created = @7 WHERE id = @8",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.creanceDette,
          '6': data.signature,
          '7': data.created,
          '8': data.id
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

  Future<CreanceDetteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CreanceDetteModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        libelle: data[0][3],
        montant: data[0][4],
        creanceDette: data[0][5],
        signature: data[0][6],
        created: data[0][7]);
  }
}
