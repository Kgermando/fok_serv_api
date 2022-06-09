import 'package:postgres/postgres.dart';

import '../../models/charts/pie_chart_model.dart';
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

  
  Future<List<PieChartMaterielModel>> getChartPie() async {
    try {
      var data = <PieChartMaterielModel>{};

      var querySQL =
          "SELECT statut, COUNT(statut) FROM $tableName GROUP BY \"statut\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartMaterielModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartMaterielModel;
    }
  }

  Future<void> insertData(EtatMaterielModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom, modele,"
          "marque, type_objet, signature, created_ref, created)"
          "VALUES (nextval('etat_materiels_id_seq'), @1, @2, @3, @4, @5, @6, @7)",
          substitutionValues: {
            '1': data.nom,
            '2': data.modele,
            '3': data.marque,
            '4': data.typeObjet,
            '5': data.signature,
            '6': data.createdRef,
            '7': data.created
          });
    });
  }

  Future<void> update(EtatMaterielModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET nom = @1, modele = @2, marque = @3, type_objet = @4,"
          "signature = @5, created_ref = @6 , created = @7 WHERE id = @8",
          substitutionValues: {
            '1': data.nom,
            '2': data.modele,
            '3': data.marque,
            '4': data.typeObjet,
            '5': data.signature,
            '6': data.createdRef,
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
        signature: data[0][6],
        createdRef: data[0][7],
        created: data[0][8]
    );
  }
}