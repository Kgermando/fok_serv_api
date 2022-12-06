import 'package:postgres/postgres.dart';

import '../../models/logistiques/approvision_reception_model.dart';
 

class ApprovisionReceptionRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ApprovisionReceptionRepository(this.executor, this.tableName);

  Future<List<ApprovisionReceptionModel>> getAllData() async {
    var data = <ApprovisionReceptionModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ApprovisionReceptionModel.fromSQL(row));
    }
    return data.toList();
  }
 

  Future<void> insertData(ApprovisionReceptionModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, provision, departement, quantity, unite,"
        "signature_livraison, created, accuse_reception, signature_reception,"
        "created_reception, livraison_annuler, reference)"
        "VALUES (nextval('approvision_receptions_id_seq'), @1, @2, @3, @4, @5,"
        "@6, @7, @8, @9, @10, @11)",
        substitutionValues: {
          '1': data.provision,
          '2': data.departement,
          '3': data.quantity,
          '4': data.unite,
          '5': data.signatureLivraison,
          '6': data.created,
          '7': data.accuseReception,
          '8': data.signatureReception,
          '9': data.createdReception,
          '10': data.livraisonAnnuler,
          '11': data.reference
        });
    });
  }


  
  Future<void> update(ApprovisionReceptionModel data) async {
    await executor.execute("""UPDATE $tableName
      SET provision = @1, departement = @2, quantity = @3, unite = @4, signature_livraison = @5,
      created = @6, accuse_reception = @7, signature_reception = @8, 
      created_reception = @9, livraison_annuler = @10, reference = @11 WHERE id = @12""",
        substitutionValues: {
          '1': data.provision,
          '2': data.departement,
          '3': data.quantity,
          '4': data.unite,
          '5': data.signatureLivraison,
          '6': data.created,
          '7': data.accuseReception,
          '8': data.signatureReception,
          '9': data.createdReception, 
          '10': data.livraisonAnnuler,
          '11': data.reference,
          '12': data.id
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

  Future<ApprovisionReceptionModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ApprovisionReceptionModel(
      id: data[0][0],
      provision: data[0][1],
      departement: data[0][2],
      quantity: data[0][3],
      unite: data[0][4],
      signatureLivraison: data[0][5],
      created: data[0][6],
      accuseReception: data[0][7],
      signatureReception: data[0][8],
      createdReception: data[0][9],
      livraisonAnnuler: data[0][10],
      reference: data[0][11] 
    );
  }
}