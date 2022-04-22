import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/agenda_model.dart';

class AgendaRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AgendaRepository(this.executor, this.tableName);


  Future<List<AgendaModel>> getAllData() async {
    var data = <AgendaModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AgendaModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AgendaModel data) async {
    var title = data.title;
    var description = data.description;
    var number = data.number;

    var approbationDG = data.approbationDG;
    var signatureDG = data.signatureDG;
    var signatureJustificationDG =
        data.signatureJustificationDG;

    var approbationFin = data.approbationFin;
    var signatureFin = data.signatureFin;
    var signatureJustificationFin = data.signatureJustificationFin;

    var approbationBudget = data.approbationBudget;
    var signatureBudget = data.signatureBudget;
    var signatureJustificationBudget =
        data.signatureJustificationBudget;

    var approbationDD = data.approbationDD;
    var signatureDD = data.signatureDD;
    var signatureJustificationDD =
        data.signatureJustificationDD;

    var signature = data.signature;
    var created = data.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('agendas_id_seq'), '$title',"
        "'$description','$number',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(AgendaModel data) async {
    var id = data.id;
    var title = data.title;
    var description = data.description;
    var number = data.number;
    var approbationDG = data.approbationDG;
    var signatureDG = data.signatureDG;
    var signatureJustificationDG = data.signatureJustificationDG;

    var approbationFin = data.approbationFin;
    var signatureFin = data.signatureFin;
    var signatureJustificationFin = data.signatureJustificationFin;

    var approbationBudget = data.approbationBudget;
    var signatureBudget = data.signatureBudget;
    var signatureJustificationBudget = data.signatureJustificationBudget;

    var approbationDD = data.approbationDD;
    var signatureDD = data.signatureDD;
    var signatureJustificationDD = data.signatureJustificationDD;

    var signature = data.signature;
    var created = data.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"title\"='$title', "
        "\"description\"='$description',\"number\"='$number',"
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

  Future<AgendaModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AgendaModel(
      id: data[0][0],
      title: data[0][1],
      description: data[0][2],
      number: data[0][3],
      approbationDG: data[0][4],
      signatureDG: data[0][5],
      signatureJustificationDG: data[0][6],
      approbationFin: data[0][7],
      signatureFin: data[0][8],
      signatureJustificationFin: data[0][9],
      approbationBudget: data[0][10],
      signatureBudget: data[0][11],
      signatureJustificationBudget: data[0][12],
      approbationDD: data[0][13],
      signatureDD: data[0][14],
      signatureJustificationDD: data[0][15],
      signature: data[0][16],
      created: data[0][17]
    );
  } 
}