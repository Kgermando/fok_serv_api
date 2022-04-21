import 'package:postgres/postgres.dart';

import '../../models/finances/creances_model.dart';

class CreancesRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CreancesRepository(this.executor, this.tableName);

  Future<List<CreanceModel>> getAllData() async {
    var data = <CreanceModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CreanceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CreanceModel creanceModel) async {
    var nomComplet = creanceModel.nomComplet;
    var pieceJustificative = creanceModel.pieceJustificative;
    var libelle = creanceModel.libelle;
    var montant = creanceModel.montant;
    var numeroOperation = creanceModel.numeroOperation;
    var statutPaie = creanceModel.statutPaie;
    var approbationDG = creanceModel.approbationDG;
    var signatureDG = creanceModel.signatureDG;
    var signatureJustificationDG =
        creanceModel.signatureJustificationDG;

    var approbationFin = creanceModel.approbationFin;
    var signatureFin = creanceModel.signatureFin;
    var signatureJustificationFin =
        creanceModel.signatureJustificationFin;

    var approbationBudget = creanceModel.approbationBudget;
    var signatureBudget = creanceModel.signatureBudget;
    var signatureJustificationBudget =
        creanceModel.signatureJustificationBudget;

    var approbationDD = creanceModel.approbationDD;
    var signatureDD = creanceModel.signatureDD;
    var signatureJustificationDD =
        creanceModel.signatureJustificationDD;

    var signature = creanceModel.signature;
    var created = creanceModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('creances_id_seq'), '$nomComplet',"
          "'$pieceJustificative','$libelle','$montant',"
          "'$numeroOperation','$statutPaie',"
          "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
          "'$signature','$created');");
    });
  }

  Future<void> update(CreanceModel creanceModel) async {
    var id = creanceModel.id;
    var nomComplet = creanceModel.nomComplet;
    var pieceJustificative = creanceModel.pieceJustificative;
    var libelle = creanceModel.libelle;
    var montant = creanceModel.montant;
    var numeroOperation = creanceModel.numeroOperation;
    var statutPaie = creanceModel.statutPaie;
    var approbationDG = creanceModel.approbationDG;
    var signatureDG = creanceModel.signatureDG;
    var signatureJustificationDG =
        creanceModel.signatureJustificationDG;

    var approbationFin = creanceModel.approbationFin;
    var signatureFin = creanceModel.signatureFin;
    var signatureJustificationFin =
        creanceModel.signatureJustificationFin;

    var approbationBudget = creanceModel.approbationBudget;
    var signatureBudget = creanceModel.signatureBudget;
    var signatureJustificationBudget =
        creanceModel.signatureJustificationBudget;

    var approbationDD = creanceModel.approbationDD;
    var signatureDD = creanceModel.signatureDD;
    var signatureJustificationDD =
        creanceModel.signatureJustificationDD;

    var signature = creanceModel.signature;
    var created = creanceModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nomComplet\"='$nomComplet', "
        "\"pieceJustificative\"='$pieceJustificative',\"libelle\"='$libelle',"
        "\"montant\"='$montant', \"numeroOperation\"='$numeroOperation', \"statutPaie\"='$statutPaie'"
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

  Future<CreanceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CreanceModel(
      id: data[0][0],
      nomComplet: data[0][1],
      pieceJustificative: data[0][2],
      libelle: data[0][3],
      montant: data[0][4],
      numeroOperation: data[0][5],
      statutPaie: data[0][6],
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