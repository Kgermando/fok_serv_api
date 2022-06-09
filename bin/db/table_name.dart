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
  final float = 'FLOAT8 NOT NULL';

  // Tables
  // RH
  final tableToken = 'refresh_tokens';
  final tableUser = 'users';
  final tableAgents = 'agents';
  final tableSalaire = 'salaires';
  final tablePaiementDivers = 'paiement_divers';
  final tablePresence = 'presences';
  final tablePerformence = 'performences';
  final tablePerformenceNote = 'performences_note';

  // FINANCES
  final banquesTable = 'banques';
  final caissesTable = 'caisses';
  final creancesTable = 'creances';
  final depensesTable = 'depenses';
  final dettesTable = 'dettes';
  final finExterieursTable = 'fin_exterieurs';
  final creanceDetteTable = 'creance_dettes';

  // COMPTABILITE
  final bilansTable = 'bilans';
  final journalsTable = 'journals';
  final comptesResultatTable = 'comptes_resultat';
  final balanceComptesTable = 'balance_comptes';

  // DEVIS
  final devisTable = 'devis';

  // BUDGET
  final departementBudgetTable = 'departement_budgets';
  final ligneBudgetaireTable = 'ligne_budgetaires';

  // EXPLOITATION
  final projetTable = 'projets';
  final tacheTable = 'taches';
  final versementTable = 'versement_projets';
  final rapportTable = 'rapports';

  // LOGISTIQUE
  final anguinTable = 'anguins';
  final carburantTable = 'carburants';
  final entretienTable = 'entretiens';
  final etatMaterielTable = 'etat_materiels';
  final immobilierTable = 'immobiliers';
  final mobilierTable = 'mobiliers';
  final trajetTable = 'trajets';

  // COMMERCIAL & MARKETING
  final modelTable = 'produits_model';
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
  final historyRavitaillementTable = 'history_ravitaillements';
  final historyLivraisonTable = 'history_livraisons';

  final agendaTable = 'agendas';
  final annuaireTable = 'annuaires';
  final campaignTable = 'campaigns';

  // ARCHIVE
  final archivesTable = 'archives';

  // MAIL
  final mailsTable = 'mails';

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
          "email" $vachar,
          "telephone" $vachar,
          "matricule" $vachar,
          "departement" $vachar,
          "servicesAffectation" $vachar,
          "fonctionOccupe" $vachar,
          "role" $vachar,
          "isOnline" $boolean,
          "createdAt" $timestamp,
          "passwordHash" $vachar,
          "succursale" $vachar
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
          "ligneBudgtaire" $vachar,
          "resources" $vachar,
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
          "arrive" $timestamp,
          "arriveAgent" $list,
          "sortie" $timestamp,
          "sortieAgent" $list,
          "remarque" $vachar,
          "finJournee" $boolean,
          "signature" $vachar,
          "created" $timestamp
      );
      ''');

      // Performence model
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tablePerformence(
          "id" $key,
          "agent" $vachar,
          "departement" $vachar,
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
      // Performence model
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tablePerformenceNote(
          "id" $key,
          "agent" $vachar,
          "departement" $vachar,
          "hospitalite" $vachar,
          "ponctualite" $vachar,
          "travaille" $vachar,
          "note" $vachar,
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

      // Finance Creance dette
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $creanceDetteTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "creanceDette" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // comptabilite bilans
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $bilansTable(
          "id" $key,
          "titleBilan" $vachar,
          "comptesActif" $list,
          "comptesPactif" $list,
          "statut" $boolean,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
      
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
          "numeroOperation" $vachar,
          "libele" $vachar,
          "compteDebit" $vachar,
          "montantDebit" $vachar,
          "compteCredit" $vachar,
          "montantCredit" $vachar,
          "tva" $vachar,
          "remarque" $vachar,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
      
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,
          
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // comptabilite Compte resultat
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $comptesResultatTable(
          "id" $key,
          "intitule" $vachar,

          "achatMarchandises" $vachar,
          "variationStockMarchandises" $vachar,
          "achatApprovionnements" $vachar,
          "variationApprovionnements" $vachar,
          "autresChargesExterne" $vachar,
          "impotsTaxesVersementsAssimiles" $vachar,
          "renumerationPersonnel" $vachar,
          "chargesSocialas" $vachar,
          "dotatiopnsProvisions" $vachar,
          "autresCharges" $vachar,
          "chargesfinancieres" $vachar,

          "chargesExptionnelles" $vachar,
          "importSurbenefices" $vachar,
          "soldeCrediteur" $vachar,

          "ventesMarchandises" $vachar,
          "productionVendueBienEtSerices" $vachar,
          "productionStockee" $vachar,
          "productionImmobilisee" $vachar,
          "subventionExploitation" $vachar,
          "autreProduits" $vachar,
          "montantExportation" $vachar,
          "produitfinancieres" $vachar,

          "produitExceptionnels" $vachar,
          "soldeDebiteur" $vachar,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
      
          "approbationDD" $vachar,
          "signatureDD" $vachar,
          "signatureJustificationDD" $vachar,

          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // comptabilite balance comptes
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $balanceComptesTable(
          "id" $key,
          "title" $vachar,
          "comptes" $list,
          "statut" $boolean,
          
          "approbationDG" $vachar,
          "signatureDG" $vachar,
          "signatureJustificationDG" $vachar,
      
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
          "observation" $boolean,
          
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
        CREATE TABLE IF NOT EXISTS $departementBudgetTable(
          "id" $key,
          "title" $vachar,
          "departement" $vachar,
          "periodeDebut" $timestamp,
          "periodeFin" $timestamp,

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
          "typeFinancement" $vachar,
          "observation" $boolean,
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
          "signatureResp" $vachar,
          "created" $timestamp,
          "read" $boolean
        );
      ''');

      // Versement
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $versementTable(
          "id" $key,
          "nomProjet" $vachar,
          "pieceJustificative" $vachar,
          "montantVerser" $vachar,
          "montantEnLettre" $vachar,
          "typeVersement" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // Rapport
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $rapportTable(
          "id" $key,
          "nomProjet" $vachar,
          "numeroTache" $vachar,
          "rapport" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');

      // Agenda
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $agendaTable(
          "id" $key,
          "title" $vachar,
          "description" $vachar,
          "dateRappel" $timestamp, 
          "signature" $vachar,
          "created" $timestamp
        );
      ''');
      // Annuaire
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $annuaireTable(
          "id" $key,
          "categorie" $vachar,
          "nomPostnomPrenom" $vachar,
          "email" $vachar,
          "mobile1" $vachar,
          "mobile2" $vachar,
          "secteurActivite" $vachar,
          "nomEntreprise" $vachar,
          "grade" $vachar,
          "adresseEntreprise" $vachar,
          "succursale" $vachar,
          "signature" $vachar,
          "created" $timestamp
        );
      ''');
      // Campaign
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $campaignTable(
          "id" $key,
          "typeProduit" $vachar,
          "dateDebutEtFin" $vachar,
          "agentAffectes" $list,
          "coutCampaign" $vachar,
          "lieuCible" $vachar,
          "promotion" $vachar,
          "objectifs" $vachar,
          "ligneBudgtaire" $vachar,
          "resources" $vachar,
          "observation" $boolean,
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
        "succursale" $vachar,
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
        "succursale" $vachar,
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
          "succursale" $vachar,
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
          "succursale" $vachar,
          "signature" $vachar,
          "created" $timestamp

          );
        ''');
      // Creance facture
      await connection.query('''
          CREATE TABLE IF NOT EXISTS $creanceFactureTable(
            "id" $key,
            "cart" $list,
            "client" $vachar,
            "succursale" $vachar,
            "signature" $vachar,
            "created" $timestamp
          );
        ''');

      // Number facture
      await connection.query('''
      CREATE TABLE IF NOT EXISTS $numberFactureTable(
        "id" $key,
        "number" $vachar,
        "succursale" $vachar,
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
        "succursale" $vachar,
        "signature" $vachar,
        "created" $timestamp
      );
      ''');

      // Gain
      await connection.query('''
      CREATE TABLE IF NOT EXISTS $gainTable(
        "id" $key,
        "sum" FLOAT4 NOT NULL,
        "succursale" $vachar,
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
        "accuseReception" $boolean,
        "accuseReceptionFirstName" $vachar,
        "accuseReceptionLastName" $vachar,
        "role" $vachar,
        "succursale" $vachar,
        "signature" $vachar,
        "created" $timestamp
    );
    ''');

      // History ravitaillement
      await connection.query('''
      CREATE TABLE IF NOT EXISTS $historyRavitaillementTable(
        "id" $key,
        "idProduct" $vachar,
        "quantity" $vachar,
        "quantityAchat" $vachar,
        "priceAchatUnit" $vachar,
        "prixVenteUnit" $vachar,
        "unite" $vachar,
        "margeBen" $vachar,
        "tva" $vachar,
        "qtyRavitailler" $vachar,
        "succursale" $vachar,
        "signature" $vachar,
        "created" $timestamp

    );
    ''');

      // History livraison
      await connection.query('''
      CREATE TABLE IF NOT EXISTS $historyLivraisonTable(
        "id" $key,
        "idProduct" $vachar,
        "quantity" $vachar,
        "quantityAchat" $vachar,
        "priceAchatUnit" $vachar,
        "prixVenteUnit" $vachar,
        "unite" $vachar,
        "margeBen" $vachar,
        "tva" $vachar,
        "remise" $vachar,
        "qtyRemise" $vachar,
        "margeBenRemise" $vachar,
        "qtyLivre" $vachar,
        "succursale" $vachar,
        "signature" $vachar,
        "created" $timestamp

    );
    ''');

      // Archive
      await connection.query('''
      CREATE TABLE IF NOT EXISTS $archivesTable(
        "id" $key,
        "nomDocument" $vachar,
        "departement" $vachar,
        "description" $vachar,
        "fichier" $vachar,
        "signature" $vachar,
        "created" $timestamp

    );
    ''');

      // Mail
      await connection.query('''
      CREATE TABLE IF NOT EXISTS $mailsTable(
        "id" $key,
        "fullName" $vachar,
        "email" $vachar,
        "cc" $list,
        "objet" $vachar,
        "message" $vachar,
        "pieceJointe" $vachar,
        "read" $boolean,
        "fullNameDest" $vachar,
        "emailDest" $vachar,
        "dateSend" $timestamp,
        "dateRead" $timestamp
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
