import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/transport_restauration_model.dart';
import '../../repository/repository.dart';

class TransportRestaurantHandlers {
  final Repository repos;

  TransportRestaurantHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<TransportRestaurationModel> data =
          await repos.transportRestauration.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late TransportRestaurationModel data;
      try {
        data = await repos.transportRestauration.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-transport-restauration', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      TransportRestaurationModel data = TransportRestaurationModel(
          title: input['title'],
          observation: input['observation'],
          signature: input['signature'],
          createdRef: DateTime.parse(input['createdRef']),
          created: DateTime.parse(input['created']));

      try {
        await repos.transportRestauration.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transport-restauration/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = TransportRestaurationModel.fromJson(input);
      TransportRestaurationModel? data =
          await repos.transportRestauration.getFromId(editH.id!); 

      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['observation'] != null) {
        data.observation = input['observation'];
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
      repos.transportRestauration.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transport-restauration/<id>',
        (Request request) async {
      var id = request.params['id'];
      repos.transportRestauration.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(
          'La Page Transport et Restauration n\'est pas trouvé'),
    );
    return router;
  }
}
