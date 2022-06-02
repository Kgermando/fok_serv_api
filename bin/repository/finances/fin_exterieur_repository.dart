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
        "libelle, montant, coupure_billet, ligne_budgetaire, ressource_fin,"
        "type_operation, numero_operation, signature, created)"
        "VALUES (nextval('fin_exterieurs_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11)",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.coupureBillet,
          '6': data.ligneBudgtaire,
          '7': data.typeOperation,
          '8': data.numeroOperation,
          '9': data.ressourceFin,
          '10': data.signature,
          '11': data.created
        });
    });
  }

  Future<void> update(FinanceExterieurModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET nom_complet = @1, piece_justificative = @2, libelle = @3,"
        "montant = @4, coupure_billet = @5, ligne_budgetaire = @6,"
        "ressource_fin = @9, type_operation = @7, numero_operation = @8,"
        "signature = @10, created = @11 WHERE id = @12",
        substitutionValues: {
          '1': data.nomComplet,
          '2': data.pieceJustificative,
          '3': data.libelle,
          '4': data.montant,
          '5': data.coupureBillet,
          '6': data.ligneBudgtaire,
          '7': data.typeOperation,
          '8': data.numeroOperation,
          '9': data.ressourceFin,
          '10': data.signature,
          '11': data.created,
          '12': data.id
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
        coupureBillet: data[0][5],
        ligneBudgtaire: data[0][6],
        typeOperation: data[0][7],
        numeroOperation: data[0][8],
        ressourceFin: data[0][9],
        signature: data[0][10],
        created: data[0][11]
    );
  } 
  
}