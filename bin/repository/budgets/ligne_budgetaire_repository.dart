import 'package:postgres/postgres.dart';

import '../../models/budgets/ligne_budgetaire_model.dart';

class LigneBudgtaireRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  LigneBudgtaireRepository(this.executor, this.tableName);

 
  Future<List<LigneBudgetaireModel>> getAllData() async {
    var data = <LigneBudgetaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(LigneBudgetaireModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(LigneBudgetaireModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom_ligne_budgetaire, departement,"
          "periode_budget, unite_choisie, nombre_unite, cout_unitaire, cout_total,"
          "caisse, banque, fin_propre, fin_exterieur, signature, created)"
          "VALUES (nextval('ligne_budgetaires_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13)",
          substitutionValues: {
            '1': data.nomLigneBudgetaire,
            '2': data.departement,
            '3': data.periodeBudget,
            '4': data.uniteChoisie,
            '5': data.nombreUnite,
            '6': data.coutUnitaire,
            '7': data.coutTotal,
            '8': data.caisse,
            '9': data.banque,
            '10': data.finPropre,
            '11': data.finExterieur,
            '12': data.signature,
            '13': data.created
          });
    });
  }

  Future<void> update(LigneBudgetaireModel data) async {
    await executor.query("""UPDATE $tableName
          SET nom_ligne_budgetaire = @1, departement = @2, periode_budget = @3,
          unite_choisie = @4, nombre_unite = @5, cout_unitaire = @6, cout_total = @7,
          caisse = @8, banque = @9, fin_propre = @10, fin_exterieur = @11,
          signature = @12, created = @13 WHERE id = @14""",
        substitutionValues: {
          '1': data.nomLigneBudgetaire,
          '2': data.departement,
          '3': data.periodeBudget,
          '4': data.uniteChoisie,
          '5': data.nombreUnite,
          '6': data.coutUnitaire,
          '7': data.coutTotal,
          '8': data.caisse,
          '9': data.banque,
          '10': data.finPropre,
          '11': data.finExterieur,
          '12': data.signature,
          '13': data.created,
          '14': data.id
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

  Future<LigneBudgetaireModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return LigneBudgetaireModel(
      id: data[0][0],
      nomLigneBudgetaire: data[0][1],
      departement: data[0][2],
      periodeBudget: data[0][3],
      uniteChoisie: data[0][4],
      nombreUnite: data[0][5],
      coutUnitaire: data[0][6],
      coutTotal: data[0][7],
      caisse: data[0][8],
      banque: data[0][9],
      finPropre: data[0][10],
      finExterieur: data[0][11],
      signature: data[0][12],
      created: data[0][13]
    );
  } 
}