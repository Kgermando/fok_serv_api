import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../repository/repository.dart';
import '../../../models/notify/notify_sum_model.dart';

class LogistiqueDepartementHandlers {
  final Repository repos;

  LogistiqueDepartementHandlers(this.repos);

  Router get router {
    final router = Router();

    
    router.get('/get-count-departement-logistique/', (Request request) async {
      NotifySumModel data =
          await repos.logistiqueDepartementRepository.getCountDD();
      return Response.ok(jsonEncode(data));
    }); 

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(
          'La Page logistique Departement count n\'est pas trouvé'),
    );

    return router;
  }
}
