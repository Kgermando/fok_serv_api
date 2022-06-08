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
        "INSERT INTO $tableName (id, reference, nom_complet, piece_justificative,"
        "libelle, montant, creance_dette, signature, created)"
        "VALUES (nextval('creance_dettes_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)",
        substitutionValues: {
          '1': data.reference,
          '2': data.nomComplet,
          '3': data.pieceJustificative,
          '4': data.libelle,
          '5': data.montant,
          '6': data.creanceDette,
          '7': data.signature,
          '8': data.created
        });
    });
  }

  Future<void> update(CreanceDetteModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET reference = @1, nom_complet = @2, piece_justificative = @3, libelle = @4,"
        "montant = @5, creance_dette = @6, signature = @7, created = @8 WHERE id = @9",
        substitutionValues: {
          '1': data.reference,
          '2': data.nomComplet,
          '3': data.pieceJustificative,
          '4': data.libelle,
          '5': data.montant,
          '6': data.creanceDette,
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

  Future<CreanceDetteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CreanceDetteModel(
      id: data[0][0],
      reference: data[0][1],
      nomComplet: data[0][2],
      pieceJustificative: data[0][3],
      libelle: data[0][4],
      montant: data[0][5],
      creanceDette: data[0][6],
      signature: data[0][7],
      created: data[0][8]
    );
  }
}
