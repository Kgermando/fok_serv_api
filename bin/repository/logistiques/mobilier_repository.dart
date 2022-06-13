import 'package:postgres/postgres.dart';

import '../../models/logistiques/mobilier_model.dart';

class MobilierRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  MobilierRepository(this.executor, this.tableName);

  Future<List<MobilierModel>> getAllData() async {
    var data = <MobilierModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(MobilierModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(MobilierModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom, modele,"
          "marque, description_mobilier, nombre, signature, created_ref, created)"
          "VALUES (nextval('mobiliers_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)",
          substitutionValues: {
            '1': data.nom,
            '2': data.modele,
            '3': data.marque,
            '4': data.descriptionMobilier,
            '5': data.nombre,
            '6': data.signature,
            '7': data.createdRef,
            '8': data.created
          });
    });
  }

  Future<void> update(MobilierModel data) async {
    await executor.transaction((conn) async {
      await conn.execute(
        """UPDATE $tableName
        SET nom = @1, modele = @2, marque = @3,
        description_mobilier = @4, nombre = @5,
        signature = @6, created_ref = @7, created = @8 WHERE id = @9""",
        substitutionValues: {
          '1': data.nom,
          '2': data.modele,
          '3': data.marque,
          '4': data.descriptionMobilier,
          '5': data.nombre,
          '6': data.signature,
          '7': data.createdRef,
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

  Future<MobilierModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return MobilierModel(
        id: data[0][0],
        nom: data[0][1],
        modele: data[0][2],
        marque: data[0][3],
        descriptionMobilier: data[0][4],
        nombre: data[0][5],
        signature: data[0][6],
        createdRef: data[0][7],
        created: data[0][8]
    );
  }
}