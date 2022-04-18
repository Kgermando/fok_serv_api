import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/achat_model.dart';
import '../../../repository/repository.dart';

class AchatsHandlers {
   final Repository repos;

  AchatsHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<AchatModel> data = await repos.achats.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AchatModel data;
      try {
        data = await repos.achats.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-achat', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      AchatModel data = AchatModel(
          idProduct: input['idProduct'],
          quantity: input['quantity'],
          quantityAchat: input['quantityAchat'],
          priceAchatUnit: input['priceAchatUnit'],
          prixVenteUnit: input['prixVenteUnit'],
          unite: input['unite'],
          created: DateTime.parse(input['created']),
          telephone: input['telephone'],
          succursale: input['succursale'],
          nameBusiness: input['nameBusiness'],
          tva: input['tva'],
          remise: input['remise'],
          qtyRemise: input['qtyRemise'],
          qtyLivre: input['qtyLivre']
        );
      try {
        await repos.achats.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-achat/<id>', (Request request, String id) async {
      var id = request.params['id'];
      AchatModel data = await repos.achats.getFromId(int.parse(id!));
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
      if (input['remise'] != null) {
        data.remise = input['remise'];
      }
      if (input['qtyRemise'] != null) {
        data.qtyRemise = input['qtyRemise'];
      }
      if (input['qtyLivre'] != null) {
        data.qtyLivre = input['qtyLivre'];
      }
      repos.achats.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-achat/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.achats.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page achats n\'est pas trouvé'),
    );

    return router;
  }
}