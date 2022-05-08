import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/agenda_model.dart';
import '../../../repository/repository.dart';

class AgendaHandlers {
  final Repository repos;

  AgendaHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<AgendaModel> data = await repos.agendas.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AgendaModel data;
      try {
        data = await repos.agendas.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-agenda', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      AgendaModel data = AgendaModel(
          title: input['title'],
          description: input['description'],
          dateRappel: DateTime.parse(input['dateRappel']),
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.agendas.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-agenda/<id>', (Request request, String id) async {
      var id = request.params['id'];
      AgendaModel data = await repos.agendas.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['description'] != null) {
        data.description = input['description'];
      }
      if (input['dateRappel'] != null) {
        data.dateRappel = DateTime.parse(input['dateRappel']);
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.agendas.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-agenda/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.annuaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page annuaires n\'est pas trouvé'),
    );

    return router;
  }
}
