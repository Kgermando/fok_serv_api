import 'package:postgres/postgres.dart';
import '../../models/mail/mail_model.dart';

class MailRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  MailRepository(this.executor, this.tableName);


  Future<List<MailModel>> getAllData() async {
    var data = <MailModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"dateSend\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(MailModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(MailModel data) async {
    var fullName = data.fullName;
    var email = data.email;
    var cc = data.cc;
    var objet = data.objet;
    var message = data.message;
    var pieceJointe = data.pieceJointe;
    var read = data.read;
    var dateSend = data.dateSend;
    var dateRead = data.dateRead;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('mails_id_seq'), '$fullName',"
        "'$email', '$cc', '$objet', '$message', '$pieceJointe', '$read',"
        "'$dateSend','$dateRead');");
    });
  }

  Future<void> update(MailModel data) async {
    var id = data.id;
    var fullName = data.fullName;
    var email = data.email;
    var cc = data.cc;
    var objet = data.objet;
    var message = data.message;
    var pieceJointe = data.pieceJointe;
    var read = data.read;
    var dateSend = data.dateSend;
    var dateRead = data.dateRead;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"fullName\"='$fullName', \"email\"='$email',"
          "\"cc\"='$cc', \"objet\"='$objet', \"message\"='$message',"
          "\"pieceJointe\"='$pieceJointe', \"read\"='$read',"
          "\"dateSend\"='$dateSend', \"dateRead\"='$dateRead' WHERE id=$id;");
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

  Future<MailModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return MailModel(
      id: data[0][0],
      fullName: data[0][1],
      email: data[0][2],
      cc: data[0][3],
      objet: data[0][4],
      message: data[0][5],
      pieceJointe: data[0][6],
      read: data[0][7],
      dateSend: data[0][8],
      dateRead: data[0][9]
    );
  } 
}