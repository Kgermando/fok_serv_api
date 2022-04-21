import 'package:postgres/postgres.dart';

import '../../models/logistiques/anguin_model.dart';

class AnguinRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AnguinRepository(this.executor, this.tableName);

  Future<List<AnguinModel>> getAllData() async {
    var data = <AnguinModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AnguinModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AnguinModel anguinModel) async {
    var nom = anguinModel.nom;
    var modele = anguinModel.modele;
    var marque = anguinModel.marque;
    var numeroChassie = anguinModel.numeroChassie;
    var couleur = anguinModel.couleur;
    var genre = anguinModel.genre;
    var qtyMaxReservoir = anguinModel.qtyMaxReservoir;
    var dateFabrication = anguinModel.dateFabrication;
    var nomeroPLaque = anguinModel.nomeroPLaque;
    var nomeroEntreprise = anguinModel.nomeroEntreprise;
    var kilometrageInitiale = anguinModel.kilometrageInitiale;
    var provenance = anguinModel.provenance;
    var typeCaburant = anguinModel.typeCaburant;
    var typeMoteur = anguinModel.typeMoteur;
    var approbationDG = anguinModel.approbationDG;
    var signatureDG = anguinModel.signatureDG;
    var signatureJustificationDG =
        anguinModel.signatureJustificationDG;

    var approbationFin = anguinModel.approbationFin;
    var signatureFin = anguinModel.signatureFin;
    var signatureJustificationFin =
        anguinModel.signatureJustificationFin;

    var approbationBudget = anguinModel.approbationBudget;
    var signatureBudget = anguinModel.signatureBudget;
    var signatureJustificationBudget =
        anguinModel.signatureJustificationBudget;

    var approbationDD = anguinModel.approbationDD;
    var signatureDD = anguinModel.signatureDD;
    var signatureJustificationDD =
        anguinModel.signatureJustificationDD;

    var signature = anguinModel.signature;
    var created = anguinModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('anguins_id_seq'), '$nom',"
        "'$modele', '$marque', '$numeroChassie', '$couleur', '$genre', '$qtyMaxReservoir',"
        "'$dateFabrication', '$nomeroPLaque', '$nomeroEntreprise', '$kilometrageInitiale', '$provenance',"
        "'$typeCaburant', '$typeMoteur',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature', '$created');");
    });
  }


  
  Future<void> update(AnguinModel anguinModel) async {
    var id = anguinModel.id;
    var nom = anguinModel.nom;
    var modele = anguinModel.modele;
    var marque = anguinModel.marque;
    var numeroChassie = anguinModel.numeroChassie;
    var couleur = anguinModel.couleur;
    var genre = anguinModel.genre;
    var qtyMaxReservoir = anguinModel.qtyMaxReservoir;
    var dateFabrication = anguinModel.dateFabrication;
    var nomeroPLaque = anguinModel.nomeroPLaque;
    var nomeroEntreprise = anguinModel.nomeroEntreprise;
    var kilometrageInitiale = anguinModel.kilometrageInitiale;
    var provenance = anguinModel.provenance;
    var typeCaburant = anguinModel.typeCaburant;
    var typeMoteur = anguinModel.typeMoteur;
     var approbationDG = anguinModel.approbationDG;
    var signatureDG = anguinModel.signatureDG;
    var signatureJustificationDG = anguinModel.signatureJustificationDG;

    var approbationFin = anguinModel.approbationFin;
    var signatureFin = anguinModel.signatureFin;
    var signatureJustificationFin = anguinModel.signatureJustificationFin;

    var approbationBudget = anguinModel.approbationBudget;
    var signatureBudget = anguinModel.signatureBudget;
    var signatureJustificationBudget = anguinModel.signatureJustificationBudget;

    var approbationDD = anguinModel.approbationDD;
    var signatureDD = anguinModel.signatureDD;
    var signatureJustificationDD = anguinModel.signatureJustificationDD;

    var signature = anguinModel.signature;
    var created = anguinModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"modele\"='$modele',"
        "\"marque\"='$marque', \"numeroChassie\"='$numeroChassie', \"couleur\"='$couleur',"
        "\"genre\"='$genre', \"qtyMaxReservoir\"='$qtyMaxReservoir', \"rodateFabricationle\"='$dateFabrication',"
        "\"nomeroPLaque\"='$nomeroPLaque', \"nomeroEntreprise\"='$nomeroEntreprise', \"kilometrageInitiale\"='$kilometrageInitiale',"
        "\"provenance\"='$provenance'"
        "\"typeCaburant\"='$typeCaburant', \"typeMoteur\"='$typeMoteur',"
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

  Future<AnguinModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AnguinModel(
      id: data[0][0],
      nom: data[0][1],
      modele: data[0][2],
      marque: data[0][3],
      numeroChassie: data[0][4],
      couleur: data[0][5],
      genre: data[0][6],
      qtyMaxReservoir: data[0][7],
      dateFabrication: data[0][8],
      nomeroPLaque: data[0][9],
      nomeroEntreprise: data[0][10],
      kilometrageInitiale: data[0][11],
      provenance: data[0][12],
      typeCaburant: data[0][13],
      typeMoteur: data[0][14],
      approbationDG: data[0][15],
      signatureDG: data[0][16],
      signatureJustificationDG: data[0][17],
      approbationFin: data[0][18],
      signatureFin: data[0][19],
      signatureJustificationFin: data[0][20],
      approbationBudget: data[0][21],
      signatureBudget: data[0][22],
      signatureJustificationBudget: data[0][23],
      approbationDD: data[0][24],
      signatureDD: data[0][25],
      signatureJustificationDD: data[0][26],
      signature: data[0][27],
      created: data[0][28]
    );
  }
}