import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/annuaire_model.dart';

class AnnuaireReposiotry {
  final PostgreSQLConnection executor;
  final String tableName;

  AnnuaireReposiotry(this.executor, this.tableName);


  Future<List<AnnuaireModel>> getAllData() async {
    var data = <AnnuaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AnnuaireModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<AnnuaireModel>> getAllDataSearch(String query) async {
    var data = <AnnuaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AnnuaireModel.fromSQL(row));
    }
    return data.toList().where((value) {
      final categorieLower = value.categorie.toLowerCase();
      final nomPostnomPrenomLower = value.nomPostnomPrenom.toLowerCase();
      final mobile1Lower = value.mobile1.toLowerCase();
      final mobile2Lower = value.mobile2.toLowerCase();
      final secteurActiviteLower = value.secteurActivite.toLowerCase();
      final searchLower = query.toLowerCase();
      return categorieLower.contains(searchLower) ||
          nomPostnomPrenomLower.contains(searchLower) ||
          mobile1Lower.contains(searchLower) ||
          mobile2Lower.contains(searchLower) ||
          secteurActiviteLower.contains(searchLower);
    }).toList();
  }

  Future<void> insertData(AnnuaireModel data) async {
    var categorie = data.categorie;
    var nomPostnomPrenom = data.nomPostnomPrenom;
    var email = data.email;
    var mobile1 = data.mobile1;
    var mobile2 = data.mobile2;
    var secteurActivite = data.secteurActivite;
    var nomEntreprise = data.nomEntreprise;
    var grade = data.grade;
    var adresseEntreprise = data.adresseEntreprise;

    var approbationDG = data.approbationDG;
    var signatureDG = data.signatureDG;
    var signatureJustificationDG =
        data.signatureJustificationDG;

    var approbationFin = data.approbationFin;
    var signatureFin = data.signatureFin;
    var signatureJustificationFin = data.signatureJustificationFin;

    var approbationBudget = data.approbationBudget;
    var signatureBudget = data.signatureBudget;
    var signatureJustificationBudget =
        data.signatureJustificationBudget;

    var approbationDD = data.approbationDD;
    var signatureDD = data.signatureDD;
    var signatureJustificationDD =
        data.signatureJustificationDD;

    var signature = data.signature;
    var created = data.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('annuaires_id_seq'), '$categorie',"
        "'$nomPostnomPrenom','$email','$mobile1', '$mobile2', '$secteurActivite',"
        "'$nomEntreprise','$grade','$adresseEntreprise',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(AnnuaireModel data) async {
    var id = data.id;
    var categorie = data.categorie;
    var nomPostnomPrenom = data.nomPostnomPrenom;
    var email = data.email;
    var mobile1 = data.mobile1;
    var mobile2 = data.mobile2;
    var secteurActivite = data.secteurActivite;
    var nomEntreprise = data.nomEntreprise;
    var grade = data.grade;
    var adresseEntreprise = data.adresseEntreprise;

    var approbationDG = data.approbationDG;
    var signatureDG = data.signatureDG;
    var signatureJustificationDG =
        data.signatureJustificationDG;

    var approbationFin = data.approbationFin;
    var signatureFin = data.signatureFin;
    var signatureJustificationFin = data.signatureJustificationFin;

    var approbationBudget = data.approbationBudget;
    var signatureBudget = data.signatureBudget;
    var signatureJustificationBudget =
        data.signatureJustificationBudget;

    var approbationDD = data.approbationDD;
    var signatureDD = data.signatureDD;
    var signatureJustificationDD =
        data.signatureJustificationDD;

    var signature = data.signature;
    var created = data.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"categorie\"='$categorie', "
          "\"nomPostnomPrenom\"='$nomPostnomPrenom',\"email\"='$email',"
          "\"mobile1\"='$mobile1', \"mobile2\"='$mobile2', \"secteurActivite\"='$secteurActivite',"
          "\"nomEntreprise\"='$nomEntreprise', \"grade\"='$grade', \"adresseEntreprise\"='$adresseEntreprise',"
          "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
          "\"signatureJustificationDG\"='$signatureJustificationDG',"
          "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
          "\"signatureJustificationFin\"='$signatureJustificationFin',"
          "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
          "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
          "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
          "\"signatureJustificationDD\"='$signatureJustificationDD',"
          "\"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
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

  Future<AnnuaireModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AnnuaireModel(
      id: data[0][0],
      categorie: data[0][1],
      nomPostnomPrenom: data[0][2],
      email: data[0][3],
      mobile1: data[0][4],
      mobile2: data[0][5],
      secteurActivite: data[0][6],
      nomEntreprise: data[0][7],
      grade: data[0][8],
      adresseEntreprise: data[0][9],
      approbationDG: data[0][10],
      signatureDG: data[0][11],
      signatureJustificationDG: data[0][12],
      approbationFin: data[0][13],
      signatureFin: data[0][14],
      signatureJustificationFin: data[0][15],
      approbationBudget: data[0][16],
      signatureBudget: data[0][17],
      signatureJustificationBudget: data[0][18],
      approbationDD: data[0][19],
      signatureDD: data[0][20],
      signatureJustificationDD: data[0][21],
      signature: data[0][22],
      created: data[0][23]
    );
  } 
}