import 'package:postgres/postgres.dart';

import 'actionnaire/actionnaire_cotisation_repository.dart';
import 'actionnaire/actionnaire_repository.dart';
import 'actionnaire/actionnaire_tranfert_repository.dart';
import 'archives/archive_folder_repository.dart';
import 'archives/archive_repository.dart';
import 'budgets/departement_budget_repository.dart';
import 'budgets/ligne_budgetaire_repository.dart';
import 'commercial/achats_repository.dart';
import 'commercial/bon_livraison_repository.dart';
import 'commercial/cart_repository.dart';
import 'commercial/creance_cart_repository.dart';
import 'commercial/facture_cart_repository.dart';
import 'commercial/gain_repository.dart';
import 'commercial/history_livraison_repository.dart';
import 'commercial/history_ravitraillement_repository.dart';
import 'commercial/number_facture_repository.dart';
import 'commercial/produit_model_repository.dart';
import 'commercial/succursale_repository.dart';
import 'commercial/vente_repository.dart';
import 'exploitations/section_projet_repository.dart';
import 'marketing/agenda_repository.dart';
import 'marketing/annuaire_repository.dart';
import 'comptabilites/bilan_repository.dart';
import 'comptabilites/compte_bilan_ref_repository.dart';
import 'comptabilites/balance_repository.dart';
import 'comptabilites/compte_resultat_repository.dart';
import 'comptabilites/journal_repository.dart';
import 'devis/devis_ist_objet_repository.dart';
import 'devis/devis_repository.dart';
import 'logistiques/approvisionnement_repository.dart';
import 'logistiques/approvison_reception_repository.dart';
import 'notify/departements/marketing/marketing_departement.dart';
import 'personnel_role/agent_role_repository.dart';
import 'exploitations/fournisseur_repository.dart';
import 'exploitations/production_repository.dart';
import 'exploitations/projet_repository.dart';
import 'settings/monnaie_repository.dart';
import 'suivi_controle/abonnement_client_repository.dart';
import 'suivi_controle/entreprise_info_repository.dart';
import 'suivi_controle/suivi_repository.dart';
import 'taches/rapport_repository.dart';
import 'taches/tache_repository.dart';
import 'exploitations/versement_projet_repository.dart';
import 'finances/banque_name_repository.dart';
import 'finances/banque_repository.dart';
import 'finances/caisse_name_repository.dart';
import 'finances/caissses_repository.dart';
import 'finances/coupure_billet_repository.dart';
import 'finances/creance_dette_repository.dart';
import 'finances/creances_repository.dart';
import 'finances/depenses_repository.dart';
import 'finances/dettes_repository.dart';
import 'finances/fin_exterieur_name_repository.dart';
import 'finances/fin_exterieur_repository.dart';
import 'logistiques/materiel_repository.dart';
import 'logistiques/entretien_reposiotory.dart';
import 'logistiques/etat_materiel_repository.dart';
import 'logistiques/immobilier_repository.dart';
import 'logistiques/mobilier_repository.dart';
import 'logistiques/objet_remplace_reposiotory.dart';
import 'logistiques/trajet_repository.dart';
import 'mails/mail_repository.dart';
import 'notify/budgets/budget_notify_repository.dart';
import 'notify/marketing/agenda_notify_repository.dart';
import 'notify/marketing/campaign_notify_repository.dart';
import 'notify/comm_marketing/cart_notify_repository.dart';
import 'notify/comm_marketing/prod_model_notify_repository.dart';
import 'notify/comm_marketing/succursale_notify_repository.dart';
import 'notify/comptabilites/bilan_notify_repository.dart';
import 'notify/comptabilites/compte_resultat_notify_repository.dart';
import 'notify/departements/administration/admin_departement.dart';
import 'notify/departements/budgets/budget_departement_.dart';
import 'notify/departements/commercial/comm_departement.dart';
import 'notify/departements/comptabilites/comptabilite_departement.dart';
import 'notify/departements/exploitations/exploitations_departement.dart';
import 'notify/departements/finances/finance_departement.dart';
import 'notify/departements/logistiques/logistique_departement.dart';
import 'notify/departements/rh/rh_department.dart';
import 'notify/devis/devis_notify_repository.dart';
import 'notify/exploitations/production_notify_repository.dart';
import 'notify/exploitations/projet_notify_repository.dart';
import 'notify/exploitations/taches_notify_repository.dart';
import 'notify/finances/creance_notify_repository.dart';
import 'notify/finances/dette_notify_repository.dart';
import 'notify/logistiques/materiel_notify_repository.dart';
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
import 'rh/presence_personnel_repository.dart';
import 'rh/presence_repository.dart';
import 'rh/trans_rest_agents_repository.dart';
import 'rh/transport_restauration_repository.dart';
import 'update/update_version_repository.dart';
import 'user/refresh_token_repository.dart';
import 'user/user_repository.dart';

