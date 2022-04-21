import 'package:postgres/postgres.dart';

import '../../models/logistiques/mobilier_model.dart';

class MobilierRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  MobilierRepository(this.executor, this.tableName);

  Future<List<MobilierModel>> getAllData() async {
    var data = <MobilierModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(MobilierModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(MobilierModel mobilierModel) async {
    var nom = mobilierModel.nom;
    var modele = mobilierModel.modele;
    var marque = mobilierModel.marque;
    var descriptionMobilier = mobilierModel.descriptionMobilier;
    var nombre = mobilierModel.nombre;
    var approbationDG = mobilierModel.approbationDG;
    var signatureDG = mobilierModel.signatureDG;
    var signatureJustificationDG = mobilierModel.signatureJustificationDG;

    var approbationFin = mobilierModel.approbationFin;
    var signatureFin = mobilierModel.signatureFin;
    var signatureJustificationFin = mobilierModel.signatureJustificationFin;

    var approbationBudget = mobilierModel.approbationBudget;
    var signatureBudget = mobilierModel.signatureBudget;
    var signatureJustificationBudget =
        mobilierModel.signatureJustificationBudget;

    var approbationDD = mobilierModel.approbationDD;
    var signatureDD = mobilierModel.signatureDD;
    var signatureJustificationDD = mobilierModel.signatureJustificationDD;

    var signature = mobilierModel.signature;
    var created = mobilierModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('mobiliers_id_seq'), '$nom',"
          "'$modele', '$marque', '$descriptionMobilier', '$nombre',"
          "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
          "'$signature', '$created');");
    });
  }

  Future<void> update(MobilierModel mobilierModel) async {
    var id = mobilierModel.id;
    var nom = mobilierModel.nom;
    var modele = mobilierModel.modele;
    var marque = mobilierModel.marque;
    var descriptionMobilier = mobilierModel.descriptionMobilier;
    var nombre = mobilierModel.nombre;
    var approbationDG = mobilierModel.approbationDG;
    var signatureDG = mobilierModel.signatureDG;
    var signatureJustificationDG =
        mobilierModel.signatureJustificationDG;

    var approbationFin = mobilierModel.approbationFin;
    var signatureFin = mobilierModel.signatureFin;
    var signatureJustificationFin =
        mobilierModel.signatureJustificationFin;

    var approbationBudget = mobilierModel.approbationBudget;
    var signatureBudget = mobilierModel.signatureBudget;
    var signatureJustificationBudget =
        mobilierModel.signatureJustificationBudget;

    var approbationDD = mobilierModel.approbationDD;
    var signatureDD = mobilierModel.signatureDD;
    var signatureJustificationDD =
        mobilierModel.signatureJustificationDD;

    var signature = mobilierModel.signature;
    var created = mobilierModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"modele\"='$modele',"
        "\"marque\"='$marque', \"descriptionMobilier\"='$descriptionMobilier', \"nombre\"='$nombre',"
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

  Future<MobilierModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return MobilierModel(
        id: data[0][0],
        nom: data[0][1],
        modele: data[0][2],
        marque: data[0][3],
        descriptionMobilier: data[0][4],
        nombre: data[0][5],
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