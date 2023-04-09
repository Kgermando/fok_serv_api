import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/livraiason_history_model.dart';
import '../../repository/repository.dart';

class HistoryLivraisonHandlers {
  final Repository repos;

  HistoryLivraisonHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<LivraisonHistoryModel> data =
          await repos.historyLivraisons.getAllData(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late LivraisonHistoryModel data;
      try {
        data = await repos.historyLivraisons.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-history_livraison', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      LivraisonHistoryModel data = LivraisonHistoryModel(
          idProduct: input['idProduct'],
          quantity: input['quantity'],
          quantityAchat: input['quantityAchat'],
          priceAchatUnit: input['priceAchatUnit'],
          prixVenteUnit: input['prixVenteUnit'],
          unite: input['unite'],
          margeBen: input['margeBen'],
          tva: input['tva'],
          remise: input['remise'],
          qtyRemise: input['qtyRemise'],
          margeBenRemise: input['margeBenRemise'],
          qtyLivre: input['qtyLivre'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.historyLivraisons.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-history_livraison/', (Request request) async {
           dynamic input = jsonDecode(await request.readAsString());
      final editH = LivraisonHistoryModel.fromJson(input);
      LivraisonHistoryModel? data =
          await repos.historyLivraisons.getFromId(editH.id!); 

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
      if (input['remise'] != null) {
        data.remise = input['remise'];
      }
      if (input['qtyRemise'] != null) {
        data.qtyRemise = input['qtyRemise'];
      }
      if (input['margeBenRemise'] != null) {
        data.margeBenRemise = input['margeBenRemise'];
      }
      if (input['qtyLivre'] != null) {
        data.qtyLivre = input['qtyLivre'];
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
      if (input['business'] != null) {
        data.business = input['business'];
      }
      if (input['sync'] != null) {
        data.sync = input['sync'];
      }
      if (input['async'] != null) {
        data.async = input['async'];
      }
      repos.historyLivraisons.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-history_livraison/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.historyLivraisons.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page historyLivraisons n\'est pas trouvé'),
    );

    return router;
  }
}
