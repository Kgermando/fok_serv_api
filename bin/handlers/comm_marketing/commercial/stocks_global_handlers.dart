import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/stocks_global_model.dart';
import '../../../repository/repository.dart';

class StockGlobalHandlers {
  final Repository repos;

  StockGlobalHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<StocksGlobalMOdel> data = await repos.stocksGlobal.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late StocksGlobalMOdel data;
      try {
        data = await repos.stocksGlobal.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-stocks-global', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      StocksGlobalMOdel data = StocksGlobalMOdel(
          idProduct: input['idProduct'],
          quantity: input['quantity'],
          quantityAchat: input['quantityAchat'],
          priceAchatUnit: input['priceAchatUnit'],
          prixVenteUnit: input['prixVenteUnit'],
          unite: input['unite'],
          modeAchat: input['modeAchat'] as bool,
          created: DateTime.parse(input['created']),
          telephone: input['telephone'],
          succursale: input['succursale'],
          nameBusiness: input['nameBusiness'],
          tva: input['tva'],
          qtyRavitailler: input['qtyRavitailler']
        );
      try {
        await repos.stocksGlobal.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-stocks-global/<id>', (Request request, String id) async {
      var id = request.params['id'];
      StocksGlobalMOdel data = await repos.stocksGlobal.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

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
      if (input['modeAchat'] != null) {
        data.modeAchat = input['modeAchat'] as bool;
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['telephone'] != null) {
        data.telephone = input['telephone'];
      }
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['nameBusiness'] != null) {
        data.nameBusiness = input['nameBusiness'];
      }
      if (input['tva'] != null) {
        data.tva = input['tva'];
      }
      if (input['qtyRavitailler'] != null) {
        data.qtyRavitailler = input['qtyRavitailler'];
      }
      repos.stocksGlobal.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-stocks-global/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.stocksGlobal.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page stocks-global n\'est pas trouvé'),
    );

    return router;
  }
}