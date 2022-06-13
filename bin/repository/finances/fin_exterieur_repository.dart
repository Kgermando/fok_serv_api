import 'package:postgres/postgres.dart';

import '../../models/finances/fin_exterieur_model.dart';

class FinExteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  FinExteRepository(this.executor, this.tableName);

  Future<List<FinanceExterieurModel>> getAllData() async {
    var data = <FinanceExterieurModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(FinanceExterieurModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(FinanceExterieurModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom_complet, piece_justificative,"
        "libelle, montant, type_operation, numero_operation, signature,"
        "created_ref, created)"
        "VALUES (nextval('fin_exterieurs_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9)",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.typeOperation,
          '6': data.numeroOperation,
          '7': data.signature,
          '8': data.createdRef,
          '9': data.created
        });
    });
  }

  Future<void> update(FinanceExterieurModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        """UPDATE $tableName
        SET nom_complet = @1, piece_justificative = @2, libelle = @3,
        montant = @4, type_operation = @5, numero_operation = @6,
        signature = @7, created_ref = @8, created = @9 WHERE id = @10""",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.typeOperation,
          '6': data.numeroOperation,
          '7': data.signature,
          '8': data.createdRef,
          '9': data.created,
          '10': data.id
        });
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

  Future<FinanceExterieurModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return FinanceExterieurModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        libelle: data[0][3],
        montant: data[0][4],
        typeOperation: data[0][5],
        numeroOperation: data[0][6],
        signature: data[0][7],
        createdRef: data[0][8],
        created: data[0][9]
    );
  } 
  
}