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

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('paiement_salaires_id_seq'),"
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
        "'$diversDeduction', '$diversDeduction',"
        "'$retenuesFiscalesDeduction','$nombreEnfantBeneficaireAllocationsFamiliales',"
        "'$nombreDeJoursAllocationsFamiliales', '$tauxJoursAllocationsFamiliales',"
        "'$totalAPayerAllocationsFamiliales','$netAPayer',"
        "'$montantPrisConsiderationCalculCotisationsINSS','$totalDuBrut');");
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

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
      "UPDATE $tableName SET \"nom\"='$nom', \"postNom\"='$postNom', \"prenom\"='$prenom',"
      "\"telephone\"='$telephone', \"adresse\"='$adresse', \"departement\"='$departement',"
      "\"modePaiement\"='$modePaiement', \"salaire\"='$salaire',"
      "\"createdAt\"='$createdAt', \"approbation\"='$approbation',"
      "\"createdAt\"='$createdAt', \"approbation\"='$approbation',"
      "\"createdAt\"='$createdAt', \"approbation\"='$approbation',"
      "\"createdAt\"='$createdAt', \"approbation\"='$approbation',"
      "\"totalDuBrut\"='$totalDuBrut' WHERE id=$id;");
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
      agent: data[0][1],
      observation: data[0][2],
      modePaiement: data[0][3],
      salaire: data[0][4],
      createdAt: data[0][5],
      approbation: data[0][6]
    );
  }
}