class Repository {
  final PostgreSQLConnection executor;
  late RefreshTokensRepository refreshTokens;
  late UserRepository users;

  // Settings
  late MonnaieRepository monnaies;

  // Actiionnaire
  late ActionnaireRepository actionnaires;
  late ActionnaireCotisationRepository actionnaireCotisations;
  late ActionnaireTransfertRepository actionnaireTransfertRepository;

  // RH
  late AgentsRepository agents;
  late PaiementSalaireRepository salaires;
  late PresenceRepository presences;
  late PresencePersonnelRepository presencePersonnel;
  late PerformenceRepository performences;
  late PerformenceNoteRepository performencesNote;
  late TasnportRestaurationRepository transportRestauration;
  late TransRestAgentsRepository transRestAgents;

  // Devis
  late DevisRepository devis;
  late DevisListObjetRepository devisListObjets;

  // FINANCES
  late BanqueNameRepository banqueNames;
  late CaisseNameRepository caisseNames;
  late FinExterieurNameRepository finExterieurNames;
  late BanqueRepository banques;
  late CaissesRepository caisses;
  late CreancesRepository creances;
  late DettesRepository dettes;
  late FinExteRepository finExterieurs;
  late CreanceDetteRepository creanceDette;
  late CoupureBilletRepository coupureBillets;
  late DepensesRepository depenses;

  // COMPTABILITES
  late BilanRepository bilans;
  late CompteBilanRefRepository compteBilanRefRepository;
  late JournalRepository journals;
  late CompteResultatRepository comptesResultat;
  late BalanceRepository balances;

  // BUDGETS
  late DepartementBudgetRepository departementBudgets;
  late LigneBudgtaireRepository ligneBudgetaires;

  // EXPLOITATIONS
  late ProjetRepository projets;
  late SectionProjetRepository sectionProjets;
  late TacheRepository taches;
  late VersementProjetRepository versementProjets;
  late RapportRepository rapports;
  late AgentRoleRepository agentsRoles;
  late FournisseurRepository fournisseurs;
  late ProductionRepository productions;

  // LOGISTIQUE
  late MaterielRepository materielRepository;
  late EntretienRepository entretiens;
  late EtaMaterielRepository etatMateriels;
  late ImmobilierRepository immobiliers;
  late MobilierRepository mobiliers;
  late TrajetRepository trajets;
  late ObjetRemplaceRepository objetsRemplace;
  late ApprovisionnementRepository approvisionnementRepository;
  late ApprovisionReceptionRepository approvisionReceptionRepository;

  // COMMERCIAL & MARKETING
  late ProduitModelRepository produitModel;
  late SuccursaleRepository succursales;
  late BonLivraisonRepository bonLivraison;
  late AchatsRepository achats;
  late CartRepository carts;
  late FactureRepository factures;
  late CreanceFactureRepository creancesFacture;
  late NumberFactureRepository numberFacture;
  late VenteRepository ventes;
  late GainRepository gains;
  late AgendaRepository agendas;
  late AnnuaireReposiotry annuaires;
  late HistoryRavitaillementRepository historyRavitaillements;
  late HistoryLivraisonRepository historyLivraisons;

  // Archive
  late ArchiveRepository archives;
  late ArchiveFolderRepository archivesFolders;

  // Mails
  late MailRepository mails;
  // Update version
  late UpdateVersionRepository updateVersion;

