import 'package:postgres/postgres.dart';

import 'comm_marketing/commercial/achats_repository.dart';
import 'comm_marketing/commercial/bon_livraison_repository.dart';
import 'comm_marketing/commercial/cart_repository.dart';
import 'comm_marketing/commercial/creance_repository.dart';
import 'comm_marketing/commercial/facture_cart_repository.dart';
import 'comm_marketing/commercial/number_facture_repository.dart';
import 'comm_marketing/commercial/produit_model_repository.dart';
import 'comm_marketing/commercial/stocks_global_repository.dart';
import 'comm_marketing/commercial/succursale_repository.dart';
import 'comptabilites/amrtissement_repository.dart';
import 'comptabilites/bilan_repository.dart';
import 'comptabilites/journal_repository.dart';
import 'comptabilites/valorisation_repository.dart';
import 'devis/devis_repository.dart';
import 'exploitations/projet_repository.dart';
import 'exploitations/tache_repository.dart';
import 'finances/banque_repository.dart';
import 'finances/caissses_repository.dart';
import 'finances/creances_repository.dart';
import 'finances/depenses_repository.dart';
import 'finances/dettes_repository.dart';
import 'finances/fin_exterieur_repository.dart';
import 'logistiques/anguin_repository.dart';
import 'logistiques/carburant_repository.dart';
import 'logistiques/entretien_reposiotory.dart';
import 'logistiques/etat_materiel_repository.dart';
import 'logistiques/immobilier_repository.dart';
import 'logistiques/mobilier_repository.dart';
import 'logistiques/trajet_repository.dart';
import 'rh/agents_repository.dart';
import 'rh/paiement_divers_repository.dart';
import 'rh/paiement_salaire_repository.dart';
import 'rh/performence_repository.dart';
import 'rh/presence_repository.dart';
import 'user/refresh_token_repository.dart';
import 'user/user_repository.dart';

class Repository {
  final PostgreSQLConnection executor;
  late RefreshTokensRepository refreshTokens;
  late UserRepository users;

  // RH
  late AgentsRepository agents;
  late PaiementSalaireRepository salaires;
  late PaiementDiversRepository paiementDivers;
  late PresenceRepository presences;
  late PerformenceRepository performences;

  // FINANCES
  late BanqueRepository banques;
  late CaissesRepository caisses;
  late CreancesRepository creances;
  late DepensesRepository depenses;
  late DettesRepository dettes;
  late FinExteRepository finExterieurs;
  late AmortissementRepository amortissements;
  late BilanRepository bilans;
  late JournalRepository journals;
  late ValorisationRepository valorisations;
  late DevisRepository devis;

  // EXPLOITAIONS
  late ProjetRepository projets;
  late TacheRepository taches;

  // LOGISTIQUE
  late AnguinRepository anguins;
  late CarburantRepository carburants;
  late EntretienRepository entretiens;
  late EtaMaterielRepository etatMateriels;
  late ImmobilierRepository immobiliers;
  late MobilierRepository mobiliers;
  late TrajetRepository trajets;

  // COMMERCIAL & MARKETING
  late ProduitModelRepository produitModel;
  late StockGlobalRepository stocksGlobal;
  late SuccursaleRepository succursales;
  late BonLivraisonRepository bonLivraison;
  late AchatsRepository achats;
  late CartRepository carts;
  late FactureRepository factures;
  late CreanceFactureRepository creancesFacture;
  late NumberFactureRepository numberFacture;

  Repository(this.executor) {
    refreshTokens = RefreshTokensRepository(executor, 'refresh_tokens');
    users = UserRepository(executor, 'users');
    // RH
    agents = AgentsRepository(executor, 'agents');
    salaires = PaiementSalaireRepository(executor, 'salaires');
    paiementDivers = PaiementDiversRepository(executor, 'paiement_divers');
    presences = PresenceRepository(executor, 'presences');
    performences = PerformenceRepository(executor, 'performences');
    // FINANCES
    banques = BanqueRepository(executor, 'banques');
    caisses = CaissesRepository(executor, 'caisses');
    creances = CreancesRepository(executor, 'creances');
    depenses = DepensesRepository(executor, 'depenses');
    dettes = DettesRepository(executor, 'dettes');
    finExterieurs = FinExteRepository(executor, 'fin_exterieurs');
    amortissements = AmortissementRepository(executor, 'amortissements');
    bilans = BilanRepository(executor, 'bilans');
    journals = JournalRepository(executor, 'journals');
    valorisations = ValorisationRepository(executor, 'valorisations');
    devis = DevisRepository(executor, 'devis');

    // EXPLOITAIONS
    projets = ProjetRepository(executor, 'projets');
    taches = TacheRepository(executor, 'taches');

    // LOGISTIQUE
    anguins = AnguinRepository(executor, 'anguins');
    carburants = CarburantRepository(executor, 'carburants');
    entretiens = EntretienRepository(executor, 'entretiens');
    etatMateriels = EtaMaterielRepository(executor, 'etat_materiels');
    immobiliers = ImmobilierRepository(executor, 'immobiliers');
    mobiliers = MobilierRepository(executor, 'mobiliers');
    trajets = TrajetRepository(executor, 'trajets');

    // COMMERCIAL & MARKETING
    produitModel = ProduitModelRepository(executor, 'models_produits');
    stocksGlobal = StockGlobalRepository(executor, 'stocks_global');
    succursales = SuccursaleRepository(executor, 'succursales');
    bonLivraison = BonLivraisonRepository(executor, 'bon_livraisons');
    achats = AchatsRepository(executor, 'achats');
    carts = CartRepository(executor, 'carts');
    factures = FactureRepository(executor, 'factures');
    creancesFacture = CreanceFactureRepository(executor, 'creance_factures');
    numberFacture = NumberFactureRepository(executor, 'number_factures');
  }
}
