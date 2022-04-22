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
    var nomDocument = data.nomDocument;
    var departement = data.departement;
    var signature = data.signature;
    var created = data.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('archives_id_seq'), '$nomDocument',"
        "'$departement',"
        "'$signature','$created');");
    });
  }

  Future<void> update(ArchiveModel data) async {
    var id = data.id;
    var nomDocument = data.nomDocument;
    var departement = data.departement;
    var signature = data.signature;
    var created = data.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"nomDocument\"='$nomDocument', "
          "\"departement\"='$departement',"
          "\"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
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
      signature: data[0][3],
      created: data[0][4]
    );
  } 
}