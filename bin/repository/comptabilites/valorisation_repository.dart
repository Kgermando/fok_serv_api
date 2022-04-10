import 'package:postgres/postgres.dart';

import '../../models/comptabilites/valorisation_model.dart';

class ValorisationRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ValorisationRepository(this.executor, this.tableName);

  Future<List<ValorisationModel>> getAllData() async {
    var data = <ValorisationModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ValorisationModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ValorisationModel valorisationModel) async {
    var numeroOrdre = valorisationModel.numeroOrdre;
    var intitule = valorisationModel.intitule;
    var quantite = valorisationModel.quantite;
    var prixUnitaire = valorisationModel.prixUnitaire;
    var prixTotal = valorisationModel.prixTotal;
    var source = valorisationModel.source;
    var created = valorisationModel.created;
    var signature = valorisationModel.signature;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('valorisations_id_seq'), '$numeroOrdre',"
        "'$intitule','$quantite','$prixUnitaire','$prixTotal','$source','$created','$signature');");
    });
  }

  Future<void> update(ValorisationModel valorisationModel) async {
    var id = valorisationModel.id;
    var numeroOrdre = valorisationModel.numeroOrdre;
    var intitule = valorisationModel.intitule;
    var quantite = valorisationModel.quantite;
    var prixUnitaire = valorisationModel.prixUnitaire;
    var prixTotal = valorisationModel.prixTotal;
    var source = valorisationModel.source;
    var created = valorisationModel.created;
    var signature = valorisationModel.signature;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"numeroOrdre\"='$numeroOrdre', "
        "\"intitule\"='$intitule',\"quantite\"='$quantite',"
        "\"prixUnitaire\"='$prixUnitaire',\"prixTotal\"='$prixTotal',"
        "\"source\"='$source', \"created\"='$created', \"signature\"='$signature' WHERE id=$id;");
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

  Future<ValorisationModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ValorisationModel(
        id: data[0][0],
        numeroOrdre: data[0][1],
        intitule: data[0][2],
        quantite: data[0][3],
        prixUnitaire: data[0][4],
        prixTotal: data[0][5],
        source: data[0][6],
        created: data[0][7],
        signature: data[0][8]);
  } 
  
}