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

  Future<void> insertData(MobilierModel mobilierModel) async {
    var nom = mobilierModel.nom;
    var modele = mobilierModel.modele;
    var marque = mobilierModel.marque;
    var descriptionMobilier = mobilierModel.descriptionMobilier;
    var nombre = mobilierModel.nombre;

    var signature = mobilierModel.signature;
    var created = mobilierModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('mobiliers_id_seq'), '$nom',"
          "'$modele', '$marque', '$descriptionMobilier', '$nombre',"
          "'$signature', '$created');");
    });
  }

  Future<void> update(MobilierModel mobilierModel) async {
    var id = mobilierModel.id;
    var nom = mobilierModel.nom;
    var modele = mobilierModel.modele;
    var marque = mobilierModel.marque;
    var descriptionMobilier = mobilierModel.descriptionMobilier;
    var nombre = mobilierModel.nombre;

    var signature = mobilierModel.signature;
    var created = mobilierModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"modele\"='$modele',"
        "\"marque\"='$marque', \"descriptionMobilier\"='$descriptionMobilier', \"nombre\"='$nombre',"
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
        created: data[0][7]
    );
  }
}