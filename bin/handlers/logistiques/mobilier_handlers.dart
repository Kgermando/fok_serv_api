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
        signature: input['signature'],
        createdRef: DateTime.parse(input['createdRef']),
        created: DateTime.parse(input['created'])
        );

      try {
        await repos.mobiliers.insertData(mobilierModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(mobilierModel.toJson()));
    });

    router.put('/update-mobilier/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = MobilierModel.fromJson(input);
      MobilierModel? data =
          await repos.mobiliers.getFromId(editH.id!); 
          
      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['modele'] != null) {
        data.modele = input['modele'];
      }
      if (input['marque'] != null) {
        data.marque = input['marque'];
      }
      if (input['descriptionMobilier'] != null) {
        data.descriptionMobilier = input['descriptionMobilier'];
      }
      if (input['nombre'] != null) {
        data.nombre = input['nombre'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['createdRef'] != null) {
        data.createdRef = DateTime.parse(input['createdRef']);
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.mobiliers.update(data);
      return Response.ok(jsonEncode(data.toJson()));
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