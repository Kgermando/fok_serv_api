import 'package:postgres/postgres.dart';

import '../../models/comptabilites/bilan_model.dart';

class BilanRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BilanRepository(this.executor, this.tableName);

  Future<List<BilanModel>> getAllData() async {
    var data = <BilanModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BilanModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BilanModel bilanModel) async {
    var titleBilan = bilanModel.titleBilan;
    var comptes = bilanModel.comptes;
    var intitule = bilanModel.intitule;
    var montant = bilanModel.montant;
    var typeBilan = bilanModel.typeBilan;
    var approbationDG = bilanModel.approbationDG;
    var signatureDG = bilanModel.signatureDG;
    var signatureJustificationDG =
        bilanModel.signatureJustificationDG;

    var approbationFin = bilanModel.approbationFin;
    var signatureFin = bilanModel.signatureFin;
    var signatureJustificationFin =
        bilanModel.signatureJustificationFin;

    var approbationBudget = bilanModel.approbationBudget;
    var signatureBudget = bilanModel.signatureBudget;
    var signatureJustificationBudget =
        bilanModel.signatureJustificationBudget;

    var approbationDD = bilanModel.approbationDD;
    var signatureDD = bilanModel.signatureDD;
    var signatureJustificationDD =
        bilanModel.signatureJustificationDD;

    var signature = bilanModel.signature;
    var created = bilanModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('bilans_id_seq'), '$titleBilan',"
        "'$comptes','$intitule','$montant','$typeBilan',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(BilanModel bilanModel) async {
    var id = bilanModel.id;
    var titleBilan = bilanModel.titleBilan;
    var comptes = bilanModel.comptes;
    var intitule = bilanModel.intitule;
    var montant = bilanModel.montant;
    var typeBilan = bilanModel.typeBilan;
    var approbationDG = bilanModel.approbationDG;
    var signatureDG = bilanModel.signatureDG;
    var signatureJustificationDG =
        bilanModel.signatureJustificationDG;

    var approbationFin = bilanModel.approbationFin;
    var signatureFin = bilanModel.signatureFin;
    var signatureJustificationFin =
        bilanModel.signatureJustificationFin;

    var approbationBudget = bilanModel.approbationBudget;
    var signatureBudget = bilanModel.signatureBudget;
    var signatureJustificationBudget =
        bilanModel.signatureJustificationBudget;

    var approbationDD = bilanModel.approbationDD;
    var signatureDD = bilanModel.signatureDD;
    var signatureJustificationDD =
        bilanModel.signatureJustificationDD;

    var signature = bilanModel.signature;
    var created = bilanModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"titleBilan\"='$titleBilan', "
        "\"comptes\"='$comptes',\"intitule\"='$intitule',"
        "\"montant\"='$montant',\"typeBilan\"='$typeBilan',"
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

  Future<BilanModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BilanModel(
      id: data[0][0],
      titleBilan: data[0][1],
      comptes: data[0][2],
      intitule: data[0][3],
      montant: data[0][4],
      typeBilan: data[0][5],
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