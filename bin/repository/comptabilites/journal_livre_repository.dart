import 'package:postgres/postgres.dart';

import '../../models/comptabilites/journal_livre_model.dart';

class JournalLivreRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  JournalLivreRepository(this.executor, this.tableName);

  Future<List<JournalLivreModel>> getAllData() async {
    var data = <JournalLivreModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(JournalLivreModel.fromSQL(row));
    }
    return data.toList();
  } 

  Future<void> insertData(JournalLivreModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, intitule, debut, fin, signature, created," 
        "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
        "VALUES (nextval('journal_livres_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11)",
        substitutionValues: {
          '1': data.intitule,
          '2': data.debut,
          '3': data.fin,
          '4': data.signature,
          '5': data.created,
          '6': data.approbationDG,
          '7': data.motifDG,
          '8': data.signatureDG,
          '9': data.approbationDD,
          '10': data.motifDD,
          '11': data.signatureDD
        });
    });
  }

  Future<void> update(JournalLivreModel data) async {
    await executor.query("""UPDATE $tableName
      SET intitule = @1, debut = @2, fin = @3,
      signature = @4, created = @5, approbation_dg = @6, motif_dg = @7, 
      signature_dg = @8, approbation_dd = @9, motif_dd = @10, 
      signature_dd = @11 WHERE id = @12""",
        substitutionValues: {
          '1': data.intitule,
          '2': data.debut,
          '3': data.fin, 
          '4': data.signature,
          '5': data.created,
          '6': data.approbationDG,
          '7': data.motifDG,
          '8': data.signatureDG,
          '9': data.approbationDD,
          '10': data.motifDD,
          '11': data.signatureDD,
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

  Future<JournalLivreModel> getFromId(int id) async {
    var data =
      await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return JournalLivreModel(
      id: data[0][0],
      intitule: data[0][1],
      debut: data[0][2],
      fin: data[0][3],
      signature: data[0][4],
      created: data[0][5],
      approbationDG: data[0][6],
      motifDG: data[0][7],
      signatureDG: data[0][8],
      approbationDD: data[0][9],
      motifDD: data[0][10],
      signatureDD: data[0][11] 
    );
  }
}
