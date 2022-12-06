import 'package:postgres/postgres.dart';

import '../../models/charts/pie_chart_model.dart';
import '../../models/logistiques/material_model.dart';


class MaterielRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  MaterielRepository(this.executor, this.tableName);

  Future<List<MaterielModel>> getAllData() async {
    var data = <MaterielModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(MaterielModel.fromSQL(row));
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

  Future<void> insertData(MaterielModel data) async { 
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, type_materiel, marque, modele,"
        "numero_ref, couleur, genre, qty_max_reservoir, date_fabrication, numero_plaque,"
        "identifiant, kilometrage_initiale, fournisseur, alimentation, signature, created,"
        "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
        "VALUES (nextval('materiels_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20, @21)",
        substitutionValues: {
          '1': data.typeMateriel, 
          '2': data.marque,
          '3': data.modele,
          '4': data.numeroRef,
          '5': data.couleur,
          '6': data.genre,
          '7': data.qtyMaxReservoir,
          '8': data.dateFabrication,
          '9': data.numeroPLaque,
          '10': data.identifiant,
          '11': data.kilometrageInitiale,
          '12': data.fournisseur,
          '13': data.alimentation,
          '14': data.signature,
          '15': data.created,
          '16': data.approbationDG,
          '17': data.motifDG,
          '18': data.signatureDG,
          '19': data.approbationDD,
          '20': data.motifDD,
          '21': data.signatureDD 
        });
    });
  }


  
  Future<void> update(MaterielModel data) async {
    await executor.execute("""UPDATE $tableName
      SET type_materiel = @1, marque = @2, modele = @3, numero_ref = @4,
      couleur = @5, genre = @6, qty_max_reservoir = @7, date_fabrication = @8,
      numero_plaque = @9, identifiant = @10, kilometrage_initiale = @11,
      fournisseur = @12, alimentation = @13, signature = @14,
      created = @15, approbation_dg = @16, motif_dg = @17, signature_dg = @18,
      approbation_dd = @19, motif_dd = @20, signature_dd = @21 WHERE id = @22""",
      substitutionValues: {
        '1': data.typeMateriel,
        '2': data.marque,
        '3': data.modele,
        '4': data.numeroRef,
        '5': data.couleur,
        '6': data.genre,
        '7': data.qtyMaxReservoir,
        '8': data.dateFabrication,
        '9': data.numeroPLaque,
        '10': data.identifiant,
        '11': data.kilometrageInitiale,
        '12': data.fournisseur,
        '13': data.alimentation,
        '14': data.signature,
        '15': data.created,
        '16': data.approbationDG,
        '17': data.motifDG,
        '18': data.signatureDG,
        '19': data.approbationDD,
        '20': data.motifDD,
        '21': data.signatureDD,
        '22': data.id
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

  Future<MaterielModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return MaterielModel(
      id: data[0][0],
      typeMateriel: data[0][1],
      marque: data[0][2],
      modele: data[0][3],
      numeroRef: data[0][4],
      couleur: data[0][5],
      genre: data[0][6],
      qtyMaxReservoir: data[0][7],
      dateFabrication: data[0][8],
      numeroPLaque: data[0][9],
      identifiant: data[0][10],
      kilometrageInitiale: data[0][11],
      fournisseur: data[0][12],
      alimentation: data[0][13],
      signature: data[0][14],
      created: data[0][15],
      approbationDG: data[0][16],
      motifDG: data[0][17],
      signatureDG: data[0][18],
      approbationDD: data[0][19],
      motifDD: data[0][20],
      signatureDD: data[0][21] 
    );
  }
}