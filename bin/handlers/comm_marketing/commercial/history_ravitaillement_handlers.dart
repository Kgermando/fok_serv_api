import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/history_ravitaillement_model.dart';
import '../../../repository/repository.dart';

class HistoryRavitaillementHandlers {
  final Repository repos;

  HistoryRavitaillementHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<HistoryRavitaillementModel> data =
          await repos.historyRavitaillements.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late HistoryRavitaillementModel data;
      try {
        data = await repos.historyRavitaillements.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-history-ravitaillement', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      HistoryRavitaillementModel data = HistoryRavitaillementModel(
          idProduct: input['idProduct'],
          quantity: input['quantity'],
          quantityAchat: input['quantityAchat'],
          priceAchatUnit: input['priceAchatUnit'],
          prixVenteUnit: input['prixVenteUnit'],
          unite: input['unite'],
          margeBen: input['margeBen'],
          tva: input['tva'],
          qtyRavitailler: input['qtyRavitailler'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.historyRavitaillements.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-history-ravitaillement/',(Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = HistoryRavitaillementModel.fromJson(input);
      HistoryRavitaillementModel? data =
          await repos.historyRavitaillements.getFromId(editH.id!); 

      if (input['idProduct'] != null) {
        data.idProduct = input['idProduct'];
      }
      if (input['quantity'] != null) {
        data.quantity = input['quantity'];
      }
      if (input['quantityAchat'] != null) {
        data.quantityAchat = input['quantityAchat'];
      }
      if (input['priceAchatUnit'] != null) {
        data.priceAchatUnit = input['priceAchatUnit'];
      }
      if (input['prixVenteUnit'] != null) {
        data.prixVenteUnit = input['prixVenteUnit'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['margeBen'] != null) {
        data.margeBen = input['margeBen'];
      }
      if (input['tva'] != null) {
        data.tva = input['tva'];
      }
      if (input['qtyRavitailler'] != null) {
        data.qtyRavitailler = input['qtyRavitailler'];
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
      repos.historyRavitaillements.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-history-ravitaillement/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.historyRavitaillements.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page history-ravitaillement n\'est pas trouvé'),
    );

    return router;
  }
}
