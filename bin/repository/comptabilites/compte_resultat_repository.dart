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

  Future<void> insertData(CompteResulatsModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, intitule, achat_marchandises,"
          "variation_stock_marchandises, achat_approvionnements, variation_approvionnements,"
          "autres_charges_externe, impots_taxes_versements_assimiles,"
          "renumeration_personnel, charges_socialas, dotatiopns_provisions,"
          "autres_charges, charges_financieres,"
          "charges_exptionnelles, impot_surbenefices, solde_crediteur,"
          "ventes_marchandises, production_vendue_bien_et_serices,"
          "production_stockee, production_immobilisee, subvention_exploitation,"
          "autre_produits, montant_exportation,"
          "produit_financieres, produit_exceptionnels, solde_debiteur, signature, created_ref, created,"
          "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
          "VALUES (nextval('comptes_resultat_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20,"
          "@21, @22, @23, @24, @25, @26, @27, @28, @29, @30, @31, @32, @33, @34)",
          substitutionValues: {
            '1': data.intitule,
            '2': data.achatMarchandises,
            '3': data.variationStockMarchandises,
            '4': data.achatApprovionnements,
            '5': data.variationApprovionnements,
            '6': data.autresChargesExterne,
            '7': data.impotsTaxesVersementsAssimiles,
            '8': data.renumerationPersonnel,
            '9': data.chargesSocialas,
            '10': data.dotatiopnsProvisions,
            '11': data.autresCharges,
            '12': data.chargesfinancieres,
            '13': data.chargesExptionnelles,
            '14': data.impotSurbenefices,
            '15': data.soldeCrediteur,
            '16': data.ventesMarchandises,
            '17': data.productionVendueBienEtSerices,
            '18': data.productionStockee,
            '19': data.productionImmobilisee,
            '20': data.subventionExploitation,
            '21': data.autreProduits,
            '22': data.montantExportation,
            '23': data.produitfinancieres,
            '24': data.produitExceptionnels,
            '25': data.soldeDebiteur,
            '26': data.signature,
            '27': data.createdRef,
            '28': data.created,
            '29': data.approbationDG,
            '30': data.motifDG,
            '31': data.signatureDG,
            '32': data.approbationDD,
            '33': data.motifDD,
            '34': data.signatureDD
          });
    });
  }

  Future<void> update(CompteResulatsModel data) async {
    await executor.query("""UPDATE $tableName
        SET intitule = @1, achat_marchandises = @2, variation_stock_marchandises = @3,
        achat_approvionnements = @4, variation_approvionnements = @5,
        autres_charges_externe = @6, impots_taxes_versements_assimiles = @7,
        renumeration_personnel = @8, charges_socialas = @9, dotatiopns_provisions = @10,
        autres_charges = @11, charges_financieres = @12, charges_exptionnelles = @13,
        impot_surbenefices = @14, solde_crediteur = @15, ventes_marchandises = @16,
        production_vendue_bien_et_serices = @17, production_stockee = @18,
        production_immobilisee = @19,
        subvention_exploitation = @20, autre_produits = @21, montant_exportation = @22,
        produit_financieres = @23, produit_exceptionnels = @24, solde_debiteur = @25,
        signature = @26, created_ref = @27 created = @28, approbation_dg = @29, motif_dg = @30,
        signature_dg = @31, approbation_dd = @32,
        motif_dd = @33, signature_dd = @34 WHERE id = @35""",
        
        substitutionValues: {
          '1': data.intitule,
          '2': data.achatMarchandises,
          '3': data.variationStockMarchandises,
          '4': data.achatApprovionnements,
          '5': data.variationApprovionnements,
          '6': data.autresChargesExterne,
          '7': data.impotsTaxesVersementsAssimiles,
          '8': data.renumerationPersonnel,
          '9': data.chargesSocialas,
          '10': data.dotatiopnsProvisions,
          '11': data.autresCharges,
          '12': data.chargesfinancieres,
          '13': data.chargesExptionnelles,
          '14': data.impotSurbenefices,
          '15': data.soldeCrediteur,
          '16': data.ventesMarchandises,
          '17': data.productionVendueBienEtSerices,
          '18': data.productionStockee,
          '19': data.productionImmobilisee,
          '20': data.subventionExploitation,
          '21': data.autreProduits,
          '22': data.montantExportation,
          '23': data.produitfinancieres,
          '24': data.produitExceptionnels,
          '25': data.soldeDebiteur,
          '26': data.signature,
          '27': data.createdRef,
          '28': data.created,
          '29': data.approbationDG,
          '30': data.motifDG,
          '31': data.signatureDG,
          '32': data.approbationDD,
          '33': data.motifDD,
          '34': data.signatureDD,
          '35': data.id
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
      createdRef: data[0][27],
      created: data[0][28],
      approbationDG: data[0][29],
      motifDG: data[0][30],
      signatureDG: data[0][31],
      approbationDD: data[0][32],
      motifDD: data[0][33],
      signatureDD: data[0][34]
    );
  } 
}