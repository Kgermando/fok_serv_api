import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../repository/repository.dart';
import '../../../models/notify/notify_sum_model.dart';

class MarketingDepartementHandlers {
  final Repository repos;

  MarketingDepartementHandlers(this.repos);

  Router get router {
    final router = Router();
 

    router.get('/get-count-departement-marketing/',
        (Request request) async {
      NotifySumModel data =
          await repos.marketingDepartementRepository.getCountDD();
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
