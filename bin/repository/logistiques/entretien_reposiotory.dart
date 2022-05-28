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

  Future<void> insertData(EntretienModel entretienModel) async {
    var nom = entretienModel.nom;
    var modele = entretienModel.modele;
    var marque = entretienModel.marque;
    var etatObjet = entretienModel.etatObjet;
    var objetRemplace = entretienModel.objetRemplace;
    var dureeTravaux = entretienModel.dureeTravaux;

    var signature = entretienModel.signature;
    var created = entretienModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('entretiens_id_seq'), '$nom',"
          "'$modele', '$marque', '$etatObjet', '$objetRemplace', '$dureeTravaux',"
          "'$signature', '$created');");
    });
  }

  Future<void> update(EntretienModel entretienModel) async {
    var id = entretienModel.id;
    var nom = entretienModel.nom;
    var modele = entretienModel.modele;
    var marque = entretienModel.marque;
    var etatObjet = entretienModel.etatObjet;
    var objetRemplace = entretienModel.objetRemplace;
    var dureeTravaux = entretienModel.dureeTravaux;
    var signature = entretienModel.signature;
    var created = entretienModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"modele\"='$modele',"
        "\"marque\"='$marque', \"etatObjet\"='$etatObjet', \"objetRemplace\"='$objetRemplace',"
        "\"dureeTravaux\"='$dureeTravaux'," 
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

  Future<EntretienModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return EntretienModel(
      id: data[0][0],
      nom: data[0][1],
      modele: data[0][2],
      marque: data[0][3],
      etatObjet: data[0][4],
      objetRemplace: data[0][5],
      dureeTravaux: data[0][6], 
      signature: data[0][7],
      created: data[0][8]
    );
  }
}