import 'package:postgres/postgres.dart';
 
import 'approbation/approbation.repository.dart';
import 'archives/archive_folder_repository.dart';
import 'archives/archive_repository.dart';
import 'budgets/departement_budget_repository.dart';
import 'budgets/ligne_budgetaire_repository.dart';
import 'comm_marketing/commercial/achats_repository.dart';
import 'comm_marketing/commercial/bon_livraison_repository.dart';
import 'comm_marketing/commercial/cart_repository.dart';
import 'comm_marketing/commercial/creance_repository.dart';
import 'comm_marketing/commercial/facture_cart_repository.dart';
import 'comm_marketing/commercial/gain_repository.dart';
import 'comm_marketing/commercial/history_livraison_repository.dart';
import 'comm_marketing/commercial/history_ravitraillement_repository.dart';
import 'comm_marketing/commercial/number_facture_repository.dart';
import 'comm_marketing/commercial/produit_model_repository.dart';
import 'comm_marketing/commercial/restitution_repository.dart';
import 'comm_marketing/commercial/stocks_global_repository.dart';
import 'comm_marketing/commercial/succursale_repository.dart';
import 'comm_marketing/commercial/vente_repository.dart';
import 'comm_marketing/marketing/agenda_repository.dart';
import 'comm_marketing/marketing/annuaire_repository.dart';
import 'comm_marketing/marketing/campaign_repository.dart';
import 'comptabilites/balance_compte_repository.dart';
import 'comptabilites/bilan_repository.dart';
import 'comptabilites/compte_actif_repository.dart';
import 'comptabilites/compte_balance_ref_repository.dart';
import 'comptabilites/compte_passif_repository.dart';
import 'comptabilites/compte_resultat_repository.dart';
import 'comptabilites/journal_repository.dart';
import 'devis/devis_ist_objet_repository.dart';
import 'devis/devis_repository.dart';
import 'exploitations/agent_role_repository.dart';
import 'exploitations/projet_repository.dart';
import 'exploitations/rapport_repository.dart';
import 'exploitations/tache_repository.dart';
import 'exploitations/versement_projet_repository.dart';
import 'finances/banque_repository.dart';
import 'finances/caissses_repository.dart';
import 'finances/creance_dette_repository.dart';
import 'finances/creances_repository.dart';
import 'finances/dettes_repository.dart';
import 'finances/fin_exterieur_repository.dart';
import 'logistiques/anguin_repository.dart';
import 'logistiques/carburant_repository.dart';
import 'logistiques/entretien_reposiotory.dart';
import 'logistiques/etat_materiel_repository.dart';
import 'logistiques/immobilier_repository.dart';
import 'logistiques/mobilier_repository.dart';
import 'logistiques/objet_remplace_reposiotory.dart';
import 'logistiques/trajet_repository.dart';
import 'mails/mail_repository.dart';
import 'rh/agents_repository.dart';
import 'rh/paiement_salaire_repository.dart';
import 'rh/performence_repository.dart';
import 'rh/performence_note_repository.dart';
import 'rh/presence_entrer_repository.dart';
import 'rh/presence_repository.dart';
import 'rh/presence_sortie_repository.dart';
import 'rh/trans_rest_agents_repository.dart';
import 'rh/transport_restauration_repository.dart';
import 'user/refresh_token_repository.dart';
import 'user/user_repository.dart';

class Repository {
  final PostgreSQLConnection executor;
  late RefreshTokensRepository refreshTokens;
  late UserRepository users;

  // RH
  late AgentsRepository agents;
  late PaiementSalaireRepository salaires;
  late PresenceRepository presences;
  late PresenceEntrerRepository presencesEntrer;
  late PresenceSortieRepository presencesSortie;
  late PerformenceRepository performences;
  late PerformenceNoteRepository performencesNote;
  late TasnportRestaurationRepository transportRestauration;
  late TransRestAgentsRepository transRestAgents;

  // Devis
  late DevisRepository devis;
  late DevisListObjetRepository devisListObjets;

  // FINANCES
  late BanqueRepository banques;
  late CaissesRepository caisses;
  late CreancesRepository creances;
  late DettesRepository dettes;
  late FinExteRepository finExterieurs;
  late CreanceDetteRepository creanceDette;

  // COMPTABILITES
  late BilanRepository bilans;
  late CompteActifRepository compteActif;
  late ComptePassifRepository comptePassif;
  late JournalRepository journals;
  late CompteResultatRepository comptesResultat;
  late BalanceCompteRepository balanceComptes;
  late CompteBalanceRefRepository balanceCompteRef;

  // BUDGETS
  late DepartementBudgetRepository departementBudgets;
  late LigneBudgtaireRepository ligneBudgetaires;

  // EXPLOITAIONS
  late ProjetRepository projets;
  late TacheRepository taches;
  late VersementProjetRepository versementProjets;
  late RapportRepository rapports;
  late AgentRoleRepository agentsRoles;

