import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/presence_sortie_model.dart';
import '../../repository/repository.dart';

class PresenceSortieHandlers {
  final Repository repos;
  PresenceSortieHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PresenceSortieModel> data = await repos.presencesSortie.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late PresenceSortieModel data;
      try {
        data = await repos.presencesSortie.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-presence-sortie', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      PresenceSortieModel data = PresenceSortieModel(
          reference: input['reference'],
          nom: input['nom'],
          prenom: input['prenom'],
          matricule: input['matricule'],
          note: input['note'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.presencesSortie.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-presence-sortie/<id>', (Request request, String id) async {
      var id = request.params['id'];
      PresenceSortieModel data = await repos.presencesSortie.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      // if (input['reference'] != null) {
      //   data.reference = input['reference'];
      // }
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
      repos.presencesSortie.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-presence-sortie/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.presencesSortie.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page presences sortie n\'est pas trouvé'),
    );

    return router;
  }
}
