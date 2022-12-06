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

  // Future<List<BalanceSumModel>> getAllSumData() async {
  //   var data = <BalanceSumModel>{};
  //   var querySQL =
  //     """SELECT "nom_ligne_budgetaire",
  //       SUM(cout_total::FLOAT),
  //       SUM(caisse::FLOAT),
  //       SUM(banque::FLOAT),
  //       SUM(fin_exterieur::FLOAT)
  //       FROM $tableName where 
  //       NOW() <= "periode_fin" GROUP BY "nom_ligne_budgetaire";""";
  //   List<List<dynamic>> results = await executor.query(querySQL);
  //   for (var row in results) {
  //     data.add(BalanceSumModel.fromSQL(row));
  //   }
  //   return data.toList();
  // }

  Future<void> insertData(LigneBudgetaireModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom_ligne_budgetaire, departement,"
          "periode_budget_debut, periode_budget_fin, unite_choisie, nombre_unite,"
          "cout_unitaire, cout_total,"
          "caisse, banque, fin_exterieur, signature, created, reference,"
          "caisse_sortie, banque_sortie, fin_exterieur_sortie)"
          "VALUES (nextval('ligne_budgetaires_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17)",
          substitutionValues: {
            '1': data.nomLigneBudgetaire,
            '2': data.departement,
            '3': data.periodeBudgetDebut,
            '4': data.periodeBudgetFin,
            '5': data.uniteChoisie,
            '6': data.nombreUnite,
            '7': data.coutUnitaire,
            '8': data.coutTotal,
            '9': data.caisse,
            '10': data.banque,
            '11': data.finExterieur,
            '12': data.signature,
            '13': data.created,
            '14': data.reference,
            '15': data.caisseSortie,
            '16': data.banqueSortie,
            '17': data.finExterieurSortie
          });
    });
  }

  Future<void> update(LigneBudgetaireModel data) async {
    await executor.query("""UPDATE $tableName
        SET nom_ligne_budgetaire = @1, departement = @2, periode_budget_debut = @3, 
        periode_budget_fin = @4, unite_choisie = @5, nombre_unite = @6,
        cout_unitaire = @7, cout_total = @8, caisse = @9, banque = @10, 
        fin_exterieur = @11, signature = @12, created = @13, reference = @14, 
        caisse_sortie = @15, banque_sortie = @16, fin_exterieur_sortie = @17 WHERE id = @18""", 
      substitutionValues: {
        '1': data.nomLigneBudgetaire,
        '2': data.departement,
        '3': data.periodeBudgetDebut,
        '4': data.periodeBudgetFin,
        '5': data.uniteChoisie,
        '6': data.nombreUnite,
        '7': data.coutUnitaire,
        '8': data.coutTotal,
        '9': data.caisse,
        '10': data.banque,
        '11': data.finExterieur,
        '12': data.signature,
        '13': data.created,
        '14': data.reference, 
        '15': data.caisseSortie,
        '16': data.banqueSortie,
        '17': data.finExterieurSortie,
        '18': data.id
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
      periodeBudgetDebut: data[0][3],
      periodeBudgetFin: data[0][4],
      uniteChoisie: data[0][5],
      nombreUnite: data[0][6],
      coutUnitaire: data[0][7],
      coutTotal: data[0][8],
      caisse: data[0][9],
      banque: data[0][10],
      finExterieur: data[0][11],
      signature: data[0][12],
      created: data[0][13],
      reference: data[0][14],
      caisseSortie: data[0][15],
      banqueSortie: data[0][16],
      finExterieurSortie: data[0][17]
    );
  }
}
