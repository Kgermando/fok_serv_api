import 'package:postgres/postgres.dart';

import '../../models/finances/creances_model.dart';

class CreancesRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CreancesRepository(this.executor, this.tableName);

  Future<List<CreanceModel>> getAllData() async {
    var data = <CreanceModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CreanceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CreanceModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom_complet, piece_justificative,"
        "libelle, montant, numero_operation, statut_paie, signature, created_ref, created)"
        "VALUES (nextval('creances_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8 , @9)",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.numeroOperation,
          '6': data.statutPaie,
          '7': data.signature,
          '8': data.createdRef,
          '9': data.created
        });
    });
  }

  Future<void> update(CreanceModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET nom_complet = @1, piece_justificative = @2, libelle = @3,"
        "montant = @4, numero_operation = @5, statut_paie = @6,"
        "signature = @7, created_ref = @8, created = @9 WHERE id = @10",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.numeroOperation,
          '6': data.statutPaie,
          '7': data.signature,
          '8': data.createdRef,
          '9': data.created,
          '10': data.id
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

  Future<CreanceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CreanceModel(
      id: data[0][0],
      nomComplet: data[0][1],
      pieceJustificative: data[0][2],
      libelle: data[0][3],
      montant: data[0][4],
      numeroOperation: data[0][5],
      statutPaie: data[0][6],
      signature: data[0][7],
      createdRef: data[0][8],
      created: data[0][9]
    );
  }

}