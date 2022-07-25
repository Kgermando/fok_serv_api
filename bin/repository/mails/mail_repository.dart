import 'package:postgres/postgres.dart';
import '../../models/mail/mail_model.dart';

class MailRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  MailRepository(this.executor, this.tableName);


  Future<List<MailModel>> getAllData() async {
    var data = <MailModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"date_send\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(MailModel.fromSQL(row));
    }
    return data.toList();
  } 

  Future<void> insertData(MailModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute("""
        INSERT INTO $tableName (id, full_name, email, cc, objet, message,
        piece_jointe, read, full_name_dest, email_dest, date_send, date_read)
        VALUES (nextval('mails_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11)""",
        substitutionValues: {
          '1': data.fullName,
          '2': data.email,
          '3': data.cc,
          '4': data.objet,
          '5': data.message,
          '6': data.pieceJointe,
          '7': data.read,
          '8': data.fullNameDest,
          '9': data.emailDest,
          '10': data.dateSend,
          '11': data.dateRead
        });
    });
  }

  Future<void> update(MailModel data) async {
     await executor.query("""UPDATE $tableName
        SET full_name = @1, email = @2, cc = @3, objet = @4, message = @5,
        piece_jointe = @6, read = @7, full_name_dest = @8, email_dest = @9,
        date_send = @10, date_read = @11 WHERE id = @12""",
        substitutionValues: {
          '1': data.fullName,
          '2': data.email,
          '3': data.cc,
          '4': data.objet,
          '5': data.message,
          '6': data.pieceJointe,
          '7': data.read,
          '8': data.fullNameDest,
          '9': data.emailDest,
          '10': data.dateSend,
          '11': data.dateRead,
          '12': data.id
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
      fullNameDest: data[0][8],
      emailDest: data[0][9],
      dateSend: data[0][10],
      dateRead: data[0][11]
    );
  } 
}