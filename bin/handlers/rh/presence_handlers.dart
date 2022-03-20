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

    router.post('/insert-new-presence', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PresenceModel data = PresenceModel(
        matricule: input['matricule'],
        arrive: DateTime.parse(input['arrive']),
        sortie: DateTime.parse(input['sortie']),
        presence: input['presence'],
        motif: input['motif'],
        created: DateTime.parse(input['created'])
      );
      try {
        await repos.presences.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-presence/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      PresenceModel data =
          await repos.presences.getFromId(int.parse(id!));

      // if (input['matricule'] != null) {
      //   salaireModel.matricule = input['matricule'];
      // }
      if (input['arrive'] != null) {
        data.arrive = DateTime.parse(input['arrive']);
      }
      if (input['sortie'] != null) {
        data.sortie = DateTime.parse(input['sortie']);
      }
      if (input['presence'] != null) {
        data.presence = input['presence'];
      }
      if (input['motif'] != null) {
        data.motif = input['motif'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.presences.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });


    router.delete('/delete-presence/<id>', (Request request) async {
      var id = request.params['id'];
      repos.salaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page presence n\'est pas trouvé'),
    );
    return router;
  }
}
