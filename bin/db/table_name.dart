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

  // EXPLOITATION
  final projetTable = 'projets';
  final tacheTable = 'taches';

  // LOGISTIQUE
  final anguinTable = 'anguins';
  final carburantTable = 'carburants';
  final entretienTable = 'entretiens';
  final etatMaterielTable = 'etat_materiels';
  final immobilierTable = 'immobiliers';
  final mobilierTable = 'mobiliers';
  final trajetTable = 'trajets';

  // COMMEERCIAL & MARKETING
  final modelTable = 'models_produits';
  final stocksGlobalTable = 'stocks_global';
  final succursaleTable = 'succursales';
  final bonLivraisonTable = 'bon_livraisons';
  final achatTable = 'achats';
  final cartTable = 'carts';




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
          "totalDuBrut" $vachar,
          "signatureDG" $vachar,
          "signatureFinance" $vachar,
          "signatureRH" $vachar
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
          "departement" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp,
          "signature" $vachar
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
          "departement" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp,
          "signature" $vachar
          
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
          "created" $timestamp,
          "signature" $vachar,
          "approbation" $boolean,
          "statutPaie" $boolean
      );
      ''');

      // Finance depenses
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
          "created" $timestamp,
          "signature" $vachar
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
          "created" $timestamp,
          "signature" $vachar,
          "approbation" $boolean,
          "statutPaie" $boolean
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
          "created" $timestamp,
          "signature" $vachar
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
          "created" $timestamp,
          "signature" $vachar
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
          "created" $timestamp,
          "signature" $vachar
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
          "created" $timestamp,
          "signature" $vachar
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
          "created" $timestamp,
          "signature" $vachar
        );
      ''');

      // comptabilite valorisation
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $devisTable(
          "id" $key,
          "title" $vachar,
          "priority" $vachar,
          "departement" $vachar,
          "list" $list,
          "approbation" $boolean,
          "observation" $boolean,
          "signatureDG" $vachar,
          "signatureReception" $vachar,
          "signatureEmission" $vachar,
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
          "created" $timestamp,
          "signature" $vachar
        );
      '''); 
      // Carburant
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $anguinTable(
          "id" $key,
          "qtyEntreSortie" $vachar,
          "typeCaburant" $vachar,
          "fournisseur" $vachar,
          "nomeroFactureAchat" $vachar,
          "prixAchatParLitre" $vachar,
          "nomReceptioniste" $vachar,
          "numeroPlaque" $vachar,
          "dateHeureSortieAnguin" $timestamp,
          "nomeroPLaque" $vachar,
          "created" $timestamp,
          "signature" $vachar
        );
      ''');
      // Entretien
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $anguinTable(
          "id" $key,
          "nom" $vachar,
          "modele" $vachar,
          "marque" $vachar,
          "etatObjet" $vachar,
          "objetRemplace" $list,
          "dureeTravaux" $vachar,
          "created" $timestamp,
          "signature" $vachar
        );
      '''); 
      // EtatMateriel
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $anguinTable(
          "id" $key,
          "nom" $vachar,
          "modele" $vachar,
          "marque" $vachar,
          "typeObjet" $vachar,
          "statut" $list,
          "created" $timestamp,
          "signature" $vachar
        );
      '''); 
      // Immobilier
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $anguinTable(
          "id" $key,
          "typeAllocation" $vachar,
          "adresse" $vachar,
          "numeroCertificat" $vachar,
          "superficie" $vachar,
          "dateAcquisition" $timestamp,
          "created" $timestamp,
          "signature" $vachar
        );
      '''); 
      // Mobilier
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $anguinTable(
          "id" $key,
          "nom" $vachar,
          "modele" $vachar,
          "marque" $vachar,
          "descriptionMobilier" $vachar,
          "nombre" $vachar,
          "created" $timestamp,
          "signature" $vachar
        );
      '''); 
       await connection.query('''
        CREATE TABLE IF NOT EXISTS $anguinTable(
          "id" $key,
          "nomeroEntreprise" $vachar,
          "nomUtilisateur" $vachar,
          "trajetDe" $vachar,
          "trajetA" $vachar,
          "mission" $vachar,
          "kilometrageSorite" $vachar,
          "kilometrageRetour" $vachar,
          "created" $timestamp,
          "signature" $vachar
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
          "resources" $vachar,
          "responsabilite" $vachar,
          "communication" $vachar,
          "processusVerification" $vachar,
          "problemePotientEtRisque" $vachar,
          "dateDebutEtFin" $vachar,
          "budgetDetail" $vachar,
          "recetteAttendus" $vachar,
          "listAgentEtRole" $list,
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
          "telephone" $vachar,
          "succursale" $vachar,
          "nameBusiness" $vachar,
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
        "created" $timestamp,
        "telephone" $vachar,
        "succursale" $vachar,
        "nameBusiness" $vachar,
        "tva" $vachar,
        "qtyRavitailler" $vachar
    );
    ''');
    // Succursale
    await connection.query('''
        CREATE TABLE IF NOT EXISTS $succursaleTable(
          "id" $key,
          "name" $vachar,
          "adresse" $vacharNull,
          "pays" $vachar,
          "nameBusiness" $vachar,
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
        "created" $timestamp,
        "firstName" $vachar,
        "lastName" $vachar,
        "telephone" $vachar,
        "succursale" $vachar,
        "nameBusiness" $vachar,
        "tva" $vachar,
        "remise" $vachar,
        "qtyRemise" $vachar,
        "accuseReception" $boolean,
        "accuseReceptionFirstName" $vachar,
        "accuseReceptionLastName" $vachar
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
        "created" $timestamp,
        "telephone" $vachar,
        "succursale" $vachar,
        "nameBusiness" $vachar,
        "tva" $vachar,
        "remise" $vachar,
        "qtyRemise" $vachar,
        "qtyLivre" $vachar
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
          "created" $timestamp,
          "telephone" $vachar,
          "succursale" $vachar,
          "nameBusiness" $vachar,
          "tva" $vachar,
          "remise" $vachar,
          "qtyRemise" $vachar
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
