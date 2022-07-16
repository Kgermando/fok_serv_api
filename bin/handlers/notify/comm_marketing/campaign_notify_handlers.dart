import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_model.dart';
import '../../../repository/repository.dart';

class CampaignNotifyHandlers {
  final Repository repos;

  CampaignNotifyHandlers(this.repos);

   Router get router {
    final router = Router();

    router.get('/get-count-dg/', (Request request) async {
      NotifyModel data = await repos.campaignNotifyCount.getCountDG();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-dd/', (Request request) async {
      NotifyModel data = await repos.campaignNotifyCount.getCountDD();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-budget/', (Request request) async {
      NotifyModel data = await repos.campaignNotifyCount.getCountBudget();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-fin/', (Request request) async {
      NotifyModel data = await repos.campaignNotifyCount.getCountFin();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-obs/', (Request request) async {
      NotifyModel data = await repos.campaignNotifyCount.getCountObs();
      return Response.ok(jsonEncode(data));
    });


    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page campaign count n\'est pas trouvé'),
    );
    return router;
  }
}
