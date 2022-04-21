import 'package:postgres/postgres.dart';

import '../../models/comptabilites/amortissement_model.dart';

class AmortissementRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AmortissementRepository(this.executor, this.tableName);

  Future<List<AmortissementModel>> getAllData() async {
    var data = <AmortissementModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AmortissementModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AmortissementModel amortissementModel) async {
    var titleArmotissement = amortissementModel.titleArmotissement;
    var comptes = amortissementModel.comptes;
    var intitule = amortissementModel.intitule;
    var montant = amortissementModel.montant;
    var typeJournal = amortissementModel.typeJournal;
    var approbationDG = amortissementModel.approbationDG;
    var signatureDG = amortissementModel.signatureDG;
    var signatureJustificationDG =
        amortissementModel.signatureJustificationDG;

    var approbationFin = amortissementModel.approbationFin;
    var signatureFin = amortissementModel.signatureFin;
    var signatureJustificationFin =
        amortissementModel.signatureJustificationFin;

    var approbationBudget = amortissementModel.approbationBudget;
    var signatureBudget = amortissementModel.signatureBudget;
    var signatureJustificationBudget =
        amortissementModel.signatureJustificationBudget;

    var approbationDD = amortissementModel.approbationDD;
    var signatureDD = amortissementModel.signatureDD;
    var signatureJustificationDD =
        amortissementModel.signatureJustificationDD;

    var signature = amortissementModel.signature;
    var created = amortissementModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('amortissements_id_seq'), '$titleArmotissement',"
        "'$comptes','$intitule','$montant','$typeJournal',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(AmortissementModel amortissementModel) async {
    var id = amortissementModel.id;
    var titleArmotissement = amortissementModel.titleArmotissement;
    var comptes = amortissementModel.comptes;
    var intitule = amortissementModel.intitule;
    var montant = amortissementModel.montant;
    var typeJournal = amortissementModel.typeJournal;
    var approbationDG = amortissementModel.approbationDG;
    var signatureDG = amortissementModel.signatureDG;
    var signatureJustificationDG = amortissementModel.signatureJustificationDG;

    var approbationFin = amortissementModel.approbationFin;
    var signatureFin = amortissementModel.signatureFin;
    var signatureJustificationFin =
        amortissementModel.signatureJustificationFin;

    var approbationBudget = amortissementModel.approbationBudget;
    var signatureBudget = amortissementModel.signatureBudget;
    var signatureJustificationBudget =
        amortissementModel.signatureJustificationBudget;

    var approbationDD = amortissementModel.approbationDD;
    var signatureDD = amortissementModel.signatureDD;
    var signatureJustificationDD = amortissementModel.signatureJustificationDD;

    var signature = amortissementModel.signature;
    var created = amortissementModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"titleArmotissement\"='$titleArmotissement', "
        "\"comptes\"='$comptes', \"intitule\"='$intitule',"
        "\"montant\"='$montant', \"typeJournal\"='$typeJournal',"
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

  Future<AmortissementModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AmortissementModel(
      id: data[0][0],
      titleArmotissement: data[0][1],
      comptes: data[0][2],
      intitule: data[0][3],
      montant: data[0][4],
      typeJournal: data[0][5],
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