import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/restitution_model.dart';
import '../../../repository/repository.dart';

class RestitutionHandlers {
  final Repository repos;

  RestitutionHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<RestitutionModel> data = await repos.restitutions.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late RestitutionModel data;
      try {
        data = await repos.restitutions.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-restitution', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      RestitutionModel data = RestitutionModel(
          idProduct: input['idProduct'],
          quantity: input['quantity'],
          unite: input['unite'],
          firstName: input['firstName'],
          lastName: input['lastName'],
          accuseReception: input['accuseReception'] as bool,
          accuseReceptionFirstName: input['accuseReceptionFirstName'],
          accuseReceptionLastName: input['accuseReceptionLastName'],
          role: input['role'],
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
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created'])
        );
      try {
        await repos.restitutions.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-restitution/<id>', (Request request, String id) async {
      var id = request.params['id'];
      RestitutionModel data = await repos.restitutions.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['idProduct'] != null) {
        data.idProduct = input['idProduct'];
      }
      if (input['quantity'] != null) {
        data.quantity = input['quantity'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['firstName'] != null) {
        data.firstName = input['firstName'];
      }
      if (input['lastName'] != null) {
        data.lastName = input['lastName'];
      }
      if (input['accuseReception'] != null) {
        data.accuseReception = input['accuseReception'] as bool;
      }
      if (input['accuseReceptionFirstName'] != null) {
        data.accuseReceptionFirstName = input['accuseReceptionFirstName'];
      }
      if (input['accuseReceptionLastName'] != null) {
        data.accuseReceptionLastName = input['accuseReceptionLastName'];
      }
      if (input['role'] != null) {
        data.role = input['role'];
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
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.restitutions.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-restitution/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.restitutions.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page restitution n\'est pas trouvé'),
    );

    return router;
  }
}