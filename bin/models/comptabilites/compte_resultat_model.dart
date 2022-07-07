class CompteResulatsModel {
  late int? id;
  late String intitule; // Année

  // Charges
  late String achatMarchandises;
  late String variationStockMarchandises;
  late String achatApprovionnements;
  late String variationApprovionnements;
  late String autresChargesExterne;
  late String impotsTaxesVersementsAssimiles;
  late String renumerationPersonnel;
  late String chargesSocialas;
  late String dotatiopnsProvisions;
  late String autresCharges;
  late String chargesfinancieres;

  late String chargesExptionnelles;
  late String impotSurbenefices;
  late String soldeCrediteur; // Benefice

  // Produits
  late String ventesMarchandises;
  late String productionVendueBienEtSerices;
  late String productionStockee;
  late String productionImmobilisee;
  late String subventionExploitation;
  late String autreProduits;
  late String montantExportation;
  late String produitfinancieres;

  late String produitExceptionnels;
  late String soldeDebiteur; // Perte
  late String signature;
  late DateTime createdRef;
  late DateTime created;
  
    // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  CompteResulatsModel(
      {this.id,
      required this.intitule,
      required this.achatMarchandises,
      required this.variationStockMarchandises,
      required this.achatApprovionnements,
      required this.variationApprovionnements,
      required this.autresChargesExterne,
      required this.impotsTaxesVersementsAssimiles,
      required this.renumerationPersonnel,
      required this.chargesSocialas,
      required this.dotatiopnsProvisions,
      required this.autresCharges,
      required this.chargesfinancieres,
      required this.chargesExptionnelles,
      required this.impotSurbenefices,
      required this.soldeCrediteur,
      required this.ventesMarchandises,
      required this.productionVendueBienEtSerices,
      required this.productionStockee,
      required this.productionImmobilisee,
      required this.subventionExploitation,
      required this.autreProduits,
      required this.montantExportation,
      required this.produitfinancieres,
      required this.produitExceptionnels,
      required this.soldeDebiteur,
      required this.signature,
      required this.createdRef,
      required this.created,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory CompteResulatsModel.fromSQL(List<dynamic> row) {
    return CompteResulatsModel(
        id: row[0],
        intitule: row[1],
        achatMarchandises: row[2],
        variationStockMarchandises: row[3],
        achatApprovionnements: row[4],
        variationApprovionnements: row[5],
        autresChargesExterne: row[6],
        impotsTaxesVersementsAssimiles: row[7],
        renumerationPersonnel: row[8],
        chargesSocialas: row[9],
        dotatiopnsProvisions: row[10],
        autresCharges: row[11],
        chargesfinancieres: row[12],
        chargesExptionnelles: row[13],
        impotSurbenefices: row[14],
        soldeCrediteur: row[15],
        ventesMarchandises: row[16],
        productionVendueBienEtSerices: row[17],
        productionStockee: row[18],
        productionImmobilisee: row[19],
        subventionExploitation: row[20],
        autreProduits: row[21],
        montantExportation: row[22],
        produitfinancieres: row[23],
        produitExceptionnels: row[24],
        soldeDebiteur: row[25],
        signature: row[26],
        createdRef: row[27],
        created: row[28],
        approbationDG: row[29],
        motifDG: row[30],
        signatureDG: row[31],
        approbationDD: row[32],
        motifDD: row[33],
        signatureDD: row[34]);
  }

  factory CompteResulatsModel.fromJson(Map<String, dynamic> json) {
    return CompteResulatsModel(
        id: json['id'],
        intitule: json['intitule'],
        achatMarchandises: json['achatMarchandises'],
        variationStockMarchandises: json['variationStockMarchandises'],
        achatApprovionnements: json['achatApprovionnements'],
        variationApprovionnements: json['variationApprovionnements'],
        autresChargesExterne: json['autresChargesExterne'],
        impotsTaxesVersementsAssimiles: json['impotsTaxesVersementsAssimiles'],
        renumerationPersonnel: json['renumerationPersonnel'],
        chargesSocialas: json['chargesSocialas'],
        dotatiopnsProvisions: json['dotatiopnsProvisions'],
        autresCharges: json['autresCharges'],
        chargesfinancieres: json['chargesfinancieres'],
        chargesExptionnelles: json['chargesExptionnelles'],
        impotSurbenefices: json['impotSurbenefices'],
        soldeCrediteur: json['soldeCrediteur'],
        ventesMarchandises: json['ventesMarchandises'],
        productionVendueBienEtSerices: json['productionVendueBienEtSerices'],
        productionStockee: json['productionStockee'],
        productionImmobilisee: json['productionImmobilisee'],
        subventionExploitation: json['subventionExploitation'],
        autreProduits: json['autreProduits'],
        montantExportation: json['montantExportation'],
        produitfinancieres: json['produitfinancieres'],
        produitExceptionnels: json['produitExceptionnels'],
        soldeDebiteur: json['soldeDebiteur'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']),
        approbationDG: json['approbationDG'],
        motifDG: json['motifDG'],
        signatureDG: json['signatureDG'],
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'intitule': intitule,
      'achatMarchandises': achatMarchandises,
      'variationStockMarchandises': variationStockMarchandises,
      'achatApprovionnements': achatApprovionnements,
      'variationApprovionnements': variationApprovionnements,
      'autresChargesExterne': autresChargesExterne,
      'impotsTaxesVersementsAssimiles': impotsTaxesVersementsAssimiles,
      'renumerationPersonnel': renumerationPersonnel,
      'chargesSocialas': chargesSocialas,
      'dotatiopnsProvisions': dotatiopnsProvisions,
      'autresCharges': autresCharges,
      'chargesExptionnelles': chargesExptionnelles,
      'chargesfinancieres': chargesfinancieres,
      'impotSurbenefices': impotSurbenefices,
      'soldeCrediteur': soldeCrediteur,
      'ventesMarchandises': ventesMarchandises,
      'productionVendueBienEtSerices': productionVendueBienEtSerices,
      'productionStockee': productionStockee,
      'productionImmobilisee': productionImmobilisee,
      'subventionExploitation': subventionExploitation,
      'autreProduits': autreProduits,
      'montantExportation': montantExportation,
      'produitExceptionnels': produitExceptionnels,
      'produitfinancieres': produitfinancieres,
      'soldeDebiteur': soldeDebiteur,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(),
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG,
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}
