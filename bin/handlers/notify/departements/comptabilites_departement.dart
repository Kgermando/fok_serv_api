import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../repository/repository.dart';
import '../../../models/notify/notify_model.dart';

class ComptabiliteDepartementHandlers {
  final Repository repos;

  ComptabiliteDepartementHandlers(this.repos);

  Router get router {
    final router = Router();
 
    router.get('/get-count-departement-comptabilite/', (Request request) async {
      NotifyModel data =
          await repos.comptabiliteDepartementRepository.getCountDD();
      return Response.ok(jsonEncode(data));
    });

    

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(
          'La Page Comptabilite Departement count n\'est pas trouvé'),
    );

    return router;
  }
}
