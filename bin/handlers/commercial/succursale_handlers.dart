import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/courbe_vente_gain_model.dart';
import '../../models/commercial/succursale_model.dart';
import '../../models/commercial/vente_chart_model.dart';
import '../../repository/repository.dart';

class SuccursaleHandlers {
  final Repository repos;

  SuccursaleHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<SuccursaleModel> data = await repos.succursales.getAllData(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/vente-chart/<business>/<name>', (Request request, String business, String name) async {
      List<VenteChartModel> data = await repos.succursales.getAllDataChart(business, name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/vente-chart-day/<business>/<name>', (Request request, String business, String name) async {
      List<CourbeVenteModel> data = await repos.succursales.getVenteChartDay(business, name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/vente-chart-month/<business>/<name>', (Request request, String business, String name) async {
      List<CourbeVenteModel> data = await repos.succursales.getVenteChartMounth(business, name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/vente-chart-year/<business>/<name>', (Request request, String business, String name) async {
      List<CourbeVenteModel> data = await repos.succursales.getVenteChartYear(business, name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-day/<business>/<name>', (Request request, String business, String name) async {
      List<CourbeGainModel> data = await repos.succursales.getGainChartDay(business, name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-month/<business>/<name>', (Request request, String business, String name) async {
      List<CourbeGainModel> data = await repos.succursales.getGainChartMounth(business, name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/gain-chart-year/<business>/<name>', (Request request, String business, String name) async {
      List<CourbeGainModel> data = await repos.succursales.getGainChartYear(business, name);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late SuccursaleModel data;
      try {
        data = await repos.succursales.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-succursale', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      SuccursaleModel data = SuccursaleModel(
          name: input['name'],
          adresse: input['adresse'],
          province: input['province'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
          business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.succursales.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-succursale/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = SuccursaleModel.fromJson(input);
      SuccursaleModel? data =
          await repos.succursales.getFromId(editH.id!); 

      if (input['name'] != null) {
        data.name = input['name'];
      }
      if (input['adresse'] != null) {
        data.adresse = input['adresse'];
      }
      if (input['province'] != null) {
        data.province = input['province'];
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
      repos.succursales.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-succursale/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.succursales.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page succursale n\'est pas trouvé'),
    );

    return router;
  }
}
