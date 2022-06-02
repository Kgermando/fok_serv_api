import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/charts/pie_chart_model.dart';
import '../../models/devis/devis_models.dart';
import '../../repository/repository.dart';

class DevisHandlers {
  final Repository repos;

  DevisHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<DevisModel> data = await repos.devis.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-pie-dep-mounth/', (Request request) async {
      List<PieChartModel> data = await repos.devis.getDepartementChartPieMounth();
      return Response.ok(jsonEncode(data));
    });
    router.get('/chart-pie-dep-year/', (Request request) async {
      List<PieChartModel> data = await repos.devis.getDepartementChartPieYear();
      return Response.ok(jsonEncode(data));
    });


    router.get('/<id>', (Request request, String id) async {
      late DevisModel data;
      try {
        data = await repos.devis.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-devis', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      DevisModel data = DevisModel(
          title: input['title'],
          priority: input['priority'],
          departement: input['departement'],
          observation: input['observation'],
          signature: input['signature'],
          createdRef: DateTime.parse(input['createdRef']),
          created: DateTime.parse(input['created']),
        isSubmit: input['isSubmit'],
      );
      try {
        await repos.devis.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-devis/<id>', (Request request, String id) async {
      var id = request.params['id'];
      DevisModel data = await repos.devis.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['priority'] != null) {
        data.priority = input['priority'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['observation'] != null) {
        data.observation = input['observation'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      // if (input['createdRef'] != null) {
      //   data.createdRef = DateTime.parse(input['createdRef']); Ne pas modifier ficher refence
      // }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['isSubmit'] != null) {
        data.isSubmit = input['isSubmit'];
      }

      repos.devis.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-devis/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.devis.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page devis n\'est pas trouvé'),
    );

    return router;
  }
}
