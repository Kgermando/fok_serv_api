import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/charts/pie_chart_model.dart';
import '../../repository/repository.dart';

class DepenseHandlers {
  final Repository repos; 

  DepenseHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/chart-pie-dep-mounth/', (Request request) async {
      List<PieChartModel> data = await repos.depenses.getDepartementChartPieMounth();
      return Response.ok(jsonEncode(data));
    });
    router.get('/chart-pie-dep-year/', (Request request) async {
      List<PieChartModel> data = await repos.depenses.getDepartementChartPieYear();
      return Response.ok(jsonEncode(data));
    });

 
    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page devis n\'est pas trouvé'),
    );

    return router;
  }
}
