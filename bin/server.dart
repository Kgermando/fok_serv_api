import 'dart:io';

import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'db/config_db.dart';
import 'db/table_name.dart';
import 'handlers/auth/auth_handlers.dart';
import 'handlers/auth/user_handlers.dart';
import 'handlers/comm_marketing/commercial/achats_handlers.dart';
import 'handlers/comm_marketing/commercial/bon_livraison_handlers.dart';
import 'handlers/comm_marketing/commercial/cart_handlers.dart';
import 'handlers/comm_marketing/commercial/gains_handlers.dart';
import 'handlers/comm_marketing/commercial/produit_model_handlers.dart';
import 'handlers/comm_marketing/commercial/restitution_handlers.dart';
import 'handlers/comm_marketing/commercial/stocks_global_handlers.dart';
import 'handlers/comm_marketing/commercial/succursale_handlers.dart';
import 'handlers/comptabilites/amortissement_handlers.dart';
import 'handlers/comptabilites/bilans_handlers.dart';
import 'handlers/comptabilites/journal_handlers.dart';
import 'handlers/comptabilites/valorisation_handlers.dart';
import 'handlers/devis/devis_handlers.dart';
import 'handlers/exploitations/projet_handlers.dart';
import 'handlers/exploitations/tache_handlers.dart';
import 'handlers/finances/banques_handlers.dart';
import 'handlers/finances/caisses_handlers.dart';
import 'handlers/finances/creance_handlers.dart';
import 'handlers/finances/depenses_handlers.dart';
import 'handlers/finances/dette_handlers.dart';
import 'handlers/finances/fin_exterieur_handlers.dart';
import 'handlers/logistiques/anguin_handlers.dart';
import 'handlers/logistiques/carburant_handlers.dart';
import 'handlers/logistiques/entretien_handlers.dart';
import 'handlers/logistiques/etat_materiel_handlers.dart';
import 'handlers/logistiques/immobiler_repository.dart';
import 'handlers/logistiques/mobilier_handlers.dart';
import 'handlers/logistiques/trajet_handlers.dart';
import 'handlers/rh/agents_handlers.dart';
import 'handlers/rh/paiement_divers_handlers.dart';
import 'handlers/rh/paiement_salaire_handlers.dart';
import 'handlers/rh/presence_handlers.dart';
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
            .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PresenceHandlers(repos).router));

    router.mount(
        '/api/rh/paiement-salaires/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PaiementSalaireHandlers(repos).router));

    router.mount(
        '/api/rh/paiement-divers/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PaiementDiversHandlers(repos).router));
    
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
        '/api/finances/transactions/depenses/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(DepensesHandlers(repos).router));

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
        '/api/comptabilite/amortissements/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(AmortissementHandlers(repos).router));
    
    router.mount(
        '/api/comptabilite/bilans/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(BilansHandlers(repos).router)); 
    router.mount(
        '/api/comptabilite/journals/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(JournalHandlers(repos).router));
    router.mount(
        '/api/comptabilite/valorisations/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(ValorisationHandlers(repos).router));
    router.mount(
        '/api/devis/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(DevisHandlers(repos).router));

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
      '/api/comm_marketing/prod-models',
      Pipeline()
        .addMiddleware(setJsonHeader())
        .addMiddleware(handleErrors())
        // .addMiddleware(handleAuth(serverSecretKey))
        .addHandler(ProduitModelHandlers(repos).router));
    router.mount(
      '/api/comm_marketing/stocks-global',
      Pipeline()
        .addMiddleware(setJsonHeader())
        .addMiddleware(handleErrors())
        // .addMiddleware(handleAuth(serverSecretKey))
        .addHandler(StockGlobalHandlers(repos).router));
    router.mount(
        '/api/comm_marketing/succursales',
        Pipeline()
          .addMiddleware(setJsonHeader())
          .addMiddleware(handleErrors())
          // .addMiddleware(handleAuth(serverSecretKey))
          .addHandler(SuccursaleHandlers(repos).router));
    router.mount(
        '/api/comm_marketing/bon-livraisons',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(BonLivraisonHandlers(repos).router));
    router.mount(
        '/api/comm_marketing/achats',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(AchatsHandlers(repos).router));
    router.mount(
        '/api/comm_marketing/carts',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CartHandlers(repos).router));
    router.mount(
        '/api/comm_marketing/factures',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CartHandlers(repos).router));
    router.mount(
      '/api/comm_marketing/facture-creances',
      Pipeline()
          .addMiddleware(setJsonHeader())
          .addMiddleware(handleErrors())
          // .addMiddleware(handleAuth(serverSecretKey))
          .addHandler(CartHandlers(repos).router));
    router.mount(
        '/api/comm_marketing/ventes',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(CartHandlers(repos).router));
    router.mount(
        '/api/comm_marketing/gains',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(GainsHandlers(repos).router));
    router.mount(
        '/api/comm_marketing/restitutions',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(RestitutionHandlers(repos).router));


        

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(null),
    );
    return router;
  }
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  PostgreSQLConnection connection = await ConnexionDatabase().connection();
  PostgreSQLConnection creatTable = await TableName().openConnection(connection);

  Repository repos = Repository(creatTable);
  Service service = Service(repos, "testKey");

  final server = await shelf_io.serve(service.handlers,ip,80,);
  
  print('Server listening on port ${server.port}');
}
