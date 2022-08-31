import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'db/config_db.dart'; 
import 'handlers/administrations/actionnaire_cotisations_handlers.dart';
import 'handlers/administrations/actionnaire_handlers.dart';
import 'handlers/archives/archive_folder_handlers.dart';
import 'handlers/archives/archive_handlers.dart';
import 'handlers/auth/auth_handlers.dart';
import 'handlers/auth/user_handlers.dart';
import 'handlers/budgets/departement_budget_handlers.dart';
import 'handlers/budgets/ligne_budgetaire_handlers.dart';
import 'handlers/comm_marketing/commercial/achats_handlers.dart';
import 'handlers/comm_marketing/commercial/bon_livraison_handlers.dart';
import 'handlers/comm_marketing/commercial/cart_handlers.dart';
import 'handlers/comm_marketing/commercial/creance_facture_handlers.dart';
import 'handlers/comm_marketing/commercial/facture_handlers.dart';
import 'handlers/comm_marketing/commercial/gains_handlers.dart';
import 'handlers/comm_marketing/commercial/history_livraison_handlers.dart';
import 'handlers/comm_marketing/commercial/history_ravitaillement_handlers.dart';
import 'handlers/comm_marketing/commercial/number_fact_handlers.dart';
import 'handlers/comm_marketing/commercial/produit_model_handlers.dart';
import 'handlers/comm_marketing/commercial/restitution_handlers.dart';
import 'handlers/comm_marketing/commercial/stocks_global_handlers.dart';
import 'handlers/comm_marketing/commercial/succursale_handlers.dart';
import 'handlers/comm_marketing/commercial/ventes_handlers.dart';
import 'handlers/comm_marketing/marketing/agenda_handlers.dart';
import 'handlers/comm_marketing/marketing/annuaire_handlers.dart';
import 'handlers/comm_marketing/marketing/campaign_handlers.dart';
import 'handlers/comptabilites/balance_comptes_handlers.dart';
import 'handlers/comptabilites/bilans_handlers.dart';
import 'handlers/comptabilites/compte_bilan_ref_handlers.dart'; 
import 'handlers/comptabilites/compte_resultat_handlers.dart';
import 'handlers/comptabilites/comptes_balance_ref_handlers.dart';
import 'handlers/comptabilites/journal__livre_handlers.dart';
import 'handlers/comptabilites/journal_handlers.dart';
import 'handlers/devis/devis_handlers.dart';
import 'handlers/devis/devis_list_objets_handlers.dart';
import 'handlers/exploitations/agent_role_hanlders.dart';
import 'handlers/exploitations/fournisseur_handlers.dart';
import 'handlers/exploitations/production_handlers.dart';
import 'handlers/exploitations/projet_handlers.dart';
import 'handlers/exploitations/rapport_hanlders.dart';
import 'handlers/exploitations/tache_handlers.dart';
import 'handlers/exploitations/versement_projet_handlers.dart';
import 'handlers/finances/banques_handlers.dart';
import 'handlers/finances/caisses_handlers.dart';
import 'handlers/finances/coupure_billet_handlers.dart';
import 'handlers/finances/creance_dette_handlers.dart';
import 'handlers/finances/creance_handlers.dart';
import 'handlers/finances/dette_handlers.dart';
import 'handlers/finances/depense_handlers.dart';
import 'handlers/finances/fin_exterieur_handlers.dart';
import 'handlers/logistiques/anguin_handlers.dart';
import 'handlers/logistiques/carburant_handlers.dart';
import 'handlers/logistiques/entretien_handlers.dart';
import 'handlers/logistiques/etat_materiel_handlers.dart';
import 'handlers/logistiques/immobiler_repository.dart';
import 'handlers/logistiques/mobilier_handlers.dart';
import 'handlers/logistiques/objets_remplace_handlers.dart';
import 'handlers/logistiques/trajet_handlers.dart';
import 'handlers/mails/mails_handlers.dart';
import 'handlers/notify/budgets/budget_notify_handlers.dart';
import 'handlers/notify/comm_marketing/agenda_notify_handlers.dart';
import 'handlers/notify/comm_marketing/campaign_notify_handlers.dart';
import 'handlers/notify/comm_marketing/cart_notify_handlers.dart';
import 'handlers/notify/comm_marketing/prod_model_notify_handlers.dart';
import 'handlers/notify/comm_marketing/succursale_notify_handlers.dart';
import 'handlers/notify/comptabilites/balance_notify_handlers.dart';
import 'handlers/notify/comptabilites/bilan_notify_handlers.dart';
import 'handlers/notify/comptabilites/compte_resultat_notify_handlers.dart';
import 'handlers/notify/comptabilites/journal_notify_handlers.dart';
import 'handlers/notify/departements/admin_departement.dart';
import 'handlers/notify/departements/budget_departement.dart';
import 'handlers/notify/departements/comm_marketing_departement.dart';
import 'handlers/notify/departements/comptabilites_departement.dart';
import 'handlers/notify/departements/exploitation_departement.dart';
import 'handlers/notify/departements/finance_departement.dart';
import 'handlers/notify/departements/logistique_departement.dart';
import 'handlers/notify/departements/rh_departement.dart';
import 'handlers/notify/devis/devis_notify_handlers.dart';
import 'handlers/notify/exploitations/production_notify_handlers.dart';
import 'handlers/notify/exploitations/projet_notify_handlers.dart';
import 'handlers/notify/exploitations/tache_notify_handlers.dart';
import 'handlers/notify/finances/creance_notify_handlers.dart';
import 'handlers/notify/finances/dette_notify_handlers.dart';
import 'handlers/notify/logistique/carburant_notify_handlers.dart';
import 'handlers/notify/logistique/engin_notify_handlers.dart';
import 'handlers/notify/logistique/entretien_notify_handlers.dart';
import 'handlers/notify/logistique/etat_materiel_notify_handlers.dart';
import 'handlers/notify/logistique/immobilier_notify_handlers.dart';
import 'handlers/notify/logistique/mobilier_notify_handlers.dart';
import 'handlers/notify/logistique/trajet_notify_handlers.dart';
import 'handlers/notify/mails/mails_notify_handlers.dart';
import 'handlers/notify/rh/salaire_notify_handlers.dart';
import 'handlers/notify/rh/transport_rest_notify_handlers.dart';
import 'handlers/rh/agents_handlers.dart';
import 'handlers/rh/paiement_salaire_handlers.dart';
import 'handlers/rh/performence_handlers.dart';
import 'handlers/rh/performence_note_handlers.dart';
import 'handlers/rh/presence_personnel_handlers.dart';
import 'handlers/rh/presence_handlers.dart'; 
import 'handlers/rh/trans_rest_agents_handlers.dart';
import 'handlers/rh/transport_restauration_handlers.dart';
import 'handlers/update/upate_handlers.dart';
import 'middleware/middleware.dart';
import 'repository/repository.dart';

