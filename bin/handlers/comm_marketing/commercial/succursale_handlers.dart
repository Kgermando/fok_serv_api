import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/succursale_model.dart';
import '../../../repository/repository.dart';

class SuccursaleHandlers {
  final Repository repos;

  SuccursaleHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<SuccursaleModel> data = await repos.succursales.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late SuccursaleModel data;
      try {
        data = await repos.succursales.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-succursale', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      SuccursaleModel data = SuccursaleModel(
          name: input['name'],
          adresse: input['adresse'],
          province: input['province'],
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
        await repos.succursales.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-succursale/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      SuccursaleModel data = await repos.succursales.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['name'] != null) {
        data.name = input['name'];
      }
      if (input['adresse'] != null) {
        data.adresse = input['adresse'];
      }
      if (input['province'] != null) {
        data.province = input['province'];
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
      repos.succursales.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-succursale/<id>',
        (String id, Request request) async {
      var id = request.params['id'];
      repos.succursales.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page succursale n\'est pas trouvé'),
    );

    return router;
  }
}