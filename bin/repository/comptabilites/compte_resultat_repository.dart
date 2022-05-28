import 'package:postgres/postgres.dart';

import '../../models/comptabilites/compte_resultat_model.dart';

class CompteResultatRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CompteResultatRepository(this.executor, this.tableName);

  Future<List<CompteResulatsModel>> getAllData() async {
    var data = <CompteResulatsModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CompteResulatsModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CompteResulatsModel compteResulatsModel) async {
    var intitule = compteResulatsModel.intitule;


    var achatMarchandises = compteResulatsModel.achatMarchandises;
    var variationStockMarchandises = compteResulatsModel.variationStockMarchandises;
    var achatApprovionnements = compteResulatsModel.achatApprovionnements;
    var variationApprovionnements = compteResulatsModel.variationApprovionnements;
    var autresChargesExterne = compteResulatsModel.autresChargesExterne;
    var impotsTaxesVersementsAssimiles = compteResulatsModel.impotsTaxesVersementsAssimiles;
    var renumerationPersonnel = compteResulatsModel.renumerationPersonnel;
    var chargesSocialas = compteResulatsModel.chargesSocialas;
    var dotatiopnsProvisions = compteResulatsModel.dotatiopnsProvisions;
    var autresCharges = compteResulatsModel.autresCharges;
    var chargesfinancieres = compteResulatsModel.chargesfinancieres;
    var chargesExptionnelles = compteResulatsModel.chargesExptionnelles;
    var impotSurbenefices = compteResulatsModel.impotSurbenefices;
    var soldeCrediteur = compteResulatsModel.soldeCrediteur;
    var ventesMarchandises = compteResulatsModel.ventesMarchandises;
    var productionVendueBienEtSerices = compteResulatsModel.productionVendueBienEtSerices;
    var productionStockee = compteResulatsModel.productionStockee;
    var productionImmobilisee = compteResulatsModel.productionImmobilisee;
    var subventionExploitation = compteResulatsModel.subventionExploitation;
    var autreProduits = compteResulatsModel.autreProduits;
    var montantExportation = compteResulatsModel.montantExportation;
    var produitfinancieres = compteResulatsModel.produitfinancieres;
    var produitExceptionnels = compteResulatsModel.produitExceptionnels;
    var soldeDebiteur = compteResulatsModel.soldeDebiteur;

    var signature = compteResulatsModel.signature;
    var created = compteResulatsModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('comptes_resultat_id_seq'), '$intitule',"
        "'$achatMarchandises','$variationStockMarchandises',"
        "'$achatApprovionnements','$variationApprovionnements',"
        "'$autresChargesExterne','$impotsTaxesVersementsAssimiles',"
        "'$renumerationPersonnel','$chargesSocialas',"
        "'$dotatiopnsProvisions', '$autresCharges',  '$chargesfinancieres',"
        "'$chargesExptionnelles','$impotSurbenefices',"
        "'$soldeCrediteur','$ventesMarchandises',"
        "'$productionVendueBienEtSerices','$productionStockee',"
        "'$productionImmobilisee','$subventionExploitation',"
        "'$autreProduits','$montantExportation', '$produitfinancieres',"
        "'$produitExceptionnels','$soldeDebiteur',"
        "'$signature','$created');");
    });
  }

  Future<void> update(CompteResulatsModel compteResulatsModel) async {
    var id = compteResulatsModel.id;
    var intitule = compteResulatsModel.intitule;

    var achatMarchandises = compteResulatsModel.achatMarchandises;
    var variationStockMarchandises =
        compteResulatsModel.variationStockMarchandises;
    var achatApprovionnements = compteResulatsModel.achatApprovionnements;
    var variationApprovionnements =
        compteResulatsModel.variationApprovionnements;
    var autresChargesExterne = compteResulatsModel.autresChargesExterne;
    var impotsTaxesVersementsAssimiles =
        compteResulatsModel.impotsTaxesVersementsAssimiles;
    var renumerationPersonnel = compteResulatsModel.renumerationPersonnel;
    var chargesSocialas = compteResulatsModel.chargesSocialas;
    var dotatiopnsProvisions = compteResulatsModel.dotatiopnsProvisions;
    var autresCharges = compteResulatsModel.autresCharges;
    var chargesfinancieres = compteResulatsModel.chargesfinancieres;
    var chargesExptionnelles = compteResulatsModel.chargesExptionnelles;
    var impotSurbenefices = compteResulatsModel.impotSurbenefices;
    var soldeCrediteur = compteResulatsModel.soldeCrediteur;

    var ventesMarchandises = compteResulatsModel.ventesMarchandises;
    var productionVendueBienEtSerices =
        compteResulatsModel.productionVendueBienEtSerices;
    var productionStockee = compteResulatsModel.productionStockee;
    var productionImmobilisee = compteResulatsModel.productionImmobilisee;
    var subventionExploitation = compteResulatsModel.subventionExploitation;
    var autreProduits = compteResulatsModel.autreProduits;
    var montantExportation = compteResulatsModel.montantExportation;
    var produitfinancieres = compteResulatsModel.produitfinancieres;

    var produitExceptionnels = compteResulatsModel.produitExceptionnels;
    var soldeDebiteur = compteResulatsModel.soldeDebiteur;

    var signature = compteResulatsModel.signature;
    var created = compteResulatsModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"intitule\"='$intitule', "
        "\"achatMarchandises\"='$achatMarchandises', \"variationStockMarchandises\"='$variationStockMarchandises',"
        "\"achatApprovionnements\"='$achatApprovionnements', \"variationApprovionnements\"='$variationApprovionnements',"
        "\"autresChargesExterne\"='$autresChargesExterne', \"impotsTaxesVersementsAssimiles\"='$impotsTaxesVersementsAssimiles',"
        "\"renumerationPersonnel\"='$renumerationPersonnel', \"chargesSocialas\"='$chargesSocialas',"
        "\"dotatiopnsProvisions\"='$dotatiopnsProvisions', \"autresCharges\"='$autresCharges',"
        "\"chargesfinancieres\"='$chargesfinancieres',"
        "\"chargesExptionnelles\"='$chargesExptionnelles', \"impotSurbenefices\"='$impotSurbenefices',"
        "\"soldeCrediteur\"='$soldeCrediteur', \"ventesMarchandises\"='$ventesMarchandises',"
        "\"productionVendueBienEtSerices\"='$productionVendueBienEtSerices', \"productionStockee\"='$productionStockee',"
        "\"productionImmobilisee\"='$productionImmobilisee', \"subventionExploitation\"='$subventionExploitation',"
        "\"autreProduits\"='$autreProduits', \"montantExportation\"='$montantExportation',"
        "\"produitfinancieres\"='$produitfinancieres',"
        "\"produitExceptionnels\"='$produitExceptionnels', \"soldeDebiteur\"='$soldeDebiteur',"
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

  Future<CompteResulatsModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CompteResulatsModel(
      id: data[0][0],
      intitule: data[0][1],
      achatMarchandises: data[0][2],
      variationStockMarchandises: data[0][3],
      achatApprovionnements: data[0][4],
      variationApprovionnements: data[0][5],
      autresChargesExterne: data[0][6],
      impotsTaxesVersementsAssimiles: data[0][7],
      renumerationPersonnel: data[0][8],
      chargesSocialas: data[0][9],
      dotatiopnsProvisions: data[0][10],
      autresCharges: data[0][11],
      chargesfinancieres: data[0][12],
      chargesExptionnelles: data[0][13],
      impotSurbenefices: data[0][14],
      soldeCrediteur: data[0][15],
      ventesMarchandises: data[0][16],
      productionVendueBienEtSerices: data[0][17],
      productionStockee: data[0][18],
      productionImmobilisee: data[0][19],
      subventionExploitation: data[0][20],
      autreProduits: data[0][21],
      montantExportation: data[0][22],
      produitfinancieres: data[0][23],
      produitExceptionnels: data[0][24],
      soldeDebiteur: data[0][25],
      signature: data[0][26],
      created: data[0][27]
    );
  } 
}