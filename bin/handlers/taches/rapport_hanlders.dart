import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/taches/rapport_model.dart';
import '../../repository/repository.dart';

class RapportHandlers {
  final Repository repos;

  RapportHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<RapportModel> data = await repos.rapports.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late RapportModel data;
      try {
        data = await repos.rapports.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-rapport', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      RapportModel data = RapportModel(
        nom: input['nom'],
        numeroTache: input['numeroTache'],
        rapport: input['rapport'],
        signature: input['signature'],
        created: DateTime.parse(input['created']),
        reference: input['reference'],
      );
      try {
        await repos.rapports.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-rapport/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = RapportModel.fromJson(input);
      RapportModel? data =
          await repos.rapports.getFromId(editH.id!); 

      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['numeroTache'] != null) {
        data.numeroTache = input['numeroTache'];
      }
      if (input['rapport'] != null) {
        data.rapport = input['rapport'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['reference'] != null) {
        data.reference = input['reference'];
      }

      repos.rapports.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-rapport/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.rapports.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page rapport n\'est pas trouvé'),
    );
    return router;
  }
}
