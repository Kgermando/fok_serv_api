import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/presence_model.dart';
import '../../repository/repository.dart';

class PresenceHandlers {
  final Repository repos;
  PresenceHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PresenceModel> data = await repos.presences.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-presence', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PresenceModel data = PresenceModel(
        agent: input['agent'],
        arrive: DateTime.parse(input['arrive']),
        sortie: DateTime.parse(input['sortie']),
        presence: input['presence'],
        motif: input['motif'], 
        approbationDG: input['approbationDG'],
          signatureDG: input['signatureDG'],
          signatureJustificationDG: input['signatureJustificationDG'],
          approbationFin: input['approbationFin'],
          signatureFin: input['signatureFin'],
          signatureJustificationFin: input['signatureJustificationFin'],
          approbationBudget: input['approbationBudget'],
          signatureBudget: input['signatureBudget'],
          signatureJustificationBudget: input['signatureJustificationBudget'],
          approbationDD: input['approbationDD'],
          signatureDD: input['signatureDD'],
          signatureJustificationDD: input['signatureJustificationDD'],
          signature: input['signature'],
          created: DateTime.parse(input['created'])
      );
      try {
        await repos.presences.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-presence/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      PresenceModel data =
          await repos.presences.getFromId(int.parse(id!));

      if (input['agent'] != null) {
        data.agent = input['agent'];
      }
      if (input['arrive'] != null) {
        data.arrive = DateTime.parse(input['arrive']);
      }
      if (input['sortie'] != null) {
        data.sortie = DateTime.parse(input['sortie']);
      }
      if (input['presence'] != null) {
        data.presence = input['presence'];
      }
      if (input['motif'] != null) {
        data.motif = input['motif'];
      }
       if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['signatureJustificationDG'] != null) {
        data.signatureJustificationDG = input['signatureJustificationDG'];
      }

      if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
      }
      if (input['signatureJustificationFin'] != null) {
        data.signatureJustificationFin = input['signatureJustificationFin'];
      }

      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['signatureJustificationBudget'] != null) {
        data.signatureJustificationBudget =
            input['signatureJustificationBudget'];
      }

      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['signatureJustificationDD'] != null) {
        data.signatureJustificationDD = input['signatureJustificationDD'];
      }

      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.presences.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });


    router.delete('/delete-presence/<id>', (Request request) async {
      var id = request.params['id'];
      repos.salaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page presence n\'est pas trouvé'),
    );
    return router;
  }
}
