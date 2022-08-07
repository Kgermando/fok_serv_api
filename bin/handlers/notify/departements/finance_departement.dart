import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../repository/repository.dart';
import '../../../models/notify/notify_sum_model.dart';

class FinanceDepartementHandlers {
  final Repository repos;

  FinanceDepartementHandlers(this.repos);

  Router get router {
    final router = Router();
 
    router.get('/get-count-departement-finance/', (Request request) async {
      NotifySumModel data =
          await repos.financeDepartementRepository.getCountFin();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-count-departement-finance-obs/', (Request request) async {
      NotifySumModel data =
          await repos.financeDepartementRepository.getCountFinObs();
      return Response.ok(jsonEncode(data));
    });
 

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(
          'La Page finance Departement count n\'est pas trouvé'),
    );

    return router;
  }
}
