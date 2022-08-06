import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../repository/repository.dart';
import '../../../models/notify/notify_model.dart';

class CommMarketingDepartementHandlers {
  final Repository repos;

  CommMarketingDepartementHandlers(this.repos);

  Router get router {
    final router = Router();
 

    router.get('/get-count-departement-comm-marketing/',
        (Request request) async {
      NotifyModel data =
          await repos.commMarketingDepartementRepository.getCountDD();
      return Response.ok(jsonEncode(data));
    });

    
    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(
          'La Page Comm Marketing Departement count n\'est pas trouvé'),
    );

    return router;
  }
}
