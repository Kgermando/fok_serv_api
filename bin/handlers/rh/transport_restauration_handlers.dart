import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/transport_restauration_model.dart';
import '../../repository/repository.dart';

class PerformenceHandlers {
  final Repository repos;

  PerformenceHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<TransportRestauration> data = await repos.transportRestauration.getAllData();
      return Response.ok(jsonEncode(data));
    });
 
    router.get('/<id>', (Request request, String id) async {
      late TransportRestauration data;
      try {
        data = await repos.transportRestauration.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });


    router.post('/insert-new-transport-restauration/', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      TransportRestauration data = TransportRestauration(
          title: input['title'],
          agents: input['agents'],
          ligneBudgtaire: input['ligneBudgtaire'],
          resources: input['resources'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));

      try {
        await repos.transportRestauration.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transport-restauration/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      TransportRestauration data = await repos.transportRestauration.getFromId(int.parse(id!));

      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['agents'] != null) {
        data.agents = input['agents'];
      }
      if (input['ligneBudgtaire'] != null) {
        data.ligneBudgtaire = input['ligneBudgtaire'];
      }
      if (input['resources'] != null) {
        data.resources = input['resources'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.transportRestauration.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-performence/<id>', (Request request) async {
      var id = request.params['id'];
      repos.transportRestauration.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Transport et Restauration n\'est pas trouvé'),
    );
    return router;
  }
}