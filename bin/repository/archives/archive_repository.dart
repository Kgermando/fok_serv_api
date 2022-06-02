import 'package:postgres/postgres.dart';

import '../../models/archive/archive_model.dart';

class ArchiveRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ArchiveRepository(this.executor, this.tableName);


  Future<List<ArchiveModel>> getAllData() async {
    var data = <ArchiveModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ArchiveModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ArchiveModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
        "INSERT INTO $tableName (id, nom_document, departement,"
        "description, fichier, signature, created)"
        "VALUES (nextval('archives_id_seq'), @1, @2, @3, @4, @5, @6)",
        substitutionValues: {
          '1': data.nomDocument,
          '2': data.departement,
          '3': data.description,
          '4': data.fichier,
          '5': data.signature,
          '6': data.created
        });
    });
  }

  Future<void> update(ArchiveModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET nom_document = @1, departement = @2, description = @3,"
        "fichier = @4, signature = @5, created = @6 WHERE id = @7",
        substitutionValues: {
          '1': data.nomDocument,
          '2': data.departement,
          '3': data.description,
          '4': data.fichier,
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

  Future<ArchiveModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ArchiveModel(
      id: data[0][0],
      nomDocument: data[0][1],
      departement: data[0][2],
      description: data[0][3],
      fichier: data[0][4],
      signature: data[0][5],
      created: data[0][6]
    );
  } 
}