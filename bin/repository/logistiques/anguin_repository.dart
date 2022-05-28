import 'package:postgres/postgres.dart';

import '../../models/charts/pie_chart_model.dart';
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

  Future<List<PieChartEnguinModel>> getChartPie() async {
    try {
      var data = <PieChartEnguinModel>{};

      var querySQL =
          "SELECT genre, COUNT(genre) FROM $tableName WHERE \"approbationDG\"='Approved' GROUP BY \"genre\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartEnguinModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartEnguinModel;
    }
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

    var signature = anguinModel.signature;
    var created = anguinModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('anguins_id_seq'), '$nom',"
        "'$modele', '$marque', '$numeroChassie', '$couleur', '$genre', '$qtyMaxReservoir',"
        "'$dateFabrication', '$nomeroPLaque', '$nomeroEntreprise', '$kilometrageInitiale', '$provenance',"
        "'$typeCaburant', '$typeMoteur',"
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

    var signature = anguinModel.signature;
    var created = anguinModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"modele\"='$modele',"
        "\"marque\"='$marque', \"numeroChassie\"='$numeroChassie', \"couleur\"='$couleur',"
        "\"genre\"='$genre', \"qtyMaxReservoir\"='$qtyMaxReservoir', \"rodateFabricationle\"='$dateFabrication',"
        "\"nomeroPLaque\"='$nomeroPLaque', \"nomeroEntreprise\"='$nomeroEntreprise',"
        "\"kilometrageInitiale\"='$kilometrageInitiale', \"provenance\"='$provenance',"
        "\"typeCaburant\"='$typeCaburant', \"typeMoteur\"='$typeMoteur',"
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
      signature: data[0][15],
      created: data[0][16]
    );
  }
}