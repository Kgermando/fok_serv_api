import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';

class TableName {
  // variable Type database
  final key = 'serial primary key NOT NULL';
  final vachar = 'VARCHAR NOT NULL';
  final vacharNull = 'VARCHAR NULL';
  final timestamp = 'TIMESTAMP NOT NULL';
  final list = 'JSON NULL';
  final boolean = 'BOOLEAN NOT NULL';

  // Tables
  // RH
  final tableToken = 'refresh_tokens';
  final tableUser = 'users';
  final tableAgents = 'agents';
  final tableSalaire = 'salaires';
  final tablePaiementDivers = 'paiement_divers';
  final tablePresence = 'presences';
  final tablePerformence = 'performences';

  // FINANCES
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
  final devisTable = 'devis';
  final departementBudgetTable = 'departement_budgets';
  final ligneBudgetaireTable = 'ligne_budgetaires';

  // EXPLOITATION
  final projetTable = 'projets';
  final tacheTable = 'taches';
  final virementTable = 'versement_projets';

  // LOGISTIQUE
  final anguinTable = 'anguins';
  final carburantTable = 'carburants';
  final entretienTable = 'entretiens';
  final etatMaterielTable = 'etat_materiels';
  final immobilierTable = 'immobiliers';
  final mobilierTable = 'mobiliers';
  final trajetTable = 'trajets';



  // COMMERCIAL & MARKETING
  final modelTable = 'models_produits';
  final stocksGlobalTable = 'stocks_global';
  final succursaleTable = 'succursales';
  final bonLivraisonTable = 'bon_livraisons';
  final achatTable = 'achats';
  final cartTable = 'carts';
  final factureTable = 'factures';
  final creanceFactureTable = 'creance_factures';
  final numberFactureTable = 'number_factures';
  final venteTable = 'ventes';
  final gainTable = 'gains';
  final restitutionTable = 'restitutions';
  final agendaTable = 'agendas';
  final annuaireTable = 'annuaires';