  // Notify Count
  late BudgetNotifyRepository budgetNotifyCount;
  late CampaignNotifyRepository campaignNotifyCount;
  late SuccursaleNotifyRepository succursaleNotifyCount;
  late ProdModelNotifyRepository prodModelCount;
  late AgendaNotifyRepository agendaCount;
  late CartNotifyRepository cartCount;
  late BilanNotifyRepository bilanNotifyCount;
  late CompteResultatNotifyRepository compteResultatsCount;
  late DevisNotifyRepository devisNotifyCount;
  late ProjetNotifyRepository projetNotifyCount;
  late ProductionNotifyRepository productionNotifyCount;
  late TacheNotifyRepository tacheNotifyCount;
  late CreanceNotifyRepository creanceNotifyCount;
  late DetteNotifyRepository detteNotifyCount;
  late MaterielNotifyRepository materielNotifyCount;
  late EntretienNotifyRepository entretienNotifyCount;
  late EtatMaterielNotifyRepository etatMaterielNotifyCount;
  late ImmobilierNotifyRepository immobilierNotifyCount;
  late MobilierNotifyRepository mobilierNotifyCount;
  late TrajetNotifyRepository trajetsNotifyCount;
  late SalaireNotifyRepository salaireNotifyCount;
  late TransportRestNotifyRepository transportRestNotifyCount;
  late MailsNotifyRepository mailsNotifyCount;

  // Notification SideBar
  late AdminDepartementRepository adminDepartementRepository;
  late BudgetDepartementRepository budgetDepartementRepository;
  late MarketingDepartementRepository marketingDepartementRepository;
  late CommDepartementRepository commDepartementRepository;
  late ComptabiliteDepartementRepository comptabiliteDepartementRepository;
  late ExploitationDepartementRepository exploitationDepartementRepository;
  late FinanceDepartementRepository financeDepartementRepository;
  late LogistiqueDepartementRepository logistiqueDepartementRepository;
  late RhDepartementRepository rhDepartementRepository;

  // Suivi & Controle
  late AbonnementRepository abonnementRepository;
  late EntrepriseRepository entrepriseRepository;
  late SuiviRepository suiviRepository;