// Configure routes.
class Service {
  final Repository repos;
  final String serverSecretKey;

  Service(this.repos, this.serverSecretKey);

  Handler get handlers {
    final router = Router();
      router.mount(
        '/api/counts/departement-admin/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(AdminDepartementHandlers(repos).router));
    router.mount(
        '/api/counts/departement-budgets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(BudgetDepartementHandlers(repos).router));
    router.mount(
        '/api/counts/departement-comm-marketing/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(CommMarketingDepartementHandlers(repos).router));
    router.mount(
        '/api/counts/departement-comptabilite/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(ComptabiliteDepartementHandlers(repos).router));
    router.mount(
        '/api/counts/departement-exploitations/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(ExploitationDepartementHandlers(repos).router));
    router.mount(
        '/api/counts/departement-finances/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(FinanceDepartementHandlers(repos).router));
    router.mount(
        '/api/counts/departement-logistique/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(LogistiqueDepartementHandlers(repos).router));
    router.mount(
        '/api/counts/departement-rh/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(RhDepartementHandlers(repos).router));



      router.mount(
        '/api/counts/budgets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors()) 
            .addHandler(BudgetNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/campaigns/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(CampaignNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/succursales/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(SuccursaleNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/prod-models/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(ProdModelNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/agendas/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(AgendaNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/carts/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(CartNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/balances/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(BalanceNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/bilans/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(BilanNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/compte-resultats/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(CompteResultatNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/journals/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(JournalNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/devis/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(DevisNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/projets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(ProjetNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/productions/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(ProductionNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/taches/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(TacheNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/creances/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(CreanceNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/dettes/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(DetteNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/carburants/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(CarburantNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/engins/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(EnginNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/entretiens/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(EntretienNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/etat-materiels/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(EtatMaterielNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/immobiliers/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(ImmobilierNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/mobiliers/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(MobilierNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/trajets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(TrajetNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/salaires/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(SalaireNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/trans-rests/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(TransRestNotifyHandlers(repos).router));
    router.mount(
        '/api/counts/mails/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(MailsNotifyHandlers(repos).router));



    // AUTH
    router.mount(
        '/api/auth/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addHandler(AuthHandlers(repos, serverSecretKey).router));
    router.mount(
        '/api/user/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(UserHandlers(repos).router));

    // Actionnaires
    router.mount(
        '/api/admin/actionnaires/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ActionnaireHandlers(repos).router));
    router.mount(
        '/api/admin/actionnaire-cotisations/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ActionnaireCotisationHandlers(repos).router));


    router.mount(
        '/api/rh/agents/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(AgentsHandlers(repos).router));

    router.mount(
        '/api/rh/presences/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PresenceHandlers(repos).router));
    router.mount(
        '/api/rh/presence-personnels/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PresencePersonnelHandlers(repos).router)); 

    router.mount(
        '/api/rh/paiement-salaires/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PaiementSalaireHandlers(repos).router));
    router.mount(
        '/api/rh/performences/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PerformenceHandlers(repos).router));
    router.mount(
        '/api/rh/performences-note/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PerformenceNoteHandlers(repos).router));
    router.mount(
        '/api/rh/transport-restaurations/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(TransportRestaurantHandlers(repos).router));
    router.mount(
        '/api/rh/trans-rest-agents/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(TransRestAgentsHandlers(repos).router));

    // FINANCE
    router.mount(
        '/api/finances/transactions/banques/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(BanqueHandlers(repos).router));

    router.mount(
        '/api/finances/transactions/caisses/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CaissesHandlers(repos).router));

    router.mount(
        '/api/finances/transactions/creances/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CreanceHandlers(repos).router));

    router.mount(
        '/api/finances/transactions/dettes/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(DetteHandlers(repos).router));

    router.mount(
        '/api/finances/transactions/financements-exterieur/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(FinExterieurHandlers(repos).router));
    router.mount(
        '/api/finances/creance-dettes/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CreanceDetteHandlers(repos).router));
    router.mount(
        '/api/finances/coupure-billets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CoupureBilletHandlers(repos).router));
    router.mount(
        '/api/finances/depenses/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(DepenseHandlers(repos).router));

// COMPTABILITE
    router.mount(
        '/api/comptabilite/bilans/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(BilansHandlers(repos).router));
    router.mount(
        '/api/comptabilite/comptes-bilans-ref/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CompteBilanRefHandlers(repos).router)); 
    router.mount(
        '/api/comptabilite/journals/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(JournalHandlers(repos).router));
    router.mount(
        '/api/comptabilite/journals-livres/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(JournalLivreHandlers(repos).router));  
    router.mount(
        '/api/comptabilite/comptes_resultat/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CompteResultatHandlers(repos).router));
    router.mount(
        '/api/comptabilite/balance_comptes/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(BalanceComptesHandlers(repos).router));
    router.mount(
        '/api/comptabilite/comptes-balance-ref/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ComptesBalanceRefHandlers(repos).router));



    // Budgets
    router.mount(
        '/api/budgets/departements/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(DepartementBudgetHandlers(repos).router));
    router.mount(
        '/api/budgets/ligne-budgetaires/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(LigneBudgetaireHanlers(repos).router));

    // DEVIS
    router.mount(
        '/api/devis/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(DevisHandlers(repos).router));
    router.mount(
        '/api/devis-list-objets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(DevisListObjetsHandlers(repos).router));

    // EXPLOITATIONS
    router.mount(
        '/api/projets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ProjetHandlers(repos).router));
    router.mount(
        '/api/taches/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(TacheHanlers(repos).router));
    router.mount(
        '/api/versements-projets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(VersementProjetHandlers(repos).router));
    router.mount(
        '/api/rapports/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(RapportHandlers(repos).router));
    router.mount(
        '/api/agents-roles/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(AgentRoleHandlers(repos).router));
    router.mount(
        '/api/productions/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ProductionHandlers(repos).router));
    router.mount(
        '/api/fournisseurs/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(FournisseurHandlers(repos).router));


    // LOGISTIQUES
    router.mount(
        '/api/anguins/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(AnguinHandlers(repos).router));
    router.mount(
        '/api/carburants/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CarburantHandlers(repos).router));
    router.mount(
        '/api/entretiens/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(EntretienHandlers(repos).router));
    router.mount(
        '/api/etat_materiels/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(EtatMaterielHandlers(repos).router));
    router.mount(
        '/api/immobiliers/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ImmobilierHandlers(repos).router));
    router.mount(
        '/api/mobiliers/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(MobilierHandlers(repos).router));
    router.mount(
        '/api/trajets/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(TrajetHandlers(repos).router));
    router.mount(
        '/api/objets-remplaces/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ObjetsRemplaceHandlers(repos).router));

// COMMERCIAL ET MARKETING
    router.mount(
        '/api/produit-models/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ProduitModelHandlers(repos).router));
    router.mount(
        '/api/stocks-global/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(StockGlobalHandlers(repos).router));
    router.mount(
        '/api/succursales/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(SuccursaleHandlers(repos).router));
    router.mount(
        '/api/bon-livraisons/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(BonLivraisonHandlers(repos).router));
    router.mount(
        '/api/achats/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(AchatsHandlers(repos).router));
    router.mount(
        '/api/carts/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CartHandlers(repos).router));
    router.mount(
        '/api/factures/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(FactureHandlers(repos).router));
    router.mount(
        '/api/facture-creances/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CreanceFactureHandlers(repos).router));
    router.mount(
        '/api/ventes/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(VenteHandlers(repos).router));
    router.mount(
        '/api/gains/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(GainsHandlers(repos).router));
    router.mount(
        '/api/restitutions/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(RestitutionHandlers(repos).router));
    router.mount(
        '/api/history-ravitaillements/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(HistoryRavitaillementHandlers(repos).router));
    router.mount(
        '/api/history-livraisons/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(HistoryLivraisonHandlers(repos).router));
    router.mount(
        '/api/number-facts/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(NumberFactHandlers(repos).router));

    router.mount(
        '/api/agendas/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(AgendaHandlers(repos).router));
    router.mount(
        '/api/annuaires/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(AnnuaireHandlers(repos).router));
    router.mount(
        '/api/campaigns/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CampaignHandlers(repos).router));

    router.mount(
        '/api/archives/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ArchiveHandlers(repos).router));
    router.mount(
        '/api/archives-folders/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ArchiveFolderHandlers(repos).router));
    router.mount(
        '/api/mails/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(MailsHandlers(repos).router)); 
    router.mount(
        '/api/update-versions/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(UpdateHandlers(repos).router)); 

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(null),
    );
    return router;
  }
}


void main(List<String> args) async {
  final ip = "app";
  final port = 80;

  PostgreSQLConnection connection = await ConnexionDatabase().connection();
  print("Database it's work...");

  await connection.open();
  Repository repos = Repository(connection);
  Service service = Service(repos, "astridKey");

  final server = await shelf_io.serve(service.handlers, ip, port);

  print('Server listening on port ${server.port}');
}
