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
    var approbationDG = valorisationModel.approbationDG;
    var signatureDG = valorisationModel.signatureDG;
    var signatureJustificationDG =
        valorisationModel.signatureJustificationDG;

    var approbationFin = valorisationModel.approbationFin;
    var signatureFin = valorisationModel.signatureFin;
    var signatureJustificationFin =
        valorisationModel.signatureJustificationFin;

    var approbationBudget = valorisationModel.approbationBudget;
    var signatureBudget = valorisationModel.signatureBudget;
    var signatureJustificationBudget =
        valorisationModel.signatureJustificationBudget;

    var approbationDD = valorisationModel.approbationDD;
    var signatureDD = valorisationModel.signatureDD;
    var signatureJustificationDD =
        valorisationModel.signatureJustificationDD;

    var signature = valorisationModel.signature;
    var created = valorisationModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('valorisations_id_seq'), '$numeroOrdre',"
        "'$intitule','$quantite','$prixUnitaire','$prixTotal','$source',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
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
    var approbationDG = valorisationModel.approbationDG;
    var signatureDG = valorisationModel.signatureDG;
    var signatureJustificationDG = valorisationModel.signatureJustificationDG;

    var approbationFin = valorisationModel.approbationFin;
    var signatureFin = valorisationModel.signatureFin;
    var signatureJustificationFin = valorisationModel.signatureJustificationFin;

    var approbationBudget = valorisationModel.approbationBudget;
    var signatureBudget = valorisationModel.signatureBudget;
    var signatureJustificationBudget =
        valorisationModel.signatureJustificationBudget;

    var approbationDD = valorisationModel.approbationDD;
    var signatureDD = valorisationModel.signatureDD;
    var signatureJustificationDD = valorisationModel.signatureJustificationDD;

    var signature = valorisationModel.signature;
    var created = valorisationModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"numeroOrdre\"='$numeroOrdre', "
        "\"intitule\"='$intitule',\"quantite\"='$quantite',"
        "\"prixUnitaire\"='$prixUnitaire',\"prixTotal\"='$prixTotal',"
        "\"source\"='$source',"
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
        approbationDG: data[0][7],
        signatureDG: data[0][8],
        signatureJustificationDG: data[0][9],
        approbationFin: data[0][10],
        signatureFin: data[0][11],
        signatureJustificationFin: data[0][12],
        approbationBudget: data[0][13],
        signatureBudget: data[0][14],
        signatureJustificationBudget: data[0][15],
        approbationDD: data[0][16],
        signatureDD: data[0][17],
        signatureJustificationDD: data[0][18],
        signature: data[0][19],
        created: data[0][20]
    );
  } 
  
}