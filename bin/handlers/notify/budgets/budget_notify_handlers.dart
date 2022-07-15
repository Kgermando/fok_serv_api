import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_model.dart';
import '../../../repository/repository.dart';

class BudgetNotifyHandlers {
  final Repository repos;

  BudgetNotifyHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/get-count-dg/', (Request request) async {
      NotifyModel data = await repos.budgetNotifyCount.getCountDG();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-dd/', (Request request) async {
      NotifyModel data = await repos.budgetNotifyCount.getCountDD();
      return Response.ok(jsonEncode(data));
    }); 

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page budget count n\'est pas trouvé'),
    );

    return router;
  }
}
