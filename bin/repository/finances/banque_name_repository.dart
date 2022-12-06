import 'package:postgres/postgres.dart';

import '../../models/finances/banque_name_model.dart';
 

class BanqueNameRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BanqueNameRepository(this.executor, this.tableName);

  Future<List<BanqueNameModel>> getAllData() async {
    var data = <BanqueNameModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BanqueNameModel.fromSQL(row));
    }
    return data.toList();
  }

 
  Future<void> insertData(BanqueNameModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom_complet, rccm,"
        "id_nat, addresse, created)"
        "VALUES (nextval('banque_names_id_seq'), @1, @2, @3, @4, @5)",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.rccm,
          '3': data.idNat,
          '4': data.addresse,
          '5': data.created 
        });
    }); 
  }


  Future<void> update(BanqueNameModel data) async {
    await executor.query("""UPDATE $tableName
        SET nom_complet = @1, rccm = @2, id_nat = @3,
        addresse = @4, created = @5 WHERE id = @6""", substitutionValues: {
      '1': data.nomComplet,
      '2': data.rccm,
      '3': data.idNat,
      '4': data.addresse,
      '5': data.created,
      '6': data.id 
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

  Future<BanqueNameModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BanqueNameModel(
        id: data[0][0],
        nomComplet: data[0][1],
        rccm: data[0][2],
        idNat: data[0][3],
        addresse: data[0][4],
        created: data[0][5] 
    );
  } 
  
}