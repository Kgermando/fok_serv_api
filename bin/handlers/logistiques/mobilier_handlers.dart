import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/mobilier_model.dart';
import '../../repository/repository.dart';

class MobilierHandlers {
  final Repository repos;

  MobilierHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<MobilierModel> data = await repos.mobiliers.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late MobilierModel mobilierModel;
      try {
        mobilierModel = await repos.mobiliers.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(mobilierModel.toJson()));
    });

    router.post('/insert-new-mobilier', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      MobilierModel mobilierModel = MobilierModel(
        nom: input['nom'],
        modele: input['modele'],
        marque: input['marque'],
        descriptionMobilier: input['descriptionMobilier'],
        nombre: input['nombre'],
        created: DateTime.parse(input['created']),
        signature: input['signature']);

      try {
        await repos.mobiliers.insertData(mobilierModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(mobilierModel.toJson()));
    });

    router.put('/update-mobilier/<id>', (Request request, String id) async {
      var id = request.params['id'];
      MobilierModel mobilierModel = await repos.mobiliers.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['nom'] != null) {
        mobilierModel.nom = input['nom'];
      }
      if (input['modele'] != null) {
        mobilierModel.modele = input['modele'];
      }
      if (input['marque'] != null) {
        mobilierModel.marque = input['marque'];
      }
      if (input['descriptionMobilier'] != null) {
        mobilierModel.descriptionMobilier = input['descriptionMobilier'];
      }
      if (input['nombre'] != null) {
        mobilierModel.nombre = input['nombre'];
      }
      if (input['created'] != null) {
        mobilierModel.created = DateTime.parse(input['created']);
      }
      if (input['signature'] != null) {
        mobilierModel.signature = input['signature'];
      }
      repos.mobiliers.update(mobilierModel);
      return Response.ok(jsonEncode(mobilierModel.toJson()));
    });

    router.delete('/delete-mobilier/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.mobiliers.deleteData(int.parse(id!));
      return Response.ok('mobiliers supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page mobiliers n\'est pas trouvé'),
    );

    return router;
  }

}