  // LOGISTIQUE
  late AnguinRepository anguins;
  late CarburantRepository carburants;
  late EntretienRepository entretiens;
  late EtaMaterielRepository etatMateriels;
  late ImmobilierRepository immobiliers;
  late MobilierRepository mobiliers;
  late TrajetRepository trajets;
  late ObjetRemplaceRepository objetsRemplace;

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
  late VenteRepository ventes;
  late GainRepository gains;
  late RestitutionRepository restitutions;
  late AgendaRepository agendas;
  late AnnuaireReposiotry annuaires;
  late CampaignRepository campaigns;
  late HistoryRavitaillementRepository historyRavitaillements;
  late HistoryLivraisonRepository historyLivraisons;

  // Archive
  late ArchiveRepository archives;
  late ArchiveFolderRepository archivesFolders;

  // Mails
  late MailRepository mails;

  // APPROBATION
  late ApprobationRepository approbations;

  Repository(this.executor) {
    refreshTokens = RefreshTokensRepository(executor, 'refresh_tokens');
    users = UserRepository(executor, 'users');
    // RH
    agents = AgentsRepository(executor, 'agents');
    salaires = PaiementSalaireRepository(executor, 'salaires');
    presences = PresenceRepository(executor, 'presences');
    presencesEntrer = PresenceEntrerRepository(executor, 'presences_entrer');
    presencesSortie = PresenceSortieRepository(executor, 'presences_sortie');
    performences = PerformenceRepository(executor, 'performences');
    performencesNote = PerformenceNoteRepository(executor, 'performences_note');
    transportRestauration =
        TasnportRestaurationRepository(executor, 'transport_restaurations');
    transRestAgents = TransRestAgentsRepository(executor, 'trans_rest_agents');

    // DEVIS
    devis = DevisRepository(executor, 'devis');
    devisListObjets = DevisListObjetRepository(executor, 'devis_list_objets');

    // FINANCES
    banques = BanqueRepository(executor, 'banques');
    caisses = CaissesRepository(executor, 'caisses');
    creances = CreancesRepository(executor, 'creances');
    dettes = DettesRepository(executor, 'dettes');
    finExterieurs = FinExteRepository(executor, 'fin_exterieurs');
    creanceDette = CreanceDetteRepository(executor, 'creance_dettes');

    // COMPTABILITE
    bilans = BilanRepository(executor, 'bilans');
    compteActif = CompteActifRepository(executor, 'compte_actifs');
    comptePassif = ComptePassifRepository(executor, 'compte_passifs');
    journals = JournalRepository(executor, 'journals');
    comptesResultat = CompteResultatRepository(executor, 'comptes_resultat');
    balanceComptes = BalanceCompteRepository(executor, 'balance_comptes');
    balanceCompteRef = CompteBalanceRefRepository(executor, 'comptes_balances_ref');

    // BUDGETS
    departementBudgets =
        DepartementBudgetRepository(executor, 'departement_budgets');
    ligneBudgetaires = LigneBudgtaireRepository(executor, 'ligne_budgetaires');

    // EXPLOITAIONS
    projets = ProjetRepository(executor, 'projets');
    taches = TacheRepository(executor, 'taches');
    versementProjets = VersementProjetRepository(executor, 'versement_projets');
    rapports = RapportRepository(executor, 'rapports');
    agentsRoles = AgentRoleRepository(executor, 'agents_roles');

    // LOGISTIQUE
    anguins = AnguinRepository(executor, 'anguins');
    carburants = CarburantRepository(executor, 'carburants');
    entretiens = EntretienRepository(executor, 'entretiens');
    etatMateriels = EtaMaterielRepository(executor, 'etat_materiels');
    immobiliers = ImmobilierRepository(executor, 'immobiliers');
    mobiliers = MobilierRepository(executor, 'mobiliers');
    trajets = TrajetRepository(executor, 'trajets');
    objetsRemplace = ObjetRemplaceRepository(executor, 'objets_remplace');

    // COMMERCIAL & MARKETING
    produitModel = ProduitModelRepository(executor, 'produits_model');
    stocksGlobal = StockGlobalRepository(executor, 'stocks_global');
    succursales = SuccursaleRepository(executor, 'succursales');
    bonLivraison = BonLivraisonRepository(executor, 'bon_livraisons');
    achats = AchatsRepository(executor, 'achats');
    carts = CartRepository(executor, 'carts');
    factures = FactureRepository(executor, 'factures');
    creancesFacture = CreanceFactureRepository(executor, 'creance_factures');
    numberFacture = NumberFactureRepository(executor, 'number_factures');
    ventes = VenteRepository(executor, 'ventes');
    gains = GainRepository(executor, 'gains');
    restitutions = RestitutionRepository(executor, 'restitutions');
    agendas = AgendaRepository(executor, 'agendas');
    annuaires = AnnuaireReposiotry(executor, 'annuaires');
    campaigns = CampaignRepository(executor, 'campaigns');
    historyRavitaillements =
        HistoryRavitaillementRepository(executor, 'history_ravitaillements');
    historyLivraisons =
        HistoryLivraisonRepository(executor, 'history_livraisons');

    // ARCHIVE
    archives = ArchiveRepository(executor, 'archives');
    archivesFolders = ArchiveFolderRepository(executor, 'archives_folders');

    // Mails
    mails = MailRepository(executor, 'mails');

    // APPROBATION
    approbations = ApprobationRepository(executor, 'approbations');
  }
}
