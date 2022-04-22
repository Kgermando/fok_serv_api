import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/vente_cart_model.dart';
import '../../../repository/repository.dart';

class VenteHandlers {
  final Repository repos;

  VenteHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<VenteCartModel> data = await repos.ventes.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late VenteCartModel data;
      try {
        data = await repos.ventes.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-vente', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      VenteCartModel data = VenteCartModel(
          idProductCart: input['idProductCart'],
          quantityCart: input['quantityCart'],
          priceTotalCart: input['priceTotalCart'],
          unite: input['unite'],
          tva: input['tva'],
          remise: input['remise'],
          qtyRemise: input['qtyRemise'],
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
        await repos.ventes.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-vente/<id>', (Request request, String id) async {
      var id = request.params['id'];
      VenteCartModel data = await repos.ventes.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['idProductCart'] != null) {
        data.idProductCart = input['idProductCart'];
      }
      if (input['quantityCart'] != null) {
        data.quantityCart = input['quantityCart'];
      }
      if (input['priceTotalCart'] != null) {
        data.priceTotalCart = input['priceTotalCart'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['tva'] != null) {
        data.tva = input['tva'];
      }
      if (input['remise'] != null) {
        data.remise = input['remise'];
      }
      if (input['qtyRemise'] != null) {
        data.qtyRemise = input['qtyRemise'];
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
      repos.ventes.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-vente/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.ventes.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page ventes n\'est pas trouvé'),
    );

    return router;
  }
}