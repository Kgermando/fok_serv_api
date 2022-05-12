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
          "SELECT statut, COUNT(statut) FROM $tableName WHERE \"approbationDG\"='Approved' GROUP BY \"statut\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartMaterielModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartMaterielModel;
    }
  }

  Future<void> insertData(EtatMaterielModel etatMaterielModel) async {
    var nom = etatMaterielModel.nom;
    var modele = etatMaterielModel.modele;
    var marque = etatMaterielModel.marque;
    var typeObjet = etatMaterielModel.typeObjet;
    var statut = etatMaterielModel.statut;
    var approbationDG = etatMaterielModel.approbationDG;
    var signatureDG = etatMaterielModel.signatureDG;
    var signatureJustificationDG =
        etatMaterielModel.signatureJustificationDG;

    var approbationFin = etatMaterielModel.approbationFin;
    var signatureFin = etatMaterielModel.signatureFin;
    var signatureJustificationFin =
        etatMaterielModel.signatureJustificationFin;

    var approbationBudget = etatMaterielModel.approbationBudget;
    var signatureBudget = etatMaterielModel.signatureBudget;
    var signatureJustificationBudget =
        etatMaterielModel.signatureJustificationBudget;

    var approbationDD = etatMaterielModel.approbationDD;
    var signatureDD = etatMaterielModel.signatureDD;
    var signatureJustificationDD =
        etatMaterielModel.signatureJustificationDD;

    var signature = etatMaterielModel.signature;
    var created = etatMaterielModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('etat_materiels_id_seq'), '$nom',"
        "'$modele', '$marque', '$typeObjet', '$statut',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(EtatMaterielModel etatMaterielModel) async {
    var id = etatMaterielModel.id;
    var nom = etatMaterielModel.nom;
    var modele = etatMaterielModel.modele;
    var marque = etatMaterielModel.marque;
    var typeObjet = etatMaterielModel.typeObjet;
    var statut = etatMaterielModel.statut;
   var approbationDG = etatMaterielModel.approbationDG;
  var signatureDG = etatMaterielModel.signatureDG;
  var signatureJustificationDG = etatMaterielModel.signatureJustificationDG;

  var approbationFin = etatMaterielModel.approbationFin;
  var signatureFin = etatMaterielModel.signatureFin;
  var signatureJustificationFin = etatMaterielModel.signatureJustificationFin;

  var approbationBudget = etatMaterielModel.approbationBudget;
  var signatureBudget = etatMaterielModel.signatureBudget;
  var signatureJustificationBudget =
      etatMaterielModel.signatureJustificationBudget;

  var approbationDD = etatMaterielModel.approbationDD;
    var signatureDD = etatMaterielModel.signatureDD;
    var signatureJustificationDD = etatMaterielModel.signatureJustificationDD;

    var signature = etatMaterielModel.signature;
    var created = etatMaterielModel.created;
    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"modele\"='$modele',"
        "\"marque\"='$marque', \"typeObjet\"='$typeObjet', \"statut\"='$statut',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
        "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
        "\"signatureJustificationFin\"='$signatureJustificationFin',"
        "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
        "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
        "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
        "\"signatureJustificationDD\"='$signatureJustificationDD',"
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
        approbationDG: data[0][6],
        signatureDG: data[0][7],
        signatureJustificationDG: data[0][8],
        approbationFin: data[0][9],
        signatureFin: data[0][10],
        signatureJustificationFin: data[0][11],
        approbationBudget: data[0][12],
        signatureBudget: data[0][13],
        signatureJustificationBudget: data[0][14],
        approbationDD: data[0][15],
        signatureDD: data[0][16],
        signatureJustificationDD: data[0][17],
        signature: data[0][18],
        created: data[0][19]
    );
  }
}