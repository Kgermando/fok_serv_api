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
        "INSERT INTO $tableName (id, departement, folder_name, nom_document,"
        "description, fichier, signature, created)"
        "VALUES (nextval('archives_id_seq'), @1, @2, @3, @4, @5, @6 , @7)",
        substitutionValues: {
          '1': data.departement,
          '2': data.folderName,
          '3': data.nomDocument,
          '4': data.description,
          '5': data.fichier,
          '6': data.signature,
          '7': data.created
        });
    });
  }

  Future<void> update(ArchiveModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        """UPDATE $tableName
        SET departement = @1, folder_name = @2, nom_document = @3,
        description = @4, fichier = @5, signature = @6,
        created = @7 WHERE id = @8""",
        substitutionValues: {
          '1': data.departement,
          '2': data.folderName,
          '3': data.nomDocument,
          '4': data.description,
          '5': data.fichier,
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

  Future<ArchiveModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ArchiveModel(
      id: data[0][0],
      departement: data[0][1],
      folderName: data[0][2],
      nomDocument: data[0][3],
      description: data[0][4],
      fichier: data[0][5],
      signature: data[0][6],
      created: data[0][7]
    );
  } 
}