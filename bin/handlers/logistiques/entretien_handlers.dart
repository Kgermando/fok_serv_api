import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/entretien_model.dart';
import '../../repository/repository.dart';

class EntretienHandlers {
  final Repository repos;

  EntretienHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<EntretienModel> data = await repos.entretiens.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late EntretienModel entretienModel;
      try {
        entretienModel = await repos.entretiens.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(entretienModel.toJson()));
    });

    router.post('/insert-new-entretien', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      EntretienModel entretienModel = EntretienModel(
        nom: input['nom'],
        typeObjet: input['typeObjet'],
        typeMaintenance: input['typeMaintenance'], 
        dureeTravaux: input['dureeTravaux'], 
        signature: input['signature'], 
        created: DateTime.parse(input['created']),
        approbationDD: input['approbationDD'],
        motifDD: input['motifDD'],
        signatureDD: input['signatureDD'],
        isSubmit: input['isSubmit']
      );

      try {
        await repos.entretiens.insertData(entretienModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(entretienModel.toJson()));
    });

    router.put('/update-entretien/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = EntretienModel.fromJson(input);
      EntretienModel? data =
          await repos.entretiens.getFromId(editH.id!); 
          
      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['typeObjet'] != null) {
        data.typeObjet = input['typeObjet'];
      }
      if (input['typeMaintenance'] != null) {
        data.typeMaintenance = input['typeMaintenance'];
      } 
      if (input['dureeTravaux'] != null) {
        data.dureeTravaux = input['dureeTravaux'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['isSubmit'] != null) {
        data.isSubmit = input['isSubmit'];
      }

      
      repos.entretiens.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-entretien/<id>', (
      Request request, String id
    ) async {
      var id = request.params['id'];
      repos.entretiens.deleteData(int.parse(id!));
      return Response.ok('entretiens supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page entretiens n\'est pas trouvé'),
    );

    return router;
  }
}