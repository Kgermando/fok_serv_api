import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/transport_restauration_model.dart';
import '../../repository/repository.dart';

class TransportRestaurantHandlers {
  final Repository repos;

  TransportRestaurantHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<TransportRestaurationModel> data =
          await repos.transportRestauration.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late TransportRestaurationModel data;
      try {
        data = await repos.transportRestauration.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-transport-restauration', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      TransportRestaurationModel data = TransportRestaurationModel(
          title: input['title'],
          observation: input['observation'],
          signature: input['signature'],
          createdRef: DateTime.parse(input['createdRef']),
          created: DateTime.parse(input['created']),
          approbationDG: input['approbationDG'],
          motifDG: input['motifDG'],
          signatureDG: input['signatureDG'],
          approbationBudget: input['approbationBudget'],
          motifBudget: input['motifBudget'],
          signatureBudget: input['signatureBudget'],
          approbationFin: input['approbationFin'],
          motifFin: input['motifFin'],
          signatureFin: input['signatureFin'],
          approbationDD: input['approbationDD'],
          motifDD: input['motifDD'],
          signatureDD: input['signatureDD'],
          ligneBudgetaire: input['ligneBudgetaire'],
          ressource: input['ressource']);

      try {
        await repos.transportRestauration.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transport-restauration/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = TransportRestaurationModel.fromJson(input);
      TransportRestaurationModel? data =
          await repos.transportRestauration.getFromId(editH.id!); 

      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['observation'] != null) {
        data.observation = input['observation'];
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
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['motifDG'] != null) {
        data.motifDG = input['motifDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['motifBudget'] != null) {
        data.motifBudget = input['motifBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['motifFin'] != null) {
        data.motifFin = input['motifFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
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
      if (input['ligneBudgetaire'] != null) {
        data.ligneBudgetaire = input['ligneBudgetaire'];
      }
      if (input['ressource'] != null) {
        data.ressource = input['ressource'];
      }
      repos.transportRestauration.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transport-restauration/<id>',
        (Request request) async {
      var id = request.params['id'];
      repos.transportRestauration.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound(
          'La Page Transport et Restauration n\'est pas trouvé'),
    );
    return router;
  }
}
