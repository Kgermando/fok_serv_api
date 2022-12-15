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
        "libelle, montant_depot, type_operation, numero_operation, signature,"
        "reference, finance_exterieur_name, created, montant_retrait)"
        "VALUES (nextval('fin_exterieurs_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11)",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montantDepot,
          '5': data.typeOperation,
          '6': data.numeroOperation,
          '7': data.signature,
          '8': data.reference,
          '9': data.financeExterieurName,
          '10': data.created,
          '11': data.montantRetrait
        });
    });
  }

  Future<void> update(FinanceExterieurModel data) async {
    await executor.query("""UPDATE $tableName
        SET nom_complet = @1, piece_justificative = @2, libelle = @3,
        montant_depot = @4, type_operation = @5, numero_operation = @6,
        signature = @7, reference = @8, finance_exterieur_name = @9, created = @10, 
        montant_retrait = @11 WHERE id = @12""",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montantDepot,
          '5': data.typeOperation,
          '6': data.numeroOperation,
          '7': data.signature,
          '8': data.reference,
          '9': data.financeExterieurName,
          '10': data.created,
          '11': data.montantRetrait,
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

  Future<FinanceExterieurModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return FinanceExterieurModel(
        id: data[0][0],
        nomComplet: data[0][1],
        pieceJustificative: data[0][2],
        libelle: data[0][3],
        montantDepot: data[0][4],
        typeOperation: data[0][5],
        numeroOperation: data[0][6],
        signature: data[0][7],
        reference: data[0][8],
        financeExterieurName: data[0][9],
        created: data[0][10],
      montantRetrait: data[0][11]
    );
  } 
  
}