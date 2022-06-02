import 'package:postgres/postgres.dart';

import '../../models/logistiques/carburant_model.dart';

class CarburantRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CarburantRepository(this.executor, this.tableName);

  Future<List<CarburantModel>> getAllData() async {
    var data = <CarburantModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CarburantModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CarburantModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, operation_entre_sortie, type_caburant,"
        "fournisseur, nomero_facture_achat, prix_achat_par_litre,"
        "nom_receptioniste, numero_plaque, date_heure_sortie_anguin,"
        "qty_achat, signature, created)"
        "VALUES (nextval('carburants_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11)",
        substitutionValues: {
          '1': data.operationEntreSortie,
          '2': data.typeCaburant,
          '3': data.fournisseur,
          '4': data.nomeroFactureAchat,
          '5': data.prixAchatParLitre,
          '6': data.nomReceptioniste,
          '7': data.numeroPlaque,
          '8': data.dateHeureSortieAnguin,
          '9': data.qtyAchat,
          '10': data.signature,
          '11': data.created
        });
    });
  }

  Future<void> update(CarburantModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET operation_entre_sortie = @1, type_caburant = @2, fournisseur = @3,"
        "nomero_facture_achat = @4, prix_achat_par_litre = @5, nom_receptioniste = @6,"
        "numero_plaque = @7, date_heure_sortie_anguin = @8, qty_achat = @9,"
        "signature = @10, created = @11 WHERE id = @12",
        substitutionValues: {
          '1': data.operationEntreSortie,
          '2': data.typeCaburant,
          '3': data.fournisseur,
          '4': data.nomeroFactureAchat,
          '5': data.prixAchatParLitre,
          '6': data.nomReceptioniste,
          '7': data.numeroPlaque,
          '8': data.dateHeureSortieAnguin,
          '9': data.qtyAchat,
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

  Future<CarburantModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CarburantModel(
      id: data[0][0],
      operationEntreSortie: data[0][1],
      typeCaburant: data[0][2],
      fournisseur: data[0][3],
      nomeroFactureAchat: data[0][4],
      prixAchatParLitre: data[0][5],
      nomReceptioniste: data[0][6],
      numeroPlaque: data[0][7],
      dateHeureSortieAnguin: data[0][8],
      qtyAchat: data[0][9],
      signature: data[0][10],
      created: data[0][11]
    );
  }




  
}