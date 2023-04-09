import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/courbe_vente_gain_model.dart';
import '../../models/commercial/gain_model.dart';
import '../../repository/repository.dart';

class GainsHandlers {
  final Repository repos;

  GainsHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<GainModel> data = await repos.gains.getAllData(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-day/<business>', (Request request, String business) async {
      List<CourbeGainModel> data = await repos.gains.getAllDataChartDay(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-month/<business>', (Request request, String business) async {
      List<CourbeGainModel> data = await repos.gains.getAllDataChartMounth(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-year/<business>', (Request request, String business) async {
      List<CourbeGainModel> data = await repos.gains.getAllDataChartYear(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late GainModel data;
      try {
        data = await repos.gains.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-gain', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      GainModel data = GainModel(
          sum: input['sum'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.gains.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-gain/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = GainModel.fromJson(input);
      GainModel? data =
          await repos.gains.getFromId(editH.id!); 

      if (input['sum'] != null) {
        data.sum = input['sum'];
      }
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['business'] != null) {
        data.business = input['business'];
      }
      if (input['sync'] != null) {
        data.sync = input['sync'];
      }
      if (input['async'] != null) {
        data.async = input['async'];
      }
      repos.gains.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-gain/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.gains.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page gains n\'est pas trouvé'),
    );

    return router;
  }
}
