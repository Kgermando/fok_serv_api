import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_model.dart';
import '../../../repository/repository.dart';

class MailsNotifyHandlers {
  final Repository repos;

  MailsNotifyHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/get-count/<email>', (Request request, String email) async {
      NotifyModel data = await repos.tacheNotifyCount.getCount(email);
      return Response.ok(jsonEncode(data));
    }); 

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Mails count n\'est pas trouvé'),
    );
    return router;
  }
}