  // ARCHIVE
  final archivesTable = 'archives';


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
          "departement" $vachar,
          "servicesAffectation" $vachar,
          "fonctionOccupe" $vachar,
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
          "salaire" $vachar,
          "signature" $vachar,
          "created" $timestamp
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
          "totalDuBrut" $vachar,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar
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

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
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
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
      );
      ''');

      // Finance banque
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $banquesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "resources" $vachar,
          "departement" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
      );
      ''');

      // Finance CAissse
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $caissesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "resources" $vachar,
          "departement" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
      );
      ''');

      // Finance Creance
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $creancesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "numeroOperation" $vachar,
          "statutPaie" $boolean,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
          
      );
      ''');

      // Finance dettes
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $dettesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "numeroOperation" $vachar,
          "statutPaie" $boolean,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // Finance fin ext
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

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // comptabilite amortissement
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $amortissementsTable(
          "id" $key,
          "titleArmotissement" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeJournal" $vachar,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // comptabilite ilans
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $bilansTable(
          "id" $key,
          "titleBilan" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeBilan" $vachar,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // comptabilite journals
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $journalsTable(
          "id" $key,
          "titleBilan" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeJournal" $vachar,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // comptabilite valorisation
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $valorisationTable(
          "id" $key,
          "numeroOrdre" $vachar,
          "intitule" $vachar,
          "quantite" $vachar,
          "prixUnitaire" $vachar,
          "prixTotal" $vachar,
          "source" $vachar,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // Devis
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $devisTable(
          "id" $key,
          "title" $vachar,
          "priority" $vachar,
          "departement" $vachar,
          "list" $list,
          "ligneBudgtaire" $vachar,
          "resources" $vachar,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // Departement Budget
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $ligneBudgetaireTable(
          "id" $key,
          "departement" $vachar,
          "periodeBudget" $vachar,
          "totalGlobalDispo" $vachar,
          "totalGlobalFinExt" $vachar,
          "totalGlobalPrevisionel" $vachar,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,

          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,

          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,

          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,

          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // Ligne Budgetaire
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $ligneBudgetaireTable(
          "id" $key,
          "nomLigneBudgetaire" $vachar,
          "departement" $vachar,
          "periodeBudget" $vachar,
          "uniteChoisie" $vachar,
          "nombreUnite" $vachar,
          "coutUnitaire" $vachar,
          "coutTotal" $vachar,
          "caisse" $vachar,
          "banque" $vachar,
          "finPropre" $vachar,
          "finExterieur" $vachar,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // Anguin
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $anguinTable(
          "id" $key,
          "nom" $vachar,
          "modele" $vachar,
          "marque" $vachar,
          "numeroChassie" $vachar,
          "couleur" $vachar,
          "genre" $vachar,
          "qtyMaxReservoir" $vachar,
          "dateFabrication" $timestamp,
          "nomeroPLaque" $vachar,
          "nomeroEntreprise" $vachar,
          "kilometrageInitiale" $vachar,
          "provenance" $vachar,
          "typeCaburant" $vachar,
          "typeMoteur" $vachar,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      '''); 
      // Carburant
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $carburantTable(
          "id" $key,
          "operationEntreSortie" $vachar,
          "typeCaburant" $vachar,
          "fournisseur" $vachar,
          "nomeroFactureAchat" $vachar,
          "prixAchatParLitre" $vachar,
          "nomReceptioniste" $vachar,
          "numeroPlaque" $vachar,
          "dateHeureSortieAnguin" $timestamp,
          "qtyAchat" $vachar,

          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp

        );
      ''');
      // Entretien
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $entretienTable(
          "id" $key,
          "nom" $vachar,
          "modele" $vachar,
          "marque" $vachar,
          "etatObjet" $vachar,
          "objetRemplace" $list,
          "dureeTravaux" $vachar,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      '''); 
      // EtatMateriel
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $etatMaterielTable(
          "id" $key,
          "nom" $vachar,
          "modele" $vachar,
          "marque" $vachar,
          "typeObjet" $vachar,
          "statut" $vachar,
          
          "approbationDG" $vachar, 
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      '''); 
      // Immobilier
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $immobilierTable(
          "id" $key,
          "typeAllocation" $vachar,
          "adresse" $vachar,
          "numeroCertificat" $vachar,
          "superficie" $vachar,
          "dateAcquisition" $timestamp,
          
          "approbationDG" $vachar, 
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      '''); 
      // Mobilier
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $mobilierTable(
          "id" $key,
          "nom" $vachar,
          "modele" $vachar,
          "marque" $vachar,
          "descriptionMobilier" $vachar,
          "nombre" $vachar,
          
          "approbationDG" $vachar, 
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      '''); 
      // Trajet
       await connection.query('''
        CREATE TABLE IF NOT EXISTS $trajetTable(
          "id" $key,
          "nomeroEntreprise" $vachar,
          "nomUtilisateur" $vachar,
          "trajetDe" $vachar,
          "trajetA" $vachar,
          "mission" $vachar,
          "kilometrageSorite" $vachar,
          "kilometrageRetour" $vachar,
          
          "approbationDG" $vachar, 
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      '''); 

      // Projets
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $projetTable(
          "id" $key,
          "nomProjet" $vachar,
          "responsable" $vachar,
          "objectifs" $vachar,
          "description" $vachar,
          "ligneBudgtaire" $vachar,
          "resources" $vachar,
          "responsabilite" $vachar,
          "communication" $vachar,
          "processusVerification" $vachar,
          "problemePotientEtRisque" $vachar,
          "dateDebutEtFin" $vachar,
          "budgetDetail" $vachar,
          "recetteAttendus" $vachar,
          "listAgentEtRole" $list,
          
          "approbationDG" $vachar, 
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      '''); 

      // Taches
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tacheTable(
          "id" $key,
          "nomProjet" $vachar,
          "numeroTache" $vachar,
          "agent" $vachar,
          "jalon" $vachar,
          "tache" $vachar,
          "realisations" $vachar,
          "signatureResp" $vachar,
          "signatureAgent" $vachar,
          "created" $timestamp,
          "reponduDate" $timestamp,
          "reponseDate" $vachar,
          "soumettre" $boolean
        );
      '''); 

      // Taches
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $virementTable(
          "id" $key,
          "nomProjet" $vachar,
          "pieceJustificative" $vachar,
          "montantVerser" $vachar,
          "montantEnLettre" $vachar,
          "typeVersement" $vachar,
          "signature" $vachar,
          "created" $vachar
        );
      '''); 


      // Produit model
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $modelTable(
          "id" $key,
          "categorie" $vachar,
          "sousCategorie1" $vachar,
          "sousCategorie2" $vachar,
          "sousCategorie3" $vachar,
          "sousCategorie4" $vachar,
          "idProduct" $vachar,

          "approbationDG" $vachar, 
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');
    // Stock global
    await connection.query('''
      CREATE TABLE IF NOT EXISTS $stocksGlobalTable(
        "id" $key,
        "idProduct" $vachar,
        "quantity" $vachar,
        "quantityAchat" $vachar,
        "priceAchatUnit" $vachar,
        "prixVenteUnit" $vachar,
        "unite" $vachar,
        "modeAchat" $boolean,
        "tva" $vachar,
        "qtyRavitailler" $vachar,

        "approbationDG" $vachar, 
        "signatureDG" $vachar,
        "signatureJustificationDG" $vachar,
        "approbationFin" $vachar,
        "signatureFin" $vachar,
        "signatureJustificationFin" $vachar,
        "approbationBudget" $vachar,
        "signatureBudget" $vachar,
        "signatureJustificationBudget" $vachar,
        "approbationDD" $vachar,
        "signatureDD" $vachar,
        "signatureJustificationDD" $vachar,
        "signature" $vachar,
        "created" $timestamp

    );
    ''');
    // Succursale
    await connection.query('''
      CREATE TABLE IF NOT EXISTS $succursaleTable(
        "id" $key,
        "name" $vachar,
        "adresse" $vacharNull,
        "province" $vachar,
          
        "approbationDG" $vachar, 
        "signatureDG" $vachar,
        "signatureJustificationDG" $vachar,
        "approbationFin" $vachar,
        "signatureFin" $vachar,
        "signatureJustificationFin" $vachar,
        "approbationBudget" $vachar,
        "signatureBudget" $vachar,
        "signatureJustificationBudget" $vachar,
        "approbationDD" $vachar,
        "signatureDD" $vachar,
        "signatureJustificationDD" $vachar,
        "signature" $vachar,
        "created" $timestamp
      );
      ''');
    // Bon de livraison
    await connection.query('''
      CREATE TABLE IF NOT EXISTS $bonLivraisonTable(
        "id" $key,
        "idProduct" $vachar,
        "quantityAchat" $vachar,
        "priceAchatUnit" $vachar,
        "prixVenteUnit" $vachar,
        "unite" $vachar,
        "firstName" $vachar,
        "lastName" $vachar,
        "tva" $vachar,
        "remise" $vachar,
        "qtyRemise" $vachar,
        "accuseReception" $boolean,
        "accuseReceptionFirstName" $vachar,
        "accuseReceptionLastName" $vachar,

        "approbationDG" $vachar, 
        "signatureDG" $vachar,
        "signatureJustificationDG" $vachar,
        "approbationFin" $vachar,
        "signatureFin" $vachar,
        "signatureJustificationFin" $vachar,
        "approbationBudget" $vachar,
        "signatureBudget" $vachar,
        "signatureJustificationBudget" $vachar,
        "approbationDD" $vachar,
        "signatureDD" $vachar,
        "signatureJustificationDD" $vachar,
        "signature" $vachar,
        "created" $timestamp
    );
    ''');
    // Achats
    await connection.query('''
      CREATE TABLE IF NOT EXISTS $achatTable(
        "id" $key,
        "idProduct" $vachar,
        "quantity" $vachar,
        "quantityAchat" $vachar,
        "priceAchatUnit" $vachar,
        "prixVenteUnit" $vachar,
        "unite" $vachar,
        "tva" $vachar,
        "remise" $vachar,
        "qtyRemise" $vachar,
        "qtyLivre" $vachar,

        "approbationDG" $vachar, 
        "signatureDG" $vachar,
        "signatureJustificationDG" $vachar,
        "approbationFin" $vachar,
        "signatureFin" $vachar,
        "signatureJustificationFin" $vachar,
        "approbationBudget" $vachar,
        "signatureBudget" $vachar,
        "signatureJustificationBudget" $vachar,
        "approbationDD" $vachar,
        "signatureDD" $vachar,
        "signatureJustificationDD" $vachar,
        "signature" $vachar,
        "created" $timestamp
    );
    ''');
    // Cart
    await connection.query('''
        CREATE TABLE IF NOT EXISTS $cartTable(
          "id" $key,
          "idProductCart" $vachar,
          "quantityCart" $vachar,
          "priceCart" $vachar,
          "priceAchatUnit" $vachar,
          "unite" $vachar,
          "tva" $vachar,
          "remise" $vachar,
          "qtyRemise" $vachar,

          "approbationDG" $vachar, 
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp
      );
      ''');
      // Facture
      await connection.query('''
          CREATE TABLE IF NOT EXISTS $factureTable(
            "id" $key,
            "cart" $list,
            "client" $vachar,
          "approbationDG" $vachar, 
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
          "approbationFin" $vachar,
          "signatureFin" $vachar,
          "signatureJustificationFin" $vachar,
          "approbationBudget" $vachar,
          "signatureBudget" $vachar,
          "signatureJustificationBudget" $vachar,
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          "signature" $vachar,
          "created" $timestamp

          );
        '''); 
        // Creance
      await connection.query('''
          CREATE TABLE IF NOT EXISTS $creanceFactureTable(
            "id" $key,
            "cart" $list,
            "client" $vachar,

            "approbationDG" $vachar, 
            "signatureDG" $vachar,
            "signatureJustificationDG" $vachar,
            "approbationFin" $vachar,
            "signatureFin" $vachar,
            "signatureJustificationFin" $vachar,
            "approbationBudget" $vachar,
            "signatureBudget" $vachar,
            "signatureJustificationBudget" $vachar,
            "approbationDD" $vachar,
            "signatureDD" $vachar,
            "signatureJustificationDD" $vachar,
            "signature" $vachar,
            "created" $timestamp
          );
        ''');
      // Number facture
      await connection.query('''
      CREATE TABLE IF NOT EXISTS $numberFactureTable(
        "id" $key,
        "number" $vachar,

        "approbationDG" $vachar, 
        "signatureDG" $vachar,
        "signatureJustificationDG" $vachar,
        "approbationFin" $vachar,
        "signatureFin" $vachar,
        "signatureJustificationFin" $vachar,
        "approbationBudget" $vachar,
        "signatureBudget" $vachar,
        "signatureJustificationBudget" $vachar,
        "approbationDD" $vachar,
        "signatureDD" $vachar,
        "signatureJustificationDD" $vachar,
        "signature" $vachar,
        "created" $timestamp
    );
    ''');
    // Ventes
    await connection.query('''
      CREATE TABLE IF NOT EXISTS $venteTable(
        "id" $key,
        "idProductCart" $vachar,
        "quantityCart" $vachar,
        "priceTotalCart" $vachar,
        "unite" $vachar,
        "tva" $vachar,
        "remise" $vachar,
        "qtyRemise" $vachar,

        "approbationDG" $vachar, 
        "signatureDG" $vachar,
        "signatureJustificationDG" $vachar,
        "approbationFin" $vachar,
        "signatureFin" $vachar,
        "signatureJustificationFin" $vachar,
        "approbationBudget" $vachar,
        "signatureBudget" $vachar,
        "signatureJustificationBudget" $vachar,
        "approbationDD" $vachar,
        "signatureDD" $vachar,
        "signatureJustificationDD" $vachar,
        "signature" $vachar,
        "created" $timestamp
        
      );
      ''');
      // Gain
      await connection.query('''
      CREATE TABLE IF NOT EXISTS $gainTable(
        "id" $key,
        "sum" FLOAT4 NOT NULL,
        
        "approbationDG" $vachar, 
        "signatureDG" $vachar,
        "signatureJustificationDG" $vachar,
        "approbationFin" $vachar,
        "signatureFin" $vachar,
        "signatureJustificationFin" $vachar,
        "approbationBudget" $vachar,
        "signatureBudget" $vachar,
        "signatureJustificationBudget" $vachar,
        "approbationDD" $vachar,
        "signatureDD" $vachar,
        "signatureJustificationDD" $vachar,
        "signature" $vachar,
        "created" $timestamp
    );
    ''');
    // Restitution
    await connection.query('''
      CREATE TABLE IF NOT EXISTS $restitutionTable(
        "id" $key,
        "idProduct" $vachar,
        "quantity" $vachar,
        "unite" $vachar,
        "firstName" $vachar,
        "lastName" $vachar,
        "telephone" $vachar,
        "succursale" $vachar,
        "nameBusiness" $vachar,
        "accuseReception" $boolean,
        "accuseReceptionFirstName" $vachar,
        "accuseReceptionLastName" $vachar,
        "role" $vachar,

        "approbationDG" $vachar, 
        "signatureDG" $vachar,
        "signatureJustificationDG" $vachar,
        "approbationFin" $vachar,
        "signatureFin" $vachar,
        "signatureJustificationFin" $vachar,
        "approbationBudget" $vachar,
        "signatureBudget" $vachar,
        "signatureJustificationBudget" $vachar,
        "approbationDD" $vachar,
        "signatureDD" $vachar,
        "signatureJustificationDD" $vachar,
        "signature" $vachar,
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
