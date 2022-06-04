import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/presence_model.dart';
import '../../repository/repository.dart';

class PresenceHandlers {
  final Repository repos;
  PresenceHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PresenceModel> data = await repos.presences.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late PresenceModel data;
      try {
        data = await repos.presences.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-presence', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PresenceModel data = PresenceModel(
          remarque: input['remarque'],
          finJournee: input['finJournee'] as bool,
          signature: input['signature'],
          createdRef: DateTime.parse(input['createdRef']),
          created: DateTime.parse(input['created']));
      try {
        await repos.presences.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-presence/<id>', (Request request, String id) async {
      var id = request.params['id'];
      PresenceModel data = await repos.presences.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['remarque'] != null) {
        data.remarque = input['remarque'];
      }
      if (input['finJournee'] != null) {
        data.finJournee = input['finJournee'] as bool;
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['createdRef'] != null) {
        data.createdRef = DateTime.parse(input['createdRef']);
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.presences.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-presence/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.presences.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page presences n\'est pas trouvé'),
    );

    return router;
  }
}
