import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_model.dart';
import '../../../repository/repository.dart';

class DevisNotifyHandlers {
  final Repository repos;

  DevisNotifyHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/get-count-dg/', (Request request) async {
      NotifyModel data = await repos.devisNotifyCount.getCountDG();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-dd/', (Request request) async {
      NotifyModel data = await repos.devisNotifyCount.getCountDD();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-budget/', (Request request) async {
      NotifyModel data = await repos.devisNotifyCount.getCountBudget();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-fin/', (Request request) async {
      NotifyModel data = await repos.devisNotifyCount.getCountFin();
      return Response.ok(jsonEncode(data));
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Devis count n\'est pas trouvé'),
    );

    return router;
  }
}