  Repository(this.executor) {
    // Notification SideBar
    adminDepartementRepository = AdminDepartementRepository(executor);
    budgetDepartementRepository = BudgetDepartementRepository(executor);
    marketingDepartementRepository = MarketingDepartementRepository(executor);
    commDepartementRepository = CommDepartementRepository(executor);
    comptabiliteDepartementRepository =
        ComptabiliteDepartementRepository(executor);
    exploitationDepartementRepository =
        ExploitationDepartementRepository(executor);
    financeDepartementRepository = FinanceDepartementRepository(executor);
    logistiqueDepartementRepository = LogistiqueDepartementRepository(executor);
    rhDepartementRepository = RhDepartementRepository(executor);

    // Notifications
    budgetNotifyCount = BudgetNotifyRepository(executor, 'departement_budgets');
    campaignNotifyCount = CampaignNotifyRepository(executor, 'campaigns');
    succursaleNotifyCount = SuccursaleNotifyRepository(executor, 'succursales');
    prodModelCount = ProdModelNotifyRepository(executor, 'produits_model');
    agendaCount = AgendaNotifyRepository(executor, 'agendas');
    cartCount = CartNotifyRepository(executor, 'carts');
    bilanNotifyCount = BilanNotifyRepository(executor, 'bilans');
    compteResultatsCount =
        CompteResultatNotifyRepository(executor, 'comptes_resultat');
    devisNotifyCount = DevisNotifyRepository(executor, 'devis');
    projetNotifyCount = ProjetNotifyRepository(executor, 'projets');
    productionNotifyCount = ProductionNotifyRepository(executor, 'productions');
    tacheNotifyCount = TacheNotifyRepository(executor, 'taches');
    creanceNotifyCount = CreanceNotifyRepository(executor, 'creances');
    detteNotifyCount = DetteNotifyRepository(executor, 'dettes');
    materielNotifyCount = MaterielNotifyRepository(executor, 'materiels');
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

    // Actionnaire
    actionnaires = ActionnaireRepository(executor, 'actionnaires');
    actionnaireCotisations =
        ActionnaireCotisationRepository(executor, 'actionnaire_cotisations');
    actionnaireTransfertRepository =
        ActionnaireTransfertRepository(executor, 'actionnaire_transferts');

    // RH
    agents = AgentsRepository(executor, 'agents');
    salaires = PaiementSalaireRepository(executor, 'salaires');
    presences = PresenceRepository(executor, 'presences');
    presencePersonnel =
        PresencePersonnelRepository(executor, 'presence_personnels');
    performences = PerformenceRepository(executor, 'performences');
    performencesNote = PerformenceNoteRepository(executor, 'performences_note');
    transportRestauration =
        TasnportRestaurationRepository(executor, 'transport_restaurations');
    transRestAgents = TransRestAgentsRepository(executor, 'trans_rest_agents');

    // DEVIS
    devis = DevisRepository(executor, 'devis');
    devisListObjets = DevisListObjetRepository(executor, 'devis_list_objets');

    // FINANCES
    banqueNames = BanqueNameRepository(executor, 'banque_names');
    caisseNames = CaisseNameRepository(executor, 'caisse_names');
    finExterieurNames =
        FinExterieurNameRepository(executor, 'fin_exterieur_names');

    banques = BanqueRepository(executor, 'banques');
    caisses = CaissesRepository(executor, 'caisses');
    creances = CreancesRepository(executor, 'creances');
    dettes = DettesRepository(executor, 'dettes');
    finExterieurs = FinExteRepository(executor, 'fin_exterieurs');
    creanceDette = CreanceDetteRepository(executor, 'creance_dettes');
    coupureBillets = CoupureBilletRepository(executor, 'coupure_billets');
    depenses = DepensesRepository(executor);

    // COMPTABILITE
    bilans = BilanRepository(executor, 'bilans');
    compteBilanRefRepository =
        CompteBilanRefRepository(executor, 'compte_bilan_ref');
    journals = JournalRepository(executor, 'journals');
    comptesResultat = CompteResultatRepository(executor, 'comptes_resultat');
    balances = BalanceRepository(executor, 'balances');

    // BUDGETS
    departementBudgets =
        DepartementBudgetRepository(executor, 'departement_budgets');
    ligneBudgetaires = LigneBudgtaireRepository(executor, 'ligne_budgetaires');

    // EXPLOITAIONS
    projets = ProjetRepository(executor, 'projets');
    sectionProjets = SectionProjetRepository(executor, 'section_projets');
    taches = TacheRepository(executor, 'taches');
    versementProjets = VersementProjetRepository(executor, 'versement_projets');
    rapports = RapportRepository(executor, 'rapports');
    agentsRoles = AgentRoleRepository(executor, 'agents_roles');
    fournisseurs = FournisseurRepository(executor, 'fournisseurs');
    productions = ProductionRepository(executor, 'productions');

    // LOGISTIQUE
    materielRepository = MaterielRepository(executor, 'materiels');
    entretiens = EntretienRepository(executor, 'entretiens');
    etatMateriels = EtaMaterielRepository(executor, 'etat_materiels');
    immobiliers = ImmobilierRepository(executor, 'immobiliers');
    mobiliers = MobilierRepository(executor, 'mobiliers');
    trajets = TrajetRepository(executor, 'trajets');
    objetsRemplace = ObjetRemplaceRepository(executor, 'objets_remplace');
    approvisionnementRepository =
        ApprovisionnementRepository(executor, 'approvisionnements');
    approvisionReceptionRepository =
        ApprovisionReceptionRepository(executor, 'approvision_receptions');

    // COMMERCIAL
    produitModel = ProduitModelRepository(executor, 'produits_model');
    achats = AchatsRepository(executor, 'achats');
    carts = CartRepository(executor, 'carts');
    factures = FactureRepository(executor, 'factures');
    creancesFacture = CreanceFactureRepository(executor, 'creance_factures');
    numberFacture = NumberFactureRepository(executor, 'number_factures');
    ventes = VenteRepository(executor, 'ventes');
    gains = GainRepository(executor, 'gains');
    historyRavitaillements =
        HistoryRavitaillementRepository(executor, 'history_ravitaillements');
    succursales = SuccursaleRepository(executor, 'succursales');
    bonLivraison = BonLivraisonRepository(executor, 'bon_livraisons');
    historyLivraisons =
        HistoryLivraisonRepository(executor, 'history_livraisons');
    
    // MARKETING
    agendas = AgendaRepository(executor, 'agendas');
    annuaires = AnnuaireReposiotry(executor, 'annuaires');

    // ARCHIVE
    archives = ArchiveRepository(executor, 'archives');
    archivesFolders = ArchiveFolderRepository(executor, 'archives_folders');

    // Mails
    mails = MailRepository(executor, 'mails');

    updateVersion = UpdateVersionRepository(executor, 'update_versions');

    // Suivi & Controlle
    abonnementRepository = AbonnementRepository(executor, 'abonnement_clients');
    entrepriseRepository = EntrepriseRepository(executor, 'entreprise_infos');
    suiviRepository = SuiviRepository(executor, 'suivis');
  }
}
