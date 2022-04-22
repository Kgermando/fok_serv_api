import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/agenda_model.dart';
import '../../../repository/repository.dart';

class AgendaHandlers {
  final Repository repos;

  AgendaHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<AgendaModel> data = await repos.agendas.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AgendaModel data;
      try {
        data = await repos.agendas.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-agenda', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      AgendaModel data = AgendaModel(
        title: input['title'],
        description: input['description'],
        number: input['number'],
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
        await repos.agendas.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-agenda/<id>', (Request request, String id) async {
      var id = request.params['id'];
      AgendaModel data = await repos.agendas.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['description'] != null) {
        data.description = input['description'];
      }
      if (input['number'] != null) {
        data.number = input['number'];
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
      repos.agendas.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-agenda/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.annuaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page annuaires n\'est pas trouvé'),
    );

    return router;
  }
}