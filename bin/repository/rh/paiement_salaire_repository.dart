import 'package:postgres/postgres.dart';

import '../../models/rh/paiement_salaire_model.dart';

class PaiementSalaireRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PaiementSalaireRepository(this.executor, this.tableName);

  Future<List<PaiementSalaireModel>> getAllData() async {
    var data = <PaiementSalaireModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"createdAt\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PaiementSalaireModel.fromSQL(row));
    }
    return data.toList();
  }


  Future<void> insertData(PaiementSalaireModel paiementSalaireModel) async {
    var nom = paiementSalaireModel.nom;
    var postNom = paiementSalaireModel.postNom;
    var prenom = paiementSalaireModel.prenom;
    var telephone = paiementSalaireModel.telephone;
    var adresse = paiementSalaireModel.adresse;
    var departement = paiementSalaireModel.departement;
    var numeroSecuriteSociale = paiementSalaireModel.numeroSecuriteSociale;
    var matricule = paiementSalaireModel.matricule;
    var servicesAffectation = paiementSalaireModel.servicesAffectation;
    var salaire = paiementSalaireModel.salaire;
    var observation = paiementSalaireModel.observation;
    var modePaiement = paiementSalaireModel.modePaiement;
    var createdAt = paiementSalaireModel.createdAt;
    var approbation = paiementSalaireModel.approbation;
    var tauxJourHeureMoisSalaire = paiementSalaireModel.tauxJourHeureMoisSalaire;
    var joursHeuresPayeA100PourecentSalaire = paiementSalaireModel.joursHeuresPayeA100PourecentSalaire;
    var totalDuSalaire = paiementSalaireModel.totalDuSalaire;
    var nombreHeureSupplementaires = paiementSalaireModel.nombreHeureSupplementaires;
    var tauxHeureSupplementaires = paiementSalaireModel.tauxHeureSupplementaires;
    var totalDuHeureSupplementaires = paiementSalaireModel.totalDuHeureSupplementaires;
    var supplementTravailSamediDimancheJoursFerie = paiementSalaireModel.supplementTravailSamediDimancheJoursFerie;
    var prime = paiementSalaireModel.prime;
    var divers = paiementSalaireModel.divers;
    var joursCongesPaye = paiementSalaireModel.joursCongesPaye;
    var tauxCongesPaye = paiementSalaireModel.tauxCongesPaye;
    var totalDuCongePaye = paiementSalaireModel.totalDuCongePaye;
    var jourPayeMaladieAccident = paiementSalaireModel.jourPayeMaladieAccident;
    var tauxJournalierMaladieAccident = paiementSalaireModel.tauxJournalierMaladieAccident;
    var totalDuMaladieAccident = paiementSalaireModel.totalDuMaladieAccident;
    var pensionDeduction = paiementSalaireModel.pensionDeduction;
    var indemniteCompensatricesDeduction = paiementSalaireModel.indemniteCompensatricesDeduction;
    var avancesDeduction = paiementSalaireModel.avancesDeduction;
    var diversDeduction = paiementSalaireModel.diversDeduction;
    var retenuesFiscalesDeduction = paiementSalaireModel.retenuesFiscalesDeduction;
    var nombreEnfantBeneficaireAllocationsFamiliales = paiementSalaireModel.nombreEnfantBeneficaireAllocationsFamiliales;
    var nombreDeJoursAllocationsFamiliales = paiementSalaireModel.nombreDeJoursAllocationsFamiliales;
    var tauxJoursAllocationsFamiliales = paiementSalaireModel.tauxJoursAllocationsFamiliales;
    var totalAPayerAllocationsFamiliales = paiementSalaireModel.totalAPayerAllocationsFamiliales;
    var netAPayer = paiementSalaireModel.netAPayer;
    var montantPrisConsiderationCalculCotisationsINSS = paiementSalaireModel.montantPrisConsiderationCalculCotisationsINSS;
    var totalDuBrut = paiementSalaireModel.totalDuBrut;
    var signatureDG = paiementSalaireModel.signatureDG;
    var signatureFinance = paiementSalaireModel.signatureFinance;
    var signatureRH = paiementSalaireModel.signatureRH;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('salaires_id_seq'),"
        "'$nom', '$postNom', '$prenom','$telephone','$adresse','$departement',"
        "'$numeroSecuriteSociale','$matricule','$servicesAffectation','$salaire',"
        "'$observation','$modePaiement', '$createdAt', '$approbation',"
        "'$tauxJourHeureMoisSalaire','$joursHeuresPayeA100PourecentSalaire',"
        "'$totalDuSalaire', '$nombreHeureSupplementaires',"
        "'$tauxHeureSupplementaires','$totalDuHeureSupplementaires',"
        "'$supplementTravailSamediDimancheJoursFerie', '$prime', '$divers',"
        "'$joursCongesPaye','$tauxCongesPaye', '$totalDuCongePaye',"
        "'$jourPayeMaladieAccident','$tauxJournalierMaladieAccident',"
        "'$totalDuMaladieAccident', '$pensionDeduction',"
        "'$indemniteCompensatricesDeduction', '$avancesDeduction',"
        "'$diversDeduction',"
        "'$retenuesFiscalesDeduction','$nombreEnfantBeneficaireAllocationsFamiliales',"
        "'$nombreDeJoursAllocationsFamiliales', '$tauxJoursAllocationsFamiliales',"
        "'$totalAPayerAllocationsFamiliales','$netAPayer',"
        "'$montantPrisConsiderationCalculCotisationsINSS','$totalDuBrut',"
        "'$signatureDG','$signatureFinance','$signatureRH');");
    });
  }

  Future<void> update(PaiementSalaireModel paiementSalaireModel) async {
    var id = paiementSalaireModel.id;
    var nom = paiementSalaireModel.nom;
    var postNom = paiementSalaireModel.postNom;
    var prenom = paiementSalaireModel.prenom;
    var telephone = paiementSalaireModel.telephone;
    var adresse = paiementSalaireModel.adresse;
    var departement = paiementSalaireModel.departement;
    var numeroSecuriteSociale = paiementSalaireModel.numeroSecuriteSociale;
    var matricule = paiementSalaireModel.matricule;
    var servicesAffectation = paiementSalaireModel.servicesAffectation;
    var salaire = paiementSalaireModel.salaire;
    var observation = paiementSalaireModel.observation;
    var modePaiement = paiementSalaireModel.modePaiement;
    var createdAt = paiementSalaireModel.createdAt;
    var approbation = paiementSalaireModel.approbation;
    var tauxJourHeureMoisSalaire =
        paiementSalaireModel.tauxJourHeureMoisSalaire;
    var joursHeuresPayeA100PourecentSalaire =
        paiementSalaireModel.joursHeuresPayeA100PourecentSalaire;
    var totalDuSalaire = paiementSalaireModel.totalDuSalaire;
    var nombreHeureSupplementaires =
        paiementSalaireModel.nombreHeureSupplementaires;
    var tauxHeureSupplementaires =
        paiementSalaireModel.tauxHeureSupplementaires;
    var totalDuHeureSupplementaires =
        paiementSalaireModel.totalDuHeureSupplementaires;
    var supplementTravailSamediDimancheJoursFerie =
        paiementSalaireModel.supplementTravailSamediDimancheJoursFerie;
    var prime = paiementSalaireModel.prime;
    var divers = paiementSalaireModel.divers;
    var joursCongesPaye = paiementSalaireModel.joursCongesPaye;
    var tauxCongesPaye = paiementSalaireModel.tauxCongesPaye;
    var totalDuCongePaye = paiementSalaireModel.totalDuCongePaye;
    var jourPayeMaladieAccident = paiementSalaireModel.jourPayeMaladieAccident;
    var tauxJournalierMaladieAccident =
        paiementSalaireModel.tauxJournalierMaladieAccident;
    var totalDuMaladieAccident = paiementSalaireModel.totalDuMaladieAccident;
    var pensionDeduction = paiementSalaireModel.pensionDeduction;
    var indemniteCompensatricesDeduction =
        paiementSalaireModel.indemniteCompensatricesDeduction;
    var avancesDeduction = paiementSalaireModel.avancesDeduction;
    var diversDeduction = paiementSalaireModel.diversDeduction;
    var retenuesFiscalesDeduction =
        paiementSalaireModel.retenuesFiscalesDeduction;
    var nombreEnfantBeneficaireAllocationsFamiliales =
        paiementSalaireModel.nombreEnfantBeneficaireAllocationsFamiliales;
    var nombreDeJoursAllocationsFamiliales =
        paiementSalaireModel.nombreDeJoursAllocationsFamiliales;
    var tauxJoursAllocationsFamiliales =
        paiementSalaireModel.tauxJoursAllocationsFamiliales;
    var totalAPayerAllocationsFamiliales =
        paiementSalaireModel.totalAPayerAllocationsFamiliales;
    var netAPayer = paiementSalaireModel.netAPayer;
    var montantPrisConsiderationCalculCotisationsINSS =
        paiementSalaireModel.montantPrisConsiderationCalculCotisationsINSS;
    var totalDuBrut = paiementSalaireModel.totalDuBrut;
    var signatureDG = paiementSalaireModel.signatureDG;
    var signatureFinance = paiementSalaireModel.signatureFinance;
    var signatureRH = paiementSalaireModel.signatureRH;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
      "UPDATE $tableName SET \"nom\"='$nom', \"postNom\"='$postNom', \"prenom\"='$prenom',"
      "\"telephone\"='$telephone', \"adresse\"='$adresse', \"departement\"='$departement',"
      "\"numeroSecuriteSociale\"='$numeroSecuriteSociale', \"matricule\"='$matricule',"
      "\"servicesAffectation\"='$servicesAffectation', \"salaire\"='$salaire',"
      "\"observation\"='$observation', \"modePaiement\"='$modePaiement',"
      "\"createdAt\"='$createdAt', \"approbation\"='$approbation',"
      "\"tauxJourHeureMoisSalaire\"='$tauxJourHeureMoisSalaire',"
      "\"joursHeuresPayeA100PourecentSalaire\"='$joursHeuresPayeA100PourecentSalaire',"
      "\"totalDuSalaire\"='$totalDuSalaire', \"nombreHeureSupplementaires\"='$nombreHeureSupplementaires',"
      "\"tauxHeureSupplementaires\"='$tauxHeureSupplementaires',"
      "\"totalDuHeureSupplementaires\"='$totalDuHeureSupplementaires',"
      "\"supplementTravailSamediDimancheJoursFerie\"='$supplementTravailSamediDimancheJoursFerie',"
      "\"prime\"='$prime', \"divers\"='$divers', \"joursCongesPaye\"='$joursCongesPaye',"
      "\"tauxCongesPaye\"='$tauxCongesPaye', \"totalDuCongePaye\"='$totalDuCongePaye',"
      "\"jourPayeMaladieAccident\"='$jourPayeMaladieAccident',"
      "\"tauxJournalierMaladieAccident\"='$tauxJournalierMaladieAccident',"
      "\"totalDuMaladieAccident\"='$totalDuMaladieAccident', \"pensionDeduction\"='$pensionDeduction',"
      "\"indemniteCompensatricesDeduction\"='$indemniteCompensatricesDeduction',"
      "\"avancesDeduction\"='$avancesDeduction', \"diversDeduction\"='$diversDeduction',"
      "\"retenuesFiscalesDeduction\"='$retenuesFiscalesDeduction',"
      "\"nombreEnfantBeneficaireAllocationsFamiliales\"='$nombreEnfantBeneficaireAllocationsFamiliales',"
      "\"nombreDeJoursAllocationsFamiliales\"='$nombreDeJoursAllocationsFamiliales',"
      "\"tauxJoursAllocationsFamiliales\"='$tauxJoursAllocationsFamiliales',"
      "\"totalAPayerAllocationsFamiliales\"='$totalAPayerAllocationsFamiliales',"
      "\"netAPayer\"='$netAPayer',"
      "\"montantPrisConsiderationCalculCotisationsINSS\"='$montantPrisConsiderationCalculCotisationsINSS',"
      "\"totalDuBrut\"='$totalDuBrut', \"signatureDG\"='$signatureDG',"
      "\"signatureFinance\"='$signatureFinance', \"signatureRH\"='$signatureRH' WHERE id=$id;");
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
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
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
      approbation: data[0][14],
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
      signatureDG: data[0][42],
      signatureRH: data[0][43],
      signatureFinance: data[0][44]
    );
  }
}