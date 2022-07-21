import 'package:postgres/postgres.dart';

import 'administration/actionnaire_cotisation_repository.dart';
import 'administration/actionnaire_repository.dart';
import 'archives/archive_folder_repository.dart';
import 'archives/archive_repository.dart';
import 'budgets/departement_budget_repository.dart';
import 'budgets/ligne_budgetaire_repository.dart';
import 'comm_marketing/commercial/achats_repository.dart';
import 'comm_marketing/commercial/bon_livraison_repository.dart';
import 'comm_marketing/commercial/cart_repository.dart';
import 'comm_marketing/commercial/creance_cart_repository.dart';
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
import 'finances/coupure_billet_repository.dart';
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
import 'notify/budgets/budget_notify_repository.dart';
import 'notify/comm_marketing/agenda_notify_repository.dart';
import 'notify/comm_marketing/campaign_notify_repository.dart';
import 'notify/comm_marketing/cart_notify_repository.dart';
import 'notify/comm_marketing/prod_model_notify_repository.dart';
import 'notify/comm_marketing/succursale_notify_repository.dart';
import 'notify/comptabilites/balance_notify_repository.dart';
import 'notify/comptabilites/bilan_notify_repository.dart';
import 'notify/comptabilites/compte_resultat_notify_repository.dart';
import 'notify/comptabilites/journal_notify_repository.dart';
import 'notify/devis/devis_notify_repository.dart';
import 'notify/exploitations/projet_notify_repository.dart';
import 'notify/exploitations/taches_notify_repository.dart';
import 'notify/finances/creance_notify_repository.dart';
import 'notify/finances/dette_notify_repository.dart';
import 'notify/logistiques/carburant_notify_repository.dart';
import 'notify/logistiques/engin_notify_repository.dart';
import 'notify/logistiques/entretien_notify_repository.dart';
import 'notify/logistiques/etat_materiel_notify_repository.dart';
import 'notify/logistiques/immobilier_notity_repository.dart';
import 'notify/logistiques/mobilier_notify_repository.dart';
import 'notify/logistiques/trajets_notify_repository.dart';
import 'notify/mails/mails_notify_repository.dart';
import 'notify/rh/salaire_notify_repository.dart';
import 'notify/rh/transport_rest_notify_repository.dart';
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

  // Administration
  late ActionnaireRepository actionnaires;
  late ActionnaireCotisationRepository actionnaireCotisations;

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
  late CoupureBilletRepository coupureBillets;

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

  // Notify Count
  late BudgetNotifyRepository budgetNotifyCount;
  late CampaignNotifyRepository campaignNotifyCount;
  late SuccursaleNotifyRepository succursaleNotifyCount;
  late ProdModelNotifyRepository prodModelCount;
  late AgendaNotifyRepository agendaCount;
  late CartNotifyRepository cartCount;
  late BalanceNotifyRepository balanceNotifyCount;
  late BilanNotifyRepository bilanNotifyCount;
  late CompteResultatNotifyRepository compteResultatsCount;
  late JournalNotifyRepository journalNotifyCount;
  late DevisNotifyRepository devisNotifyCount;
  late ProjetNotifyRepository projetNotifyCount;
  late TacheNotifyRepository tacheNotifyCount;
  late CreanceNotifyRepository creanceNotifyCount;
  late DetteNotifyRepository detteNotifyCount;
  late CarburantNotifyRepository carburantNotifyCount;
  late EnginNotifyRepository enginNotifyCount;
  late EntretienNotifyRepository entretienNotifyCount;
  late EtatMaterielNotifyRepository etatMaterielNotifyCount;
  late ImmobilierNotifyRepository immobilierNotifyCount;
  late MobilierNotifyRepository mobilierNotifyCount;
  late TrajetNotifyRepository trajetsNotifyCount;
  late SalaireNotifyRepository salaireNotifyCount;
  late TransportRestNotifyRepository transportRestNotifyCount;
  late MailsNotifyRepository mailsNotifyCount;

  Repository(this.executor) {
    // Notifications
    budgetNotifyCount = BudgetNotifyRepository(executor, 'departement_budgets');
    campaignNotifyCount = CampaignNotifyRepository(executor, 'campaigns');
    succursaleNotifyCount = SuccursaleNotifyRepository(executor, 'succursales');
    prodModelCount = ProdModelNotifyRepository(executor, 'produits_model');
    agendaCount = AgendaNotifyRepository(executor, 'agendas');
    cartCount = CartNotifyRepository(executor, 'carts');
    balanceNotifyCount = BalanceNotifyRepository(executor, 'balance_comptes');
    bilanNotifyCount = BilanNotifyRepository(executor, 'bilans');
    compteResultatsCount =
        CompteResultatNotifyRepository(executor, 'comptes_resultat');
    journalNotifyCount = JournalNotifyRepository(executor, 'journals');
    devisNotifyCount = DevisNotifyRepository(executor, 'devis');
    projetNotifyCount = ProjetNotifyRepository(executor, 'projets');
    tacheNotifyCount = TacheNotifyRepository(executor, 'taches');
    creanceNotifyCount = CreanceNotifyRepository(executor, 'creances');
    detteNotifyCount = DetteNotifyRepository(executor, 'dettes');
    carburantNotifyCount = CarburantNotifyRepository(executor, 'carburants');
    enginNotifyCount = EnginNotifyRepository(executor, 'anguins');
    entretienNotifyCount = EntretienNotifyRepository(executor, 'entretiens');
    etatMaterielNotifyCount =
        EtatMaterielNotifyRepository(executor, 'etat_materiels');
    immobilierNotifyCount = ImmobilierNotifyRepository(executor, 'immobiliers');
    mobilierNotifyCount = MobilierNotifyRepository(executor, 'mobiliers');
    trajetsNotifyCount = TrajetNotifyRepository(executor, 'trajets');
    salaireNotifyCount = SalaireNotifyRepository(executor, 'salaires');
    transportRestNotifyCount =
        TransportRestNotifyRepository(executor, 'transport_restaurations');
    mailsNotifyCount = MailsNotifyRepository(executor, 'mails');

    // AUTH
    refreshTokens = RefreshTokensRepository(executor, 'refresh_tokens');
    users = UserRepository(executor, 'users');

    // Administrations
    actionnaires = ActionnaireRepository(executor, 'actionnaires');
    actionnaireCotisations =
        ActionnaireCotisationRepository(executor, 'actionnaire_cotisations');

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
    coupureBillets = CoupureBilletRepository(executor, 'coupure_billets');

    // COMPTABILITE
    bilans = BilanRepository(executor, 'bilans');
    compteActif = CompteActifRepository(executor, 'compte_actifs');
    comptePassif = ComptePassifRepository(executor, 'compte_passifs');
    journals = JournalRepository(executor, 'journals');
    comptesResultat = CompteResultatRepository(executor, 'comptes_resultat');
    balanceComptes = BalanceCompteRepository(executor, 'balance_comptes');
    balanceCompteRef =
        CompteBalanceRefRepository(executor, 'comptes_balances_ref');

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
  }
}
