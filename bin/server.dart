import 'dart:io';

import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'db/config_db.dart';
import 'db/table_name.dart';
import 'handlers/auth/auth_handlers.dart';
import 'handlers/auth/user_handlers.dart';
import 'handlers/comptabilites/amortissement_handlers.dart';
import 'handlers/comptabilites/bilans_handlers.dart';
import 'handlers/comptabilites/journal_handlers.dart';
import 'handlers/comptabilites/valorisation_handlers.dart';
import 'handlers/finances/banques_handlers.dart';
import 'handlers/finances/caisses_handlers.dart';
import 'handlers/finances/creance_handlers.dart';
import 'handlers/finances/depenses_handlers.dart';
import 'handlers/finances/dette_handlers.dart';
import 'handlers/finances/fin_exterieur_handlers.dart';
import 'handlers/rh/paiement_handlers.dart';
import 'handlers/rh/presence_handlers.dart';
import 'handlers/rh/salaire_handlers.dart';
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
        '/api/users/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(UserHandlers(repos).router));

    router.mount(
        '/rh/salaires/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(SalaireHandlers(repos).router));
    
    router.mount(
        '/api/rh/presences/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PresenceHandlers(repos).router));

    router.mount(
        '/api/rh/paiements/',
        Pipeline()
            .addMiddleware(setJsonHeader())
            .addMiddleware(handleErrors())
            // .addMiddleware(handleAuth(serverSecretKey))
            .addHandler(PaiementHandlers(repos).router));
    
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
