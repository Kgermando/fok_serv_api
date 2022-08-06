import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../repository/repository.dart';
import '../../../models/notify/notify_model.dart';

class BudgetDepartementHandlers {
  final Repository repos;

  BudgetDepartementHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/get-count-departement-budget/', (Request request) async {
      NotifyModel data =
          await repos.budgetDepartementRepository.getCountBudget();
      return Response.ok(jsonEncode(data));
    }); 

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(
          'La Page Budget Departement count n\'est pas trouvé'),
    );

    return router;
  }
}
