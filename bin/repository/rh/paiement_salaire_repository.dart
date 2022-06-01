import 'package:postgres/postgres.dart';

import '../../models/rh/paiement_salaire_model.dart';

class PaiementSalaireRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PaiementSalaireRepository(this.executor, this.tableName);

  Future<List<PaiementSalaireModel>> getAllData() async {
    var data = <PaiementSalaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY createdAt DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PaiementSalaireModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PaiementSalaireModel paiementSalaireModel) async {
    await executor.transaction((ctx) async {
      var idLast = await ctx.query("SELECT id FROM $tableName");
      await ctx.query("INSERT INTO $tableName (id, nom, postNom, prenom, telephone,"
      "adresse, departement, numeroSecuriteSociale, matricule, servicesAffectation,"
      "salaire, observation, modePaiement, createdAt, ligneBudgtaire, resources,"
      "tauxJourHeureMoisSalaire, joursHeuresPayeA100PourecentSalaire, totalDuSalaire,"
      "nombreHeureSupplementaires, tauxHeureSupplementaires, totalDuHeureSupplementaires,"
      "supplementTravailSamediDimancheJoursFerie, prime, divers, joursCongesPaye,"
      "tauxCongesPaye, totalDuCongePaye, jourPayeMaladieAccident,"
      "tauxJournalierMaladieAccident, totalDuMaladieAccident, pensionDeduction,"
      "indemniteCompensatricesDeduction, avancesDeduction, diversDeduction,"
      "retenuesFiscalesDeduction, nombreEnfantBeneficaireAllocationsFamiliales,"
      "nombreDeJoursAllocationsFamiliales, tauxJoursAllocationsFamiliales,"
      "totalAPayerAllocationsFamiliales, netAPayer,"
      "montantPrisConsiderationCalculCotisationsINSS, totalDuBrut, signature)"
      "VALUES (@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15,"
      "@16, @17, @18, @19, @20, @21, @22, @23, @24, @25, @26, @27, @28, @29, @30,"
      "@31, @32, @33, @34, @35, @36, @37, @38, @39, @40, @41, @42, @43 , @44)",
      substitutionValues: {
        '1': idLast.last[0] + 1,
        '2': paiementSalaireModel.nom,
        '3': paiementSalaireModel.postNom,
        '4': paiementSalaireModel.prenom,
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
        '15': paiementSalaireModel.ligneBudgtaire,
        '16': paiementSalaireModel.resources,
        '17': paiementSalaireModel.tauxJourHeureMoisSalaire,
        '18': paiementSalaireModel.joursHeuresPayeA100PourecentSalaire,
        '19': paiementSalaireModel.totalDuSalaire,
        '20': paiementSalaireModel.nombreHeureSupplementaires,
        '21': paiementSalaireModel.tauxHeureSupplementaires,
        '22': paiementSalaireModel.totalDuHeureSupplementaires,
        '23': paiementSalaireModel.supplementTravailSamediDimancheJoursFerie,
        '24': paiementSalaireModel.prime,
        '25': paiementSalaireModel.divers,
        '26': paiementSalaireModel.joursCongesPaye,
        '27': paiementSalaireModel.tauxCongesPaye,
        '28': paiementSalaireModel.totalDuCongePaye,
        '29': paiementSalaireModel.jourPayeMaladieAccident,
        '30': paiementSalaireModel.tauxJournalierMaladieAccident,
        '31': paiementSalaireModel.totalDuMaladieAccident,
        '32': paiementSalaireModel.pensionDeduction,
        '33': paiementSalaireModel.indemniteCompensatricesDeduction,
        '34': paiementSalaireModel.avancesDeduction,
        '35': paiementSalaireModel.diversDeduction,
        '36': paiementSalaireModel.retenuesFiscalesDeduction,
        '37': paiementSalaireModel.nombreEnfantBeneficaireAllocationsFamiliales,
        '38': paiementSalaireModel.nombreDeJoursAllocationsFamiliales,
        '39': paiementSalaireModel.tauxJoursAllocationsFamiliales,
        '40': paiementSalaireModel.totalAPayerAllocationsFamiliales,
        '41': paiementSalaireModel.netAPayer,
        '42': paiementSalaireModel.montantPrisConsiderationCalculCotisationsINSS,
        '43': paiementSalaireModel.totalDuBrut,
        '44': paiementSalaireModel.signature
        }
      );
    });
  }

  Future<void> update(PaiementSalaireModel paiementSalaireModel) async {
    await executor.query(
       "UPDATE $tableName SET nom = @1, postNom = @2, prenom = @3,"
          "telephone = @4, adresse = @5, departement = @6,"
          "numeroSecuriteSociale = @7, matricule = @8,"
          "servicesAffectation = @9, salaire = @10,"
          "observation = @11, modePaiement = @12,"
          "createdAt = @13, ligneBudgtaire = @14, resources = @15,"
          "tauxJourHeureMoisSalaire = @16,"
          "joursHeuresPayeA100PourecentSalaire = @17,"
          "totalDuSalaire = @18, nombreHeureSupplementaires = @19,"
          "tauxHeureSupplementaires = @20,"
          "totalDuHeureSupplementaires = @21,"
          "supplementTravailSamediDimancheJoursFerie = @22,"
          "prime = @23, divers = @24, joursCongesPaye = @25,"
          "tauxCongesPaye = @26, totalDuCongePaye = @27,"
          "jourPayeMaladieAccident = @28,"
          "tauxJournalierMaladieAccident = @29,"
          "totalDuMaladieAccident = @30, pensionDeduction = @31,"
          "indemniteCompensatricesDeduction = @32,"
          "avancesDeduction = @33, diversDeduction = @34,"
          "retenuesFiscalesDeduction = @35,"
          "nombreEnfantBeneficaireAllocationsFamiliales = @36,"
          "nombreDeJoursAllocationsFamiliales = @37,"
          "tauxJoursAllocationsFamiliales = @38,"
          "totalAPayerAllocationsFamiliales = @39,"
          "netAPayer = @40,"
          "montantPrisConsiderationCalculCotisationsINSS = @41,"
          "totalDuBrut = @42, signature = @43' WHERE id=@44",
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
          '14': paiementSalaireModel.ligneBudgtaire,
          '15': paiementSalaireModel.resources,
          '16': paiementSalaireModel.tauxJourHeureMoisSalaire,
          '17': paiementSalaireModel.joursHeuresPayeA100PourecentSalaire,
          '18': paiementSalaireModel.totalDuSalaire,
          '19': paiementSalaireModel.nombreHeureSupplementaires,
          '20': paiementSalaireModel.tauxHeureSupplementaires,
          '21': paiementSalaireModel.totalDuHeureSupplementaires,
          '22': paiementSalaireModel.supplementTravailSamediDimancheJoursFerie,
          '23': paiementSalaireModel.prime,
          '24': paiementSalaireModel.divers,
          '25': paiementSalaireModel.joursCongesPaye,
          '26': paiementSalaireModel.tauxCongesPaye,
          '27': paiementSalaireModel.totalDuCongePaye,
          '28': paiementSalaireModel.jourPayeMaladieAccident,
          '29': paiementSalaireModel.tauxJournalierMaladieAccident,
          '30': paiementSalaireModel.totalDuMaladieAccident,
          '31': paiementSalaireModel.pensionDeduction,
          '32': paiementSalaireModel.indemniteCompensatricesDeduction,
          '33': paiementSalaireModel.avancesDeduction,
          '34': paiementSalaireModel.diversDeduction,
          '35': paiementSalaireModel.retenuesFiscalesDeduction,
          '36':
              paiementSalaireModel.nombreEnfantBeneficaireAllocationsFamiliales,
          '37': paiementSalaireModel.nombreDeJoursAllocationsFamiliales,
          '38': paiementSalaireModel.tauxJoursAllocationsFamiliales,
          '39': paiementSalaireModel.totalAPayerAllocationsFamiliales,
          '40': paiementSalaireModel.netAPayer,
          '41': paiementSalaireModel
              .montantPrisConsiderationCalculCotisationsINSS,
          '42': paiementSalaireModel.totalDuBrut,
          '43': paiementSalaireModel.signature,
          '44': paiementSalaireModel.id
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
        ligneBudgtaire: data[0][14],
        resources: data[0][15],
        tauxJourHeureMoisSalaire: data[0][16],
        joursHeuresPayeA100PourecentSalaire: data[0][17],
        totalDuSalaire: data[0][18],
        nombreHeureSupplementaires: data[0][19],
        tauxHeureSupplementaires: data[0][20],
        totalDuHeureSupplementaires: data[0][21],
        supplementTravailSamediDimancheJoursFerie: data[0][22],
        prime: data[0][23],
        divers: data[0][24],
        joursCongesPaye: data[0][25],
        tauxCongesPaye: data[0][26],
        totalDuCongePaye: data[0][27],
        jourPayeMaladieAccident: data[0][28],
        tauxJournalierMaladieAccident: data[0][29],
        totalDuMaladieAccident: data[0][30],
        pensionDeduction: data[0][31],
        indemniteCompensatricesDeduction: data[0][32],
        avancesDeduction: data[0][33],
        diversDeduction: data[0][34],
        retenuesFiscalesDeduction: data[0][35],
        nombreEnfantBeneficaireAllocationsFamiliales: data[0][36],
        nombreDeJoursAllocationsFamiliales: data[0][37],
        tauxJoursAllocationsFamiliales: data[0][38],
        totalAPayerAllocationsFamiliales: data[0][39],
        netAPayer: data[0][40],
        montantPrisConsiderationCalculCotisationsINSS: data[0][41],
        totalDuBrut: data[0][42],
        signature: data[0][43]);
  }
}
