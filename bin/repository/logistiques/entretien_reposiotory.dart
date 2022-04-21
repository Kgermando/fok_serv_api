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
    var approbationDG = entretienModel.approbationDG;
    var signatureDG = entretienModel.signatureDG;
    var signatureJustificationDG =
        entretienModel.signatureJustificationDG;
    var approbationFin = entretienModel.approbationFin;
    var signatureFin = entretienModel.signatureFin;
    var signatureJustificationFin = entretienModel.signatureJustificationFin;

    var approbationBudget = entretienModel.approbationBudget;
    var signatureBudget = entretienModel.signatureBudget;
    var signatureJustificationBudget =
        entretienModel.signatureJustificationBudget;

    var approbationDD = entretienModel.approbationDD;
    var signatureDD = entretienModel.signatureDD;
    var signatureJustificationDD = entretienModel.signatureJustificationDD;

    var signature = entretienModel.signature;
    var created = entretienModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('entretiens_id_seq'), '$nom',"
          "'$modele', '$marque', '$etatObjet', '$objetRemplace', '$dureeTravaux',"
          "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
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
    var approbationDG = entretienModel.approbationDG;
    var signatureDG = entretienModel.signatureDG;
    var signatureJustificationDG =
        entretienModel.signatureJustificationDG;

    var approbationFin = entretienModel.approbationFin;
    var signatureFin = entretienModel.signatureFin;
    var signatureJustificationFin =
        entretienModel.signatureJustificationFin;

    var approbationBudget = entretienModel.approbationBudget;
    var signatureBudget = entretienModel.signatureBudget;
    var signatureJustificationBudget =
        entretienModel.signatureJustificationBudget;

    var approbationDD = entretienModel.approbationDD;
    var signatureDD = entretienModel.signatureDD;
    var signatureJustificationDD =
        entretienModel.signatureJustificationDD;

    var signature = entretienModel.signature;
    var created = entretienModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"modele\"='$modele',"
        "\"marque\"='$marque', \"etatObjet\"='$etatObjet', \"objetRemplace\"='$objetRemplace',"
        "\"dureeTravaux\"='$dureeTravaux',"
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