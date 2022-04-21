import 'package:postgres/postgres.dart';

import '../../models/devis/devis_models.dart';

class DevisRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DevisRepository(this.executor, this.tableName);


  Future<List<DevisModel>> getAllData() async {
    var data = <DevisModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(DevisModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(DevisModel devisModel) async {
    var title = devisModel.title;
    var priority = devisModel.priority;
    var departement = devisModel.departement;
    var list = devisModel.list;
    var approbationDG = devisModel.approbationDG;
    var signatureDG = devisModel.signatureDG;
    var signatureJustificationDG =
        devisModel.signatureJustificationDG;

    var approbationFin = devisModel.approbationFin;
    var signatureFin = devisModel.signatureFin;
    var signatureJustificationFin =
        devisModel.signatureJustificationFin;

    var approbationBudget = devisModel.approbationBudget;
    var signatureBudget = devisModel.signatureBudget;
    var signatureJustificationBudget =
        devisModel.signatureJustificationBudget;

    var approbationDD = devisModel.approbationDD;
    var signatureDD = devisModel.signatureDD;
    var signatureJustificationDD =
        devisModel.signatureJustificationDD;

    var signature = devisModel.signature;
    var created = devisModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('devis_id_seq'), '$title',"
        "'$priority','$departement','$list',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(DevisModel devisModel) async {
    var id = devisModel.id;
    var title = devisModel.title;
    var priority = devisModel.priority;
    var departement = devisModel.departement;
    var list = devisModel.list;
    var approbationDG = devisModel.approbationDG;
    var signatureDG = devisModel.signatureDG;
    var signatureJustificationDG = devisModel.signatureJustificationDG;

    var approbationFin = devisModel.approbationFin;
    var signatureFin = devisModel.signatureFin;
    var signatureJustificationFin = devisModel.signatureJustificationFin;

    var approbationBudget = devisModel.approbationBudget;
    var signatureBudget = devisModel.signatureBudget;
    var signatureJustificationBudget = devisModel.signatureJustificationBudget;

    var approbationDD = devisModel.approbationDD;
    var signatureDD = devisModel.signatureDD;
    var signatureJustificationDD = devisModel.signatureJustificationDD;

    var signature = devisModel.signature;
    var created = devisModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"title\"='$title', "
          "\"priority\"='$priority',\"departement\"='$departement',"
          "\"list\"='$list',"
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

  Future<DevisModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DevisModel(
      id: data[0][0],
      title: data[0][1],
      priority: data[0][2],
      departement: data[0][3],
      list: data[0][4],
      approbationDG: data[0][5],
      signatureDG: data[0][6],
      signatureJustificationDG: data[0][7],
      approbationFin: data[0][8],
      signatureFin: data[0][9],
      signatureJustificationFin: data[0][10],
      approbationBudget: data[0][11],
      signatureBudget: data[0][12],
      signatureJustificationBudget: data[0][13],
      approbationDD: data[0][14],
      signatureDD: data[0][15],
      signatureJustificationDD: data[0][16],
      signature: data[0][17],
      created: data[0][18]
    );
  } 
}