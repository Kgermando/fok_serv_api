import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/succursale_model.dart';
import '../../../repository/repository.dart';

class SuccursaleHandlers {
  final Repository repos;

  SuccursaleHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<SuccursaleModel> data = await repos.succursales.getAllData();
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
          pays: input['pays'],
          nameBusiness: input['nameBusiness'],
          created: DateTime.parse(input['created']));
      try {
        await repos.succursales.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-succursale/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      SuccursaleModel data = await repos.succursales.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['name'] != null) {
        data.name = input['name'];
      }
      if (input['adresse'] != null) {
        data.adresse = input['adresse'];
      }
      if (input['pays'] != null) {
        data.pays = input['pays'];
      }
      if (input['nameBusiness'] != null) {
        data.nameBusiness = input['nameBusiness'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.succursales.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-succursale/<id>',
        (String id, Request request) async {
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