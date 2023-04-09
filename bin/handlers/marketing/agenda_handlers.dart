import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/marketing/agenda_model.dart';
import '../../repository/repository.dart';

class AgendaHandlers {
  final Repository repos;

  AgendaHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<AgendaModel> data = await repos.agendas.getAllData(business);
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
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.agendas.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-agenda/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = AgendaModel.fromJson(input);
      AgendaModel? data =
          await repos.agendas.getFromId(editH.id!); 
          
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
      if (input['business'] != null) {
        data.business = input['business'];
      }
      if (input['sync'] != null) {
        data.sync = input['sync'];
      }
      if (input['async'] != null) {
        data.async = input['async'];
      }
      repos.agendas.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-agenda/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.agendas.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });


    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page agendas n\'est pas trouvé'),
    );

    return router;
  }
}
