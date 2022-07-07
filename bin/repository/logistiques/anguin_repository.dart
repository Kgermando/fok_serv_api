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
          "SELECT genre, COUNT(genre) FROM $tableName GROUP BY \"genre\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartEnguinModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartEnguinModel;
    }
  }

  Future<void> insertData(AnguinModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom, modele, marque, numero_chassie,"
        "couleur, genre, qty_max_reservoir, date_fabrication, nomero_plaque,"
        "nomero_entreprise, kilometrage_initiale, provenance, type_caburant,"
        "type_moteur, signature, created_ref, created,"
        "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
        "VALUES (nextval('anguins_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20, @21, @22, @23)",
        substitutionValues: {
          '1': data.nom,
          '2': data.modele,
          '3': data.marque,
          '4': data.numeroChassie,
          '5': data.couleur,
          '6': data.genre,
          '7': data.qtyMaxReservoir,
          '8': data.dateFabrication,
          '9': data.nomeroPLaque,
          '10': data.nomeroEntreprise,
          '11': data.kilometrageInitiale,
          '12': data.provenance,
          '13': data.typeCaburant,
          '14': data.typeMoteur,
          '15': data.signature,
          '16': data.createdRef,
          '17': data.created,
          '18': data.approbationDG,
          '19': data.motifDG,
          '20': data.signatureDG,
          '21': data.approbationDD,
          '22': data.motifDD,
          '23': data.signatureDD
        });
    });
  }


  
  Future<void> update(AnguinModel data) async {
    await executor.execute("""UPDATE $tableName
        SET nom = @1, modele = @2, marque = @3, numero_chassie = @4, couleur = @5,
        genre = @6, qty_max_reservoir = @7, date_fabrication = @8, nomero_plaque = @9,
        nomero_entreprise = @10, kilometrage_initiale = @11, provenance = @12,
        type_caburant = @13, type_moteur = @14, signature = @15,
        created_ref = @16, created = @17, approbation_dg = @18, motif_dg = @19,
        signature_dg = @20, approbation_dd = @21,
        motif_dd = @22, signature_dd = @23 WHERE id = @24""",

        substitutionValues: {
          '1': data.nom,
          '2': data.modele,
          '3': data.marque,
          '4': data.numeroChassie,
          '5': data.couleur,
          '6': data.genre,
          '7': data.qtyMaxReservoir,
          '8': data.dateFabrication,
          '9': data.nomeroPLaque,
          '10': data.nomeroEntreprise,
          '11': data.kilometrageInitiale,
          '12': data.provenance,
          '13': data.typeCaburant,
          '14': data.typeMoteur,
          '15': data.signature,
          '16': data.created,
          '17': data.created,
          '18': data.approbationDG,
          '19': data.motifDG,
          '20': data.signatureDG,
          '21': data.approbationDD,
          '22': data.motifDD,
          '23': data.signatureDD,
          '24': data.id
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
      createdRef: data[0][16],
      created: data[0][17],
      approbationDG: data[0][18],
      motifDG: data[0][19],
      signatureDG: data[0][20],
      approbationDD: data[0][21],
      motifDD: data[0][22],
      signatureDD: data[0][23]
    );
  }
}