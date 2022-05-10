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

  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;
  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;
  late String signature;
  late DateTime created;

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
      required this.approbationDG,
      required this.signatureDG,
      required this.signatureJustificationDG,
      required this.approbationDD,
      required this.signatureDD,
      required this.signatureJustificationDD,
      required this.signature,
      required this.created});

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
        approbationDG: row[26],
        signatureDG: row[27],
        signatureJustificationDG: row[28],
        approbationDD: row[29],
        signatureDD: row[30],
        signatureJustificationDD: row[31],
        signature: row[32],
        created: row[33]);
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
        approbationDG: json['approbationDG'],
        signatureDG: json['signatureDG'],
        signatureJustificationDG: json['signatureJustificationDG'],
        approbationDD: json['approbationDD'],
        signatureDD: json['signatureDD'],
        signatureJustificationDD: json['signatureJustificationDD'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
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
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
