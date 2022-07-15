import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_model.dart';
import '../../../repository/repository.dart';

class BalanceNotifyHandlers {
  final Repository repos;

  BalanceNotifyHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/get-count-dg/', (Request request) async {
      NotifyModel data = await repos.balanceNotifyCount.getCountDG();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-dd/', (Request request) async {
      NotifyModel data = await repos.balanceNotifyCount.getCountDD();
      return Response.ok(jsonEncode(data));
    }); 

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Balance count n\'est pas trouvé'),
    );
    return router;
  }
}
