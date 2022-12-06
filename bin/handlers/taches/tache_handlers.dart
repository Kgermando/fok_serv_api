import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/taches/tache_model.dart';
import '../../repository/repository.dart';

class TacheHandlers {
  final Repository repos;

  TacheHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<TacheModel> data = await repos.taches.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late TacheModel dataId;
      try {
        dataId = await repos.taches.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataId.toJson()));
    });

    router.post('/insert-new-tache', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      TacheModel data = TacheModel(
        nom: input['nom'],
        numeroTache: input['numeroTache'],
        agent: input['agent'],
        jalon: input['jalon'],
        tache: input['tache'],
        signatureResp: input['signatureResp'],
        created: DateTime.parse(input['created']),
        read: input['read'],
        departement: input['departement'],
        reference: input['reference']
      );
      try {
        await repos.taches.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-tache/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = TacheModel.fromJson(input);
      TacheModel? data =
          await repos.taches.getFromId(editH.id!); 

      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['numeroTache'] != null) {
        data.numeroTache = input['numeroTache'];
      }
      if (input['agent'] != null) {
        data.agent = input['agent'];
      }
      if (input['jalon'] != null) {
        data.jalon = input['jalon'];
      }
      if (input['tache'] != null) {
        data.tache = input['tache'];
      }
      if (input['signatureResp'] != null) {
        data.signatureResp = input['signatureResp'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['read'] != null) {
        data.read = input['read'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['reference'] != null) {
        data.reference = input['reference'];
      }

      repos.taches.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-tache/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.taches.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page tache n\'est pas trouvé'),
    );

    return router;
  }
}
