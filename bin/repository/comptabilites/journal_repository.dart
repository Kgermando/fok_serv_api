import 'package:postgres/postgres.dart';
 
import '../../models/comptabilites/journal_model.dart'; 

class JournalRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  JournalRepository(this.executor, this.tableName);

  Future<List<JournalModel>> getAllData() async {
    var data = <JournalModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(JournalModel.fromSQL(row));
    }
    return data.toList();
  }



  // Future<List<CourbeJournalModel>> getAllDataChartMounth() async {
  //   var data = <CourbeJournalModel>{};
  //   var querySQL =
  //     "SELECT EXTRACT(MONTH FROM \"created\" ::TIMESTAMP), SUM(\"montant_credit\" ::FLOAT) FROM $tableName WHERE \"created\" >= NOW() - '1 mons' :: INTERVAL GROUP BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(MONTH FROM \"created\" ::TIMESTAMP) ASC;";
  //   List<List<dynamic>> results = await executor.query(querySQL);
  //   for (var row in results) {
  //     data.add(CourbeJournalModel.fromSQL(row));
  //   }
  //   return data.toList();
  // }

  // Future<List<CourbeJournalModel>> getAllDataChartYear() async {
  //   var data = <CourbeJournalModel>{};
  //   var querySQL =
  //     "SELECT EXTRACT(YEAR FROM \"created\" ::TIMESTAMP), SUM(\"montant_credit\" ::FLOAT) FROM $tableName WHERE \"created\" >= NOW() - '1 years' :: INTERVAL GROUP BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ORDER BY EXTRACT(YEAR FROM \"created\" ::TIMESTAMP) ASC;";

  //   List<List<dynamic>> results = await executor.query(querySQL);
  //   for (var row in results) {
  //     data.add(CourbeJournalModel.fromSQL(row));
  //   }
  //   return data.toList();
  // }

  Future<void> insertData(JournalModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, numero_operation, libele,"
        "compte_debit, montant_debit, compte_credit, montant_credit,"
        "signature, created, locker)"
        "VALUES (nextval('journals_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9)",
        substitutionValues: {
          '1': data.numeroOperation,
          '2': data.libele,
          '3': data.compteDebit,
          '4': data.montantDebit,
          '5': data.compteCredit,
          '6': data.montantCredit,
          '7': data.signature,
          '8': data.created,
          '9': data.locker
        });
    });
  }

  Future<void> update(JournalModel data) async {
    await executor.query("""UPDATE $tableName
      SET numero_operation = @1, libele = @2, compte_debit = @3, montant_debit = @4,  
      compte_credit = @5, montant_credit = @6,
      signature = @7, created = @8, locker = @9 WHERE id = @10""",
      substitutionValues: {
        '1': data.numeroOperation,
        '2': data.libele,
        '3': data.compteDebit,
        '4': data.montantDebit,
        '5': data.compteCredit,
        '6': data.montantCredit,
        '7': data.signature,
        '8': data.created,
        '9': data.locker,
        '10': data.id
      }
    );
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

  Future<JournalModel> getFromId(int id) async {
    var data =
      await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return JournalModel(
      id: data[0][0],
      numeroOperation: data[0][1],
      libele: data[0][2],
      compteDebit: data[0][3],
      montantDebit: data[0][4],
      compteCredit: data[0][5],
      montantCredit: data[0][6],
      signature: data[0][7],
      created: data[0][8],
      locker: data[0][9]
    );
  }
}
