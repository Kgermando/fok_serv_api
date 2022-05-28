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

  Future<void> insertData(LigneBudgetaireModel ligneBudgetaireModel) async {
    var nomLigneBudgetaire = ligneBudgetaireModel.nomLigneBudgetaire;
    var departement = ligneBudgetaireModel.departement;
    var periodeBudget = ligneBudgetaireModel.periodeBudget;
    var uniteChoisie = ligneBudgetaireModel.uniteChoisie;
    var nombreUnite = ligneBudgetaireModel.nombreUnite;
    var coutUnitaire = ligneBudgetaireModel.coutUnitaire;
    var coutTotal = ligneBudgetaireModel.coutTotal;
    var caisse = ligneBudgetaireModel.caisse;
    var banque = ligneBudgetaireModel.banque;
    var finPropre = ligneBudgetaireModel.finPropre;
    var finExterieur = ligneBudgetaireModel.finExterieur;
    var signature = ligneBudgetaireModel.signature;
    var created = ligneBudgetaireModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('ligne_budgetaires_id_seq'), '$nomLigneBudgetaire',"
        "'$departement','$periodeBudget','$uniteChoisie', '$nombreUnite', '$coutUnitaire',"
        "'$coutTotal','$caisse','$banque', '$finPropre', '$finExterieur',"
        "'$signature', '$created');");
    });
  }

  Future<void> update(LigneBudgetaireModel ligneBudgetaireModel) async {
    var id = ligneBudgetaireModel.id;
    var nomLigneBudgetaire = ligneBudgetaireModel.nomLigneBudgetaire;
    var departement = ligneBudgetaireModel.departement;
    var periodeBudget = ligneBudgetaireModel.periodeBudget;
    var uniteChoisie = ligneBudgetaireModel.uniteChoisie;
    var nombreUnite = ligneBudgetaireModel.nombreUnite;
    var coutUnitaire = ligneBudgetaireModel.coutUnitaire;
    var coutTotal = ligneBudgetaireModel.coutTotal;
    var caisse = ligneBudgetaireModel.caisse;
    var banque = ligneBudgetaireModel.banque;
    var finPropre = ligneBudgetaireModel.finPropre;
    var finExterieur = ligneBudgetaireModel.finExterieur;
    var signature = ligneBudgetaireModel.signature;
    var created = ligneBudgetaireModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nomLigneBudgetaire\"='$nomLigneBudgetaire', \"departement\"='$departement',"
        "\"periodeBudget\"='$periodeBudget',\"uniteChoisie\"='$uniteChoisie',"
        "\"nombreUnite\"='$nombreUnite', \"coutUnitaire\"='$coutUnitaire',"
        "\"coutTotal\"='$coutTotal', \"caisse\"='$caisse', \"banque\"='$banque',"
        "\"finPropre\"='$finPropre', \"finExterieur\"='$finExterieur',"
        "\"signature\"='$signature' , \"created\"='$created' WHERE id=$id;");
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