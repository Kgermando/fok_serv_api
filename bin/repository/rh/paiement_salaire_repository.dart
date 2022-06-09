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
      await ctx.query("INSERT INTO $tableName (id, nom, postnom, prenom, telephone,"
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
      "montant_pris_consideration_calcul_cotisationsinss, total_du_brut, signature)"
      "VALUES (nextval('salaires_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15,"
      "@16, @17, @18, @19, @20, @21, @22, @23, @24, @25, @26, @27, @28, @29, @30,"
      "@31, @32, @33, @34, @35, @36, @37, @38, @39, @40, @41)",
      substitutionValues: {
        '1': paiementSalaireModel.nom,
        '2': paiementSalaireModel.postNom,
        '3': paiementSalaireModel.prenom,
        '4': paiementSalaireModel.telephone,
        '5': paiementSalaireModel.adresse,
        '6': paiementSalaireModel.departement,
        '7': paiementSalaireModel.numeroSecuriteSociale,
        '8': paiementSalaireModel.matricule,
        '9': paiementSalaireModel.servicesAffectation,
        '10': paiementSalaireModel.salaire,
        '11': paiementSalaireModel.observation,
        '12': paiementSalaireModel.modePaiement,
        '13': paiementSalaireModel.createdAt,
        '14': paiementSalaireModel.tauxJourHeureMoisSalaire,
        '15': paiementSalaireModel.joursHeuresPayeA100PourecentSalaire,
        '16': paiementSalaireModel.totalDuSalaire,
        '17': paiementSalaireModel.nombreHeureSupplementaires,
        '18': paiementSalaireModel.tauxHeureSupplementaires,
        '19': paiementSalaireModel.totalDuHeureSupplementaires,
        '20': paiementSalaireModel.supplementTravailSamediDimancheJoursFerie,
        '21': paiementSalaireModel.prime,
        '22': paiementSalaireModel.divers,
        '23': paiementSalaireModel.joursCongesPaye,
        '24': paiementSalaireModel.tauxCongesPaye,
        '25': paiementSalaireModel.totalDuCongePaye,
        '26': paiementSalaireModel.jourPayeMaladieAccident,
        '27': paiementSalaireModel.tauxJournalierMaladieAccident,
        '28': paiementSalaireModel.totalDuMaladieAccident,
        '29': paiementSalaireModel.pensionDeduction,
        '30': paiementSalaireModel.indemniteCompensatricesDeduction,
        '31': paiementSalaireModel.avancesDeduction,
        '32': paiementSalaireModel.diversDeduction,
        '33': paiementSalaireModel.retenuesFiscalesDeduction,
        '34': paiementSalaireModel.nombreEnfantBeneficaireAllocationsFamiliales,
        '35': paiementSalaireModel.nombreDeJoursAllocationsFamiliales,
        '36': paiementSalaireModel.tauxJoursAllocationsFamiliales,
        '37': paiementSalaireModel.totalAPayerAllocationsFamiliales,
        '38': paiementSalaireModel.netAPayer,
        '39': paiementSalaireModel.montantPrisConsiderationCalculCotisationsINSS,
        '40': paiementSalaireModel.totalDuBrut,
        '41': paiementSalaireModel.signature
        }
      );
    });
  }

  Future<void> update(PaiementSalaireModel paiementSalaireModel) async {
    await executor.query(
       "UPDATE $tableName SET nom = @1, postnom = @2, prenom = @3,"
          "telephone = @4, adresse = @5, departement = @6,"
          "numero_securite_sociale = @7, matricule = @8,"
          "services_affectation = @9, salaire = @10,"
          "observation = @11, mode_paiement = @12,"
          "created_at = @13,"
          "taux_jour_heure_mois_salaire = @14,"
          "jours_heures_paye_a_100_pourecent_salaire = @15,"
          "total_du_salaire = @16, nombre_heure_supplementaires = @17,"
          "taux_heure_supplementaires = @18,"
          "total_du_heure_supplementaires = @19,"
          "supplement_travail_samedi_dimanche_jours_ferie = @20,"
          "prime = @21, divers = @22, jours_conges_paye = @23,"
          "taux_conges_paye = @24, total_du_conge_paye = @25,"
          "jour_paye_maladie_accident = @26,"
          "taux_journalier_maladie_accident = @27,"
          "total_du_maladie_accident = @28, pension_deduction = @29,"
          "indemnite_compensatrices_deduction = @30,"
          "avances_deduction = @31, divers_deduction = @32,"
          "retenues_fiscalesdeduction = @33,"
          "nombre_enfant_beneficaire_allocations_familiales = @34,"
          "nombre_de_jours_allocations_familiales = @35,"
          "taux_jours_allocations_familiales = @36,"
          "total_a_payer_allocations_familiales = @37,"
          "net_a_payer = @38,"
          "montant_pris_consideration_calcul_cotisationsinss = @39,"
          "total_du_brut = @40, signature = @41' WHERE id=@42",
        substitutionValues: {
          '1': paiementSalaireModel.nom,
          '2': paiementSalaireModel.postNom,
          '3': paiementSalaireModel.prenom,
          '4': paiementSalaireModel.telephone,
          '5': paiementSalaireModel.adresse,
          '6': paiementSalaireModel.departement,
          '7': paiementSalaireModel.numeroSecuriteSociale,
          '8': paiementSalaireModel.matricule,
          '9': paiementSalaireModel.servicesAffectation,
          '10': paiementSalaireModel.salaire,
          '11': paiementSalaireModel.observation,
          '12': paiementSalaireModel.modePaiement,
          '13': paiementSalaireModel.createdAt,
          '14': paiementSalaireModel.tauxJourHeureMoisSalaire,
          '15': paiementSalaireModel.joursHeuresPayeA100PourecentSalaire,
          '16': paiementSalaireModel.totalDuSalaire,
          '17': paiementSalaireModel.nombreHeureSupplementaires,
          '18': paiementSalaireModel.tauxHeureSupplementaires,
          '19': paiementSalaireModel.totalDuHeureSupplementaires,
          '20': paiementSalaireModel.supplementTravailSamediDimancheJoursFerie,
          '21': paiementSalaireModel.prime,
          '22': paiementSalaireModel.divers,
          '23': paiementSalaireModel.joursCongesPaye,
          '24': paiementSalaireModel.tauxCongesPaye,
          '25': paiementSalaireModel.totalDuCongePaye,
          '26': paiementSalaireModel.jourPayeMaladieAccident,
          '27': paiementSalaireModel.tauxJournalierMaladieAccident,
          '28': paiementSalaireModel.totalDuMaladieAccident,
          '29': paiementSalaireModel.pensionDeduction,
          '30': paiementSalaireModel.indemniteCompensatricesDeduction,
          '31': paiementSalaireModel.avancesDeduction,
          '32': paiementSalaireModel.diversDeduction,
          '33': paiementSalaireModel.retenuesFiscalesDeduction,
          '34':
              paiementSalaireModel.nombreEnfantBeneficaireAllocationsFamiliales,
          '35': paiementSalaireModel.nombreDeJoursAllocationsFamiliales,
          '36': paiementSalaireModel.tauxJoursAllocationsFamiliales,
          '37': paiementSalaireModel.totalAPayerAllocationsFamiliales,
          '38': paiementSalaireModel.netAPayer,
          '39': paiementSalaireModel
              .montantPrisConsiderationCalculCotisationsINSS,
          '40': paiementSalaireModel.totalDuBrut,
          '41': paiementSalaireModel.signature,
          '42': paiementSalaireModel.id
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
        telephone: data[0][4],
        adresse: data[0][5],
        departement: data[0][6],
        numeroSecuriteSociale: data[0][7],
        matricule: data[0][8],
        servicesAffectation: data[0][9],
        salaire: data[0][10],
        observation: data[0][11],
        modePaiement: data[0][12],
        createdAt: data[0][13],
        tauxJourHeureMoisSalaire: data[0][14],
        joursHeuresPayeA100PourecentSalaire: data[0][15],
        totalDuSalaire: data[0][16],
        nombreHeureSupplementaires: data[0][17],
        tauxHeureSupplementaires: data[0][18],
        totalDuHeureSupplementaires: data[0][19],
        supplementTravailSamediDimancheJoursFerie: data[0][20],
        prime: data[0][21],
        divers: data[0][22],
        joursCongesPaye: data[0][23],
        tauxCongesPaye: data[0][24],
        totalDuCongePaye: data[0][25],
        jourPayeMaladieAccident: data[0][26],
        tauxJournalierMaladieAccident: data[0][27],
        totalDuMaladieAccident: data[0][28],
        pensionDeduction: data[0][29],
        indemniteCompensatricesDeduction: data[0][30],
        avancesDeduction: data[0][31],
        diversDeduction: data[0][32],
        retenuesFiscalesDeduction: data[0][33],
        nombreEnfantBeneficaireAllocationsFamiliales: data[0][34],
        nombreDeJoursAllocationsFamiliales: data[0][35],
        tauxJoursAllocationsFamiliales: data[0][36],
        totalAPayerAllocationsFamiliales: data[0][37],
        netAPayer: data[0][38],
        montantPrisConsiderationCalculCotisationsINSS: data[0][39],
        totalDuBrut: data[0][40],
        signature: data[0][41]);
  }
}
