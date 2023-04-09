import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/stocks_global_model.dart';
import '../../repository/repository.dart';

class StockGlobalHandlers {
  final Repository repos;

  StockGlobalHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<StocksGlobalMOdel> data = await repos.stocksGlobal.getAllData(business);
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
          modeAchat: input['modeAchat'],
          tva: input['tva'],
          qtyRavitailler: input['qtyRavitailler'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.stocksGlobal.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-stocks-global/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = StocksGlobalMOdel.fromJson(input);
      StocksGlobalMOdel? data =
          await repos.stocksGlobal.getFromId(editH.id!); 

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
        data.modeAchat = input['modeAchat'];
      }
      if (input['tva'] != null) {
        data.tva = input['tva'];
      }
      if (input['qtyRavitailler'] != null) {
        data.qtyRavitailler = input['qtyRavitailler'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['business'] != null) {
        data.business = input['business'];
      }
      if (input['sync'] != null) {
        data.sync = input['sync'];
      }
      if (input['async'] != null) {
        data.async = input['async'];
      }
      repos.stocksGlobal.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-stocks-global/<id>',
        (Request request, String id) async {
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
