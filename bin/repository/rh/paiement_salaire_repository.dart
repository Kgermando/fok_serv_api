import 'package:postgres/postgres.dart';

import '../../models/rh/paiement_salaire_model.dart';

class PaiementSalaireRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PaiementSalaireRepository(this.executor, this.tableName);

  Future<List<PaiementSalaireModel>> getAllData() async {
    var data = <PaiementSalaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY created_at DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PaiementSalaireModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PaiementSalaireModel paiementSalaireModel) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom, postnom, prenom, email, telephone,"
          "adresse, departement, numero_securite_sociale, matricule, services_affectation,"
          "salaire, observation, mode_paiement, created_at,"
          "taux_jour_heure_mois_salaire, jours_heures_paye_a_100_pourecent_salaire, total_du_salaire,"
          "nombre_heure_supplementaires, taux_heure_supplementaires, total_du_heure_supplementaires,"
          "supplement_travail_samedi_dimanche_jours_ferie, prime, divers, jours_conges_paye,"
          "taux_conges_paye, total_du_conge_paye, jour_paye_maladie_accident,"
          "taux_journalier_maladie_accident, total_du_maladie_accident, pension_deduction,"
          "indemnite_compensatrices_deduction, avances_deduction, divers_deduction,"
          "retenues_fiscalesdeduction, nombre_enfant_beneficaire_allocations_familiales,"
          "nombre_de_jours_allocations_familiales, taux_jours_allocations_familiales,"
          "total_a_payer_allocations_familiales, net_a_payer,"
          "montant_pris_consideration_calcul_cotisationsinss, total_du_brut, signature,"
          "approbation_dg, motif_dg, signature_dg, approbation_budget, motif_budget, signature_budget,"
          "approbation_fin, motif_fin, signature_fin, approbation_dd, motif_dd, signature_dd,"
          "ligne_budgetaire, ressource)"
          "VALUES (nextval('salaires_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15,"
          "@16, @17, @18, @19, @20, @21, @22, @23, @24, @25, @26, @27, @28, @29, @30,"
          "@31, @32, @33, @34, @35, @36, @37, @38, @39, @40, @41, @42, @43, @44,"
          "@45, @46, @47, @48, @49, @50, @51, @52, @53, @54, @55, @56)",

          substitutionValues: {
            '1': paiementSalaireModel.nom,
            '2': paiementSalaireModel.postNom,
            '3': paiementSalaireModel.prenom,
            '4': paiementSalaireModel.email,
            '5': paiementSalaireModel.telephone,
            '6': paiementSalaireModel.adresse,
            '7': paiementSalaireModel.departement,
            '8': paiementSalaireModel.numeroSecuriteSociale,
            '9': paiementSalaireModel.matricule,
            '10': paiementSalaireModel.servicesAffectation,
            '11': paiementSalaireModel.salaire,
            '12': paiementSalaireModel.observation,
            '13': paiementSalaireModel.modePaiement,
            '14': paiementSalaireModel.createdAt,
            '15': paiementSalaireModel.tauxJourHeureMoisSalaire,
            '16': paiementSalaireModel.joursHeuresPayeA100PourecentSalaire,
            '17': paiementSalaireModel.totalDuSalaire,
            '18': paiementSalaireModel.nombreHeureSupplementaires,
            '19': paiementSalaireModel.tauxHeureSupplementaires,
            '20': paiementSalaireModel.totalDuHeureSupplementaires,
            '21':
                paiementSalaireModel.supplementTravailSamediDimancheJoursFerie,
            '22': paiementSalaireModel.prime,
            '23': paiementSalaireModel.divers,
            '24': paiementSalaireModel.joursCongesPaye,
            '25': paiementSalaireModel.tauxCongesPaye,
            '26': paiementSalaireModel.totalDuCongePaye,
            '27': paiementSalaireModel.jourPayeMaladieAccident,
            '28': paiementSalaireModel.tauxJournalierMaladieAccident,
            '29': paiementSalaireModel.totalDuMaladieAccident,
            '30': paiementSalaireModel.pensionDeduction,
            '31': paiementSalaireModel.indemniteCompensatricesDeduction,
            '32': paiementSalaireModel.avancesDeduction,
            '33': paiementSalaireModel.diversDeduction,
            '34': paiementSalaireModel.retenuesFiscalesDeduction,
            '35': paiementSalaireModel
                .nombreEnfantBeneficaireAllocationsFamiliales,
            '36': paiementSalaireModel.nombreDeJoursAllocationsFamiliales,
            '37': paiementSalaireModel.tauxJoursAllocationsFamiliales,
            '38': paiementSalaireModel.totalAPayerAllocationsFamiliales,
            '39': paiementSalaireModel.netAPayer,
            '40': paiementSalaireModel
                .montantPrisConsiderationCalculCotisationsINSS,
            '41': paiementSalaireModel.totalDuBrut,
            '42': paiementSalaireModel.signature,
            '43': paiementSalaireModel.approbationDG,
            '44': paiementSalaireModel.motifDG,
            '45': paiementSalaireModel.signatureDG,
            '46': paiementSalaireModel.approbationBudget,
            '47': paiementSalaireModel.motifBudget,
            '48': paiementSalaireModel.signatureBudget,
            '49': paiementSalaireModel.approbationFin,
            '50': paiementSalaireModel.motifFin,
            '51': paiementSalaireModel.signatureFin,
            '52': paiementSalaireModel.approbationDD,
            '53': paiementSalaireModel.motifDD,
            '54': paiementSalaireModel.signatureDD,
            '55': paiementSalaireModel.ligneBudgetaire,
            '56': paiementSalaireModel.ressource
          });
    });
  }

  Future<void> update(PaiementSalaireModel paiementSalaireModel) async {
    await executor
        .execute("""UPDATE $tableName SET nom = @1, postnom = @2, prenom = @3,
          email = @4, telephone = @5, adresse = @6, departement = @7,
          numero_securite_sociale = @8, matricule = @9,
          services_affectation = @10, salaire = @11,
          observation = @12, mode_paiement = @13,
          created_at = @14,
          taux_jour_heure_mois_salaire = @15,
          jours_heures_paye_a_100_pourecent_salaire = @16,
          total_du_salaire = @17, nombre_heure_supplementaires = @18,
          taux_heure_supplementaires = @19,
          total_du_heure_supplementaires = @20,
          supplement_travail_samedi_dimanche_jours_ferie = @21,
          prime = @22, divers = @23, jours_conges_paye = @24,
          taux_conges_paye = @25, total_du_conge_paye = @26,
          jour_paye_maladie_accident = @27,
          taux_journalier_maladie_accident = @28,
          total_du_maladie_accident = @29, pension_deduction = @30,
          indemnite_compensatrices_deduction = @31,
          avances_deduction = @32, divers_deduction = @33,
          retenues_fiscalesdeduction = @34,
          nombre_enfant_beneficaire_allocations_familiales = @35,
          nombre_de_jours_allocations_familiales = @36,
          taux_jours_allocations_familiales = @37,
          total_a_payer_allocations_familiales = @38,
          net_a_payer = @39,
          montant_pris_consideration_calcul_cotisationsinss = @40,
          total_du_brut = @41, signature = @42',
          approbation_dg = @43', motif_dg = @44', signature_dg = @45', approbation_budget = @46',
          motif_budget = @47', signature_budget = @48', approbation_fin = @49', motif_fin = @50',
          signature_fin = @51', approbation_dd = @52', motif_dd = @53', signature_dd = @54',
          ligne_budgetaire = @55', ressource = @56' WHERE id=@57""",

        substitutionValues: {
            '1': paiementSalaireModel.nom,
            '2': paiementSalaireModel.postNom,
            '3': paiementSalaireModel.prenom,
            '4': paiementSalaireModel.email,
            '5': paiementSalaireModel.telephone,
            '6': paiementSalaireModel.adresse,
            '7': paiementSalaireModel.departement,
            '8': paiementSalaireModel.numeroSecuriteSociale,
            '9': paiementSalaireModel.matricule,
            '10': paiementSalaireModel.servicesAffectation,
            '11': paiementSalaireModel.salaire,
            '12': paiementSalaireModel.observation,
            '13': paiementSalaireModel.modePaiement,
            '14': paiementSalaireModel.createdAt,
            '15': paiementSalaireModel.tauxJourHeureMoisSalaire,
            '16': paiementSalaireModel.joursHeuresPayeA100PourecentSalaire,
            '17': paiementSalaireModel.totalDuSalaire,
            '18': paiementSalaireModel.nombreHeureSupplementaires,
            '19': paiementSalaireModel.tauxHeureSupplementaires,
            '20': paiementSalaireModel.totalDuHeureSupplementaires,
            '21':
                paiementSalaireModel.supplementTravailSamediDimancheJoursFerie,
            '22': paiementSalaireModel.prime,
            '23': paiementSalaireModel.divers,
            '24': paiementSalaireModel.joursCongesPaye,
            '25': paiementSalaireModel.tauxCongesPaye,
            '26': paiementSalaireModel.totalDuCongePaye,
            '27': paiementSalaireModel.jourPayeMaladieAccident,
            '28': paiementSalaireModel.tauxJournalierMaladieAccident,
            '29': paiementSalaireModel.totalDuMaladieAccident,
            '30': paiementSalaireModel.pensionDeduction,
            '31': paiementSalaireModel.indemniteCompensatricesDeduction,
            '32': paiementSalaireModel.avancesDeduction,
            '33': paiementSalaireModel.diversDeduction,
            '34': paiementSalaireModel.retenuesFiscalesDeduction,
            '35': paiementSalaireModel
                .nombreEnfantBeneficaireAllocationsFamiliales,
            '36': paiementSalaireModel.nombreDeJoursAllocationsFamiliales,
            '37': paiementSalaireModel.tauxJoursAllocationsFamiliales,
            '38': paiementSalaireModel.totalAPayerAllocationsFamiliales,
            '39': paiementSalaireModel.netAPayer,
            '40': paiementSalaireModel
                .montantPrisConsiderationCalculCotisationsINSS,
            '41': paiementSalaireModel.totalDuBrut,
            '42': paiementSalaireModel.signature,
            '43': paiementSalaireModel.approbationDG,
            '44': paiementSalaireModel.motifDG,
            '45': paiementSalaireModel.signatureDG,
            '46': paiementSalaireModel.approbationBudget,
            '47': paiementSalaireModel.motifBudget,
            '48': paiementSalaireModel.signatureBudget,
            '49': paiementSalaireModel.approbationFin,
            '50': paiementSalaireModel.motifFin,
            '51': paiementSalaireModel.signatureFin,
            '52': paiementSalaireModel.approbationDD,
            '53': paiementSalaireModel.motifDD,
            '54': paiementSalaireModel.signatureDD,
            '55': paiementSalaireModel.ligneBudgetaire,
            '56': paiementSalaireModel.ressource,
            '57': paiementSalaireModel.id
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

  Future<PaiementSalaireModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE id = '$id'");
    return PaiementSalaireModel(
        id: data[0][0],
        nom: data[0][1],
        postNom: data[0][2],
        prenom: data[0][3],
        email: data[0][4],
        telephone: data[0][5],
        adresse: data[0][6],
        departement: data[0][7],
        numeroSecuriteSociale: data[0][8],
        matricule: data[0][9],
        servicesAffectation: data[0][10],
        salaire: data[0][11],
        observation: data[0][12],
        modePaiement: data[0][13],
        createdAt: data[0][14],
        tauxJourHeureMoisSalaire: data[0][15],
        joursHeuresPayeA100PourecentSalaire: data[0][16],
        totalDuSalaire: data[0][17],
        nombreHeureSupplementaires: data[0][18],
        tauxHeureSupplementaires: data[0][19],
        totalDuHeureSupplementaires: data[0][20],
        supplementTravailSamediDimancheJoursFerie: data[0][21],
        prime: data[0][22],
        divers: data[0][23],
        joursCongesPaye: data[0][24],
        tauxCongesPaye: data[0][25],
        totalDuCongePaye: data[0][26],
        jourPayeMaladieAccident: data[0][27],
        tauxJournalierMaladieAccident: data[0][28],
        totalDuMaladieAccident: data[0][29],
        pensionDeduction: data[0][30],
        indemniteCompensatricesDeduction: data[0][31],
        avancesDeduction: data[0][32],
        diversDeduction: data[0][33],
        retenuesFiscalesDeduction: data[0][34],
        nombreEnfantBeneficaireAllocationsFamiliales: data[0][35],
        nombreDeJoursAllocationsFamiliales: data[0][36],
        tauxJoursAllocationsFamiliales: data[0][37],
        totalAPayerAllocationsFamiliales: data[0][38],
        netAPayer: data[0][39],
        montantPrisConsiderationCalculCotisationsINSS: data[0][40],
        totalDuBrut: data[0][41],
        signature: data[0][42],
        approbationDG: data[0][43],
        motifDG: data[0][44],
        signatureDG: data[0][45],
        approbationBudget: data[0][46],
        motifBudget: data[0][47],
        signatureBudget: data[0][48],
        approbationFin: data[0][49],
        motifFin: data[0][50],
        signatureFin: data[0][51],
        approbationDD: data[0][52],
        motifDD: data[0][53],
        signatureDD: data[0][54],
        ligneBudgetaire: data[0][55],
        ressource: data[0][56]
    );
  }
}
