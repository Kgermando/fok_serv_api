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
          "caisse, banque, fin_exterieur, signature, created)"
          "VALUES (nextval('ligne_budgetaires_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12)",
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
            '10': data.finExterieur,
            '11': data.signature,
            '12': data.created
          });
    });
  }

  Future<void> update(LigneBudgetaireModel data) async {
    await executor.query("""UPDATE $tableName
          SET nom_ligne_budgetaire = @1, departement = @2, periode_budget = @3,
          unite_choisie = @4, nombre_unite = @5, cout_unitaire = @6, cout_total = @7,
          caisse = @8, banque = @9, fin_exterieur = @10, signature = @11,
          created = @12 WHERE id = @13""",
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
          '10': data.finExterieur,
          '11': data.signature,
          '12': data.created,
          '13': data.id
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
      finExterieur: data[0][10],
      signature: data[0][11],
      created: data[0][12]
    );
  } 
}