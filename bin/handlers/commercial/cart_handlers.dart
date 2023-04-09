import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/cart_model.dart';
import '../../repository/repository.dart';

class CartHandlers {
  final Repository repos;

  CartHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/<business>/<matricule>/', (Request request, String business, String matricule) async {
      List<CartModel> data = await repos.carts.getAllData(business, matricule);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CartModel data;
      try {
        data = await repos.carts.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-cart', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CartModel data = CartModel(
          idProductCart: input['idProductCart'],
          quantityCart: input['quantityCart'],
          priceCart: input['priceCart'],
          priceAchatUnit: input['priceAchatUnit'],
          unite: input['unite'],
          tva: input['tva'],
          remise: input['remise'],
          qtyRemise: input['qtyRemise'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
          createdAt: DateTime.parse(input['createdAt']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
        );
      try {
        await repos.carts.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-cart/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = CartModel.fromJson(input);
      CartModel? data =
          await repos.carts.getFromId(editH.id!); 

      if (input['idProductCart'] != null) {
        data.idProductCart = input['idProductCart'];
      }
      if (input['quantityCart'] != null) {
        data.quantityCart = input['quantityCart'];
      }
      if (input['priceCart'] != null) {
        data.priceCart = input['priceCart'];
      }
      if (input['priceAchatUnit'] != null) {
        data.priceAchatUnit = input['priceAchatUnit'];
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
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['createdAt'] != null) {
        data.createdAt = DateTime.parse(input['createdAt']);
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
      repos.carts.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-cart/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.carts.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.delete('/delete-all-cart/<signature>', (Request request, String signature) async {
      
      var signature = request.params['signature'];
      repos.carts.deleteAllData(signature!);
      return Response.ok('Panier vide');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page panier n\'est pas trouvé'),
    );

    return router;
  }
}