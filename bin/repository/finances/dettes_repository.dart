import 'package:postgres/postgres.dart';

import '../../models/finances/dette_model.dart';

class DettesRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DettesRepository(this.executor, this.tableName);


  Future<List<DetteModel>> getAllData() async {
    var data = <DetteModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(DetteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(DetteModel detteModel) async {
    var nomComplet = detteModel.nomComplet;
    var pieceJustificative = detteModel.pieceJustificative;
    var libelle = detteModel.libelle;
    var montant = detteModel.montant;
    var numeroOperation = detteModel.numeroOperation;
    var statutPaie = detteModel.statutPaie;
    var approbationDG = detteModel.approbationDG;
    var signatureDG = detteModel.signatureDG;
    var signatureJustificationDG =
        detteModel.signatureJustificationDG;

    var approbationFin = detteModel.approbationFin;
    var signatureFin = detteModel.signatureFin;
    var signatureJustificationFin =
        detteModel.signatureJustificationFin;

    var approbationBudget = detteModel.approbationBudget;
    var signatureBudget = detteModel.signatureBudget;
    var signatureJustificationBudget =
        detteModel.signatureJustificationBudget;

    var approbationDD = detteModel.approbationDD;
    var signatureDD = detteModel.signatureDD;
    var signatureJustificationDD =
        detteModel.signatureJustificationDD;

    var signature = detteModel.signature;
    var created = detteModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('dettes_id_seq'), '$nomComplet',"
          "'$pieceJustificative','$libelle','$montant',"
          "'$numeroOperation', '$statutPaie',"
          "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
          "'$signature','$created');");
    });
  }

  Future<void> update(DetteModel detteModel) async {
    var id = detteModel.id;
    var nomComplet = detteModel.nomComplet;
    var pieceJustificative = detteModel.pieceJustificative;
    var libelle = detteModel.libelle;
    var montant = detteModel.montant;
    var numeroOperation = detteModel.numeroOperation;
    var statutPaie = detteModel.statutPaie;
    var approbationDG = detteModel.approbationDG;
    var signatureDG = detteModel.signatureDG;
    var signatureJustificationDG = detteModel.signatureJustificationDG;

    var approbationFin = detteModel.approbationFin;
    var signatureFin = detteModel.signatureFin;
    var signatureJustificationFin = detteModel.signatureJustificationFin;

    var approbationBudget = detteModel.approbationBudget;
    var signatureBudget = detteModel.signatureBudget;
    var signatureJustificationBudget = detteModel.signatureJustificationBudget;

    var approbationDD = detteModel.approbationDD;
    var signatureDD = detteModel.signatureDD;
    var signatureJustificationDD = detteModel.signatureJustificationDD;

    var signature = detteModel.signature;
    var created = detteModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nomComplet\"='$nomComplet', "
        "\"pieceJustificative\"='$pieceJustificative',\"libelle\"='$libelle',"
        "\"montant\"='$montant', \"numeroOperation\"='$numeroOperation', \"statutPaie\"='$statutPaie'"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created' WHERE id=$id;");
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

  Future<DetteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DetteModel(
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