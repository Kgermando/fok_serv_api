import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';


import '../../models/logistiques/objet_remplace_model.dart';
import '../../repository/repository.dart';

class ObjetsRemplaceHandlers {
  final Repository repos;

  ObjetsRemplaceHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ObjetRemplaceModel> data = await repos.objetsRemplace.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ObjetRemplaceModel data;
      try {
        data = await repos.objetsRemplace.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-objet-remplace', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      ObjetRemplaceModel data = ObjetRemplaceModel(
        reference: input['reference'],
        nom: input['nom'],
        cout: input['cout'],
        caracteristique: input['caracteristique'], 
        observation: input['observation'] 
      );

      try {
        await repos.objetsRemplace.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-objet-remplace/<id>', (Request request, String id) async {
      var id = request.params['id'];
      ObjetRemplaceModel data = await repos.objetsRemplace.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['cout'] != null) {
        data.cout = input['cout'];
      }
      if (input['caracteristique'] != null) {
        data.caracteristique = input['caracteristique'];
      } 
      if (input['observation'] != null) {
        data.observation = input['observation'];
      } 
      repos.objetsRemplace.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-objet-remplace/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.objetsRemplace.deleteData(int.parse(id!));
      return Response.ok('objets Remplace supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page objets Remplace n\'est pas trouvé'),
    );

    return router;
  }
}