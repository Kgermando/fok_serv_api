import 'package:postgres/postgres.dart';

import '../../models/logistiques/anguin_model.dart';
import '../../models/logistiques/etat_materiel_model.dart';

class EtaMaterielRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  EtaMaterielRepository(this.executor, this.tableName);

  Future<List<EtatMaterielModel>> getAllData() async {
    var data = <EtatMaterielModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(EtatMaterielModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(EtatMaterielModel etatMaterielModel) async {
    var nom = etatMaterielModel.nom;
    var modele = etatMaterielModel.modele;
    var marque = etatMaterielModel.marque;
    var typeObjet = etatMaterielModel.typeObjet;
    var statut = etatMaterielModel.statut;
    var created = etatMaterielModel.created;
    var signature = etatMaterielModel.signature;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('etat_materiels_id_seq'), '$nom',"
        "'$modele', '$marque', '$typeObjet', '$statut',"
        "'$created', '$signature');");
    });
  }

  Future<void> update(EtatMaterielModel etatMaterielModel) async {
    var id = etatMaterielModel.id;
    var nom = etatMaterielModel.nom;
    var modele = etatMaterielModel.modele;
    var marque = etatMaterielModel.marque;
    var typeObjet = etatMaterielModel.typeObjet;
    var statut = etatMaterielModel.statut;
    var created = etatMaterielModel.created;
    var signature = etatMaterielModel.signature;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"modele\"='$modele',"
        "\"marque\"='$marque', \"typeObjet\"='$typeObjet', \"statut\"='$statut',"
        "\"created\"='$created',\"signature\"='$signature' WHERE id=$id;");
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

  Future<EtatMaterielModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return EtatMaterielModel(
        id: data[0][0],
        nom: data[0][1],
        modele: data[0][2],
        marque: data[0][3],
        typeObjet: data[0][4],
        statut: data[0][5],
        created: data[0][6],
        signature: data[0][7]);
  }
}