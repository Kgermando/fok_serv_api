import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/notify/notify_model.dart';
import '../../../repository/repository.dart';

class CartNotifyHandlers {
  final Repository repos;

  CartNotifyHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/get-count/<matricule>', (Request request, String matricule) async {
      NotifyModel data = await repos.cartCount.getCount(matricule);
      return Response.ok(jsonEncode(data));
    }); 

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page cart count n\'est pas trouvé'),
    );
    return router;
  }
}
