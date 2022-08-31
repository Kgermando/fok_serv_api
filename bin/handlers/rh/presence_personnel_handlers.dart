import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/presence_personnel_model.dart';
import '../../repository/repository.dart';

class PresencePersonnelHandlers {
  final Repository repos;
  PresencePersonnelHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PresencePersonnelModel> data = await repos.presencePersonnel.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late PresencePersonnelModel data;
      try {
        data = await repos.presencePersonnel.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-presence-personnel', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      PresencePersonnelModel data = PresencePersonnelModel(
          reference: input['reference'],
          identifiant: input['identifiant'],
          motif: input['motif'],
          sortie: input['sortie'],
          signature: input['signature'],
          signatureFermeture: input['signatureFermeture'],
          created: DateTime.parse(input['created']),
          createdSortie: DateTime.parse(input['createdSortie']));
      try {
        await repos.presencePersonnel.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-presence-personnel/', (Request request) async {
     dynamic input = jsonDecode(await request.readAsString());
      final editH = PresencePersonnelModel.fromJson(input);
      PresencePersonnelModel? data =
          await repos.presencePersonnel.getFromId(editH.id!);  

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['identifiant'] != null) {
        data.identifiant = input['identifiant'];
      }
      if (input['motif'] != null) {
        data.motif = input['motif'];
      }
      if (input['sortie'] != null) {
        data.sortie = input['sortie'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['signatureFermeture'] != null) {
        data.signatureFermeture = input['signatureFermeture'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['createdSortie'] != null) {
        data.createdSortie = DateTime.parse(input['createdSortie']);
      }
      repos.presencePersonnel.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-presence-personnel/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.presencePersonnel.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page presence personnel entrer n\'est pas trouvé'),
    );

    return router;
  }
}
