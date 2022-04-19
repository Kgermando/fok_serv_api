import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/gain_model.dart';
import '../../../repository/repository.dart';

class GainsHandlers {
  final Repository repos;

  GainsHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<GainModel> data = await repos.gains.getAllData();
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
          created: DateTime.parse(input['created']),
          telephone: input['telephone'],
          succursale: input['succursale'],
          nameBusiness: input['nameBusiness']
        );
      try {
        await repos.gains.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-gain/<id>', (Request request, String id) async {
      var id = request.params['id'];
      GainModel data = await repos.gains.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['sum'] != null) {
        data.sum = input['sum'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['telephone'] != null) {
        data.telephone = input['telephone'];
      }
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['nameBusiness'] != null) {
        data.nameBusiness = input['nameBusiness'];
      }
      repos.gains.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-gain/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.gains.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page gains n\'est pas trouvé'),
    );

    return router;
  }
}