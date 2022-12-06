import 'package:postgres/postgres.dart';

import '../../models/logistiques/immobilier_model.dart';

class ImmobilierRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ImmobilierRepository(this.executor, this.tableName);

    Future<List<ImmobilierModel>> getAllData() async {
    var data = <ImmobilierModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ImmobilierModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ImmobilierModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
      "INSERT INTO $tableName (id, type_allocation, adresse, numero_certificat,"
      "superficie, date_acquisition, signature, created,"
      "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
      "VALUES (nextval('immobiliers_id_seq'), @1, @2, @3, @4, @5, @6, @7,"
      "@8, @9, @10, @11, @12, @13)",
          substitutionValues: {
            '1': data.typeAllocation,
            '2': data.adresse,
            '3': data.numeroCertificat,
            '4': data.superficie,
            '5': data.dateAcquisition,
            '6': data.signature,
            '7': data.created,
            '8': data.approbationDG,
            '9': data.motifDG,
            '10': data.signatureDG,
            '11': data.approbationDD,
            '12': data.motifDD,
            '13': data.signatureDD 
          });
    });
  }

  Future<void> update(ImmobilierModel data) async {
    await executor.execute("""UPDATE $tableName
        SET type_allocation = @1, adresse = @2, numero_certificat = @3,
        superficie = @4, date_acquisition = @5, signature = @6,
        created = @7, approbation_dg = @8, motif_dg = @9, signature_dg = @10,
        approbation_dd = @11, motif_dd = @12, signature_dd = @13 WHERE id = @14""",
    substitutionValues: {
      '1': data.typeAllocation,
      '2': data.adresse,
      '3': data.numeroCertificat,
      '4': data.superficie,
      '5': data.dateAcquisition,
      '6': data.signature,
      '7': data.created,
      '8': data.approbationDG,
      '9': data.motifDG,
      '10': data.signatureDG,
      '11': data.approbationDD,
      '12': data.motifDD,
      '13': data.signatureDD,
      '14': data.id
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

  Future<ImmobilierModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ImmobilierModel(
      id: data[0][0],
      typeAllocation: data[0][1],
      adresse: data[0][2],
      numeroCertificat: data[0][3],
      superficie: data[0][4],
      dateAcquisition: data[0][5],
      signature: data[0][6],
      created: data[0][7],
      approbationDG: data[0][8],
      motifDG: data[0][9],
      signatureDG: data[0][10],
      approbationDD: data[0][11],
      motifDD: data[0][12],
      signatureDD: data[0][13] 
    );
  }
}