import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/presence_entrer_model.dart';
import '../../repository/repository.dart';

class PresenceEntreHandlers {
  final Repository repos;
  PresenceEntreHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PresenceEntrerModel> data = await repos.presencesEntrer.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late PresenceEntrerModel data;
      try {
        data = await repos.presencesEntrer.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-presence-entrer', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      PresenceEntrerModel data = PresenceEntrerModel(
          reference: input['reference'],
          nom: input['nom'],
          prenom: input['prenom'],
          matricule: input['matricule'],
          note: input['note'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.presencesEntrer.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-presence-entrer/', (Request request) async {
     dynamic input = jsonDecode(await request.readAsString());
      final editH = PresenceEntrerModel.fromJson(input);
      PresenceEntrerModel? data =
          await repos.presencesEntrer.getFromId(editH.id!);  

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['prenom'] != null) {
        data.prenom = input['prenom'];
      }
      if (input['matricule'] != null) {
        data.matricule = input['matricule'];
      }
      if (input['note'] != null) {
        data.note = input['note'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.presencesEntrer.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-presence-entrer/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.presencesEntrer.deleteData(int.parse(id!));
      return Response.ok('Supprim??e');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page presences entrer n\'est pas trouv??'),
    );

    return router;
  }
}
