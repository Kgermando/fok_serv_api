import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';

class TableName {
  // Tables
  final tableToken = 'refresh_tokens';
  final tableUser = 'users';
  final tableAgents = 'agents';
  final tableSalaire = 'salaires';
  final tablePaiementDivers = 'paiement_divers';
  final tablePresence = 'presences';
  final tablePerformence = 'performences';
  final banquesTable = 'banques';
  final caissesTable = 'caisses';
  final creancesTable = 'creances';
  final depensesTable = 'depenses';
  final dettesTable = 'dettes';
  final finExterieursTable = 'fin_exterieurs';
  final amortissementsTable = 'amortissements';
  final bilansTable = 'bilans';
  final journalsTable = 'journals';
  final valorisationTable = 'valorisations';
  
  // Type database
  final key = 'serial primary key NOT NULL';
  final vachar = 'VARCHAR NOT NULL';
  final timestamp = 'TIMESTAMP NOT NULL';
  final list = 'JSON NULL';
  final boolean = 'BOOLEAN NOT NULL';

  Future openConnection(PostgreSQLConnection connection) async {
    try {
      await connection.open();

      // Token
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tableToken(
          "id" $key,
          "owner" $vachar,
          "token" $vachar
      );
      ''');

      // User
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tableUser(
          "id" $key,
          "photo" $vachar,
          "nom" $vachar,
          "prenom" $vachar,
          "matricule" $vachar,
          "role" $vachar,
          "isOnline" $boolean,
          "createdAt" $timestamp,
          "passwordHash" $vachar
      );
      ''');


      // Agent
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tableAgents(
          "id" $key,
          "nom" $vachar,
          "postNom" $vachar,
          "prenom" $vachar,
          "email" $vachar,
          "telephone" $vachar,
          "adresse" $vachar,
          "sexe" $vachar,
          "role" $vachar,
          "matricule" $vachar,
          "numeroSecuriteSociale" $vachar,
          "dateNaissance" $timestamp,
          "lieuNaissance" $vachar,
          "nationalite" $vachar,
          "typeContrat" $vachar,
          "departement" $vachar,
          "servicesAffectation" $vachar,
          "dateDebutContrat" $timestamp,
          "dateFinContrat" $timestamp,
          "fonctionOccupe" $vachar,
          "competance" $vachar,
          "experience" $vachar,
          "statutAgent" $boolean,
          "createdAt" $timestamp,
          "photo" $vachar,
          "salaire" $vachar
      );
      ''');
      
      // Paiement Salaire
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tableSalaire(
          "id" $key,
          "nom" $vachar,
          "postNom" $vachar,
          "prenom" $vachar,
          "telephone" $vachar,
          "adresse" $vachar,
          "departement" $vachar,
          "numeroSecuriteSociale" $vachar,
          "matricule" $vachar,
          "servicesAffectation" $vachar,
          "salaire" $vachar,
          "observation" $boolean,
          "modePaiement" $vachar,
          "createdAt" $timestamp,
          "approbation" $boolean,
          "tauxJourHeureMoisSalaire" $vachar,
          "joursHeuresPayeA100PourecentSalaire" $vachar,
          "totalDuSalaire" $vachar,
          "nombreHeureSupplementaires" $vachar,
          "tauxHeureSupplementaires" $vachar,
          "totalDuHeureSupplementaires" $vachar,
          "supplementTravailSamediDimancheJoursFerie" $vachar,
          "prime" $vachar,
          "divers" $vachar,
          "joursCongesPaye" $vachar,
          "tauxCongesPaye" $vachar,
          "totalDuCongePaye" $vachar,
          "jourPayeMaladieAccident" $vachar,
          "tauxJournalierMaladieAccident" $vachar,
          "totalDuMaladieAccident" $vachar,
          "pensionDeduction" $vachar,
          "indemniteCompensatricesDeduction" $vachar,
          "avancesDeduction" $vachar,
          "diversDeduction" $vachar,
          "retenuesFiscalesDeduction" $vachar,
          "nombreEnfantBeneficaireAllocationsFamiliales" $vachar,
          "nombreDeJoursAllocationsFamiliales" $vachar,
          "tauxJoursAllocationsFamiliales" $vachar,
          "totalAPayerAllocationsFamiliales" $vachar,
          "netAPayer" $vachar,
          "montantPrisConsiderationCalculCotisationsINSS" $vachar,
          "totalDuBrut" $vachar
      );
      ''');

      // Paiement Divers
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tablePaiementDivers(
          "id" $key,
          "agent" $vachar,
          "observation" $boolean,
          "modePaiement" $vachar,
          "titleDivers" $vachar,
          "divers" $vachar,
          "createdAt" $timestamp,
          "approbation" $boolean
      );
      ''');

      // Presence model
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tablePresence(
          "id" $key,
          "agent" $vachar,
          "arrive" $timestamp,
          "sortie" $timestamp,
          "presence" $vachar,
          "motif" $vachar,
          "created" $timestamp
      );
      ''');

      // Performence model
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tablePresence(
          "id" $key,
          "agent" $vachar,
          "hospitalite" $vachar,
          "ponctualite" $vachar,
          "travaille" $vachar,
          "created" $timestamp
      );
      ''');

      
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $banquesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "departement" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $caissesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "departement" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
          
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $creancesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $depensesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "naturePayement" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "modePayement" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $dettesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $finExterieursTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $amortissementsTable(
          "id" $key,
          "titleArmotissement" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeJournal" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $bilansTable(
          "id" $key,
          "titleBilan" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeBilan" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $journalsTable(
          "id" $key,
          "titleBilan" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeJournal" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $valorisationTable(
          "id" $key,
          "numeroOrdre" $vachar,
          "intitule" $vachar,
          "quantite" $vachar,
          "prixUnitaire" $vachar,
          "prixTotal" $vachar,
          "source" $vachar,
          "created" $timestamp
        );
      ''');

      print("Tables created succes!");
      return connection;
    } catch (e) {
      print("TableName: $e");
      return Response(403);
    }
  }
